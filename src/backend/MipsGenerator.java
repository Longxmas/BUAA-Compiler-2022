package backend;

import backend.Mips.*;
import frontend.visitor.visitor;
import middle.Code.MidCode;
import middle.Code.MidCodeList;
import middle.Symbol.FuncTable;
import middle.Symbol.Symbol;
import middle.Symbol.SymbolTable;
import middle.operand.Immediate;
import optimizer.MulDivOptimizer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Objects;


public class MipsGenerator {
    private static final int DATA_BASE_ADDRESS = 0x10010000;
    //public static final int SAVED_STACK_SIZE = RegAlloc.REG_SAVED_PLACE.size() * 4;
    public RegAlloc regAlloc;
    private MipsCodes mipsCodes = new MipsCodes();
    private MidCodeList midCodeList;
    private ArrayList<MidCode> midCodes;
    private HashMap<String, Integer> globalArrayMap = new HashMap<>();
    public int globalSize = 0;
    public SymbolTable globalTable;
    HashMap<String, Symbol> globalSymbolMap = new HashMap<>();
    private ArrayList<String> strCons;
    private FuncTable curFuncTable;
    private HashMap<String, FuncTable> funcMap;
    private ArrayList<FuncTable> funcTables;
    private int midcodeIndex = 0;
    public HashMap<String, SymbolTable> depth2SymbolTable;
    public static HashMap<MidCode, ArrayList<Symbol>> code2Symbols = new HashMap<>();
    private boolean multDivOptimize = true;

    public MipsGenerator(visitor visitor) {
        this.midCodeList = visitor.getMidCodeList();
        this.midCodes = midCodeList.getMidCodes();
        this.globalTable = visitor.getGlobalTable();
        this.strCons = visitor.getMidCodeList().strCons;
        this.funcMap = visitor.getFuncMap();
        this.funcTables = visitor.getFuncTables();
        this.depth2SymbolTable = visitor.getDepth2Table();
        this.regAlloc = new RegAlloc(mipsCodes, midCodeList);
    }

    public void calculateAddress() {
        for (FuncTable funcTable : funcTables) {
            funcTable.setStackSize();
            System.out.println(funcTable.getName() + "  " + funcTable.getStackSize());
        }
    }

    public MipsCodes getMipsCodes() {
        return mipsCodes;
    }

    public Symbol findSymbol(String symbol) {
        if (Immediate.checkImmediate(symbol) || symbol.equals("%RTX")) {
            return null;
        }
        //如果是数组变量或者低维数组，将获取母数组
        String name = MidCode.getOperandName(symbol);
        String loc = MidCode.getOperandLoc(symbol);
        SymbolTable symbolTable = depth2SymbolTable.get(loc);
        return symbolTable.getSymbolMap().get(name);
    }

    public void setMidCodeSymbols() {
        for (MidCode midCode : this.midCodeList.getMidCodes()) {
            ArrayList<Symbol> symbols = new ArrayList<>();
            ArrayList<String> operands = new ArrayList<String>() {{
                add(midCode.getOperand1());
                add(midCode.getOperand2());
                add(midCode.getResult());
            }};
            for (String op : operands) {
                if (op == null) {
                    continue;
                }
                if (op.contains("@<")) {
                    symbols.add(findSymbol(op));
                }
                if (op.contains("[") && op.contains("]")) {
                    String arrayOffset = midCode.getLSArrayIndex(op);
                    if (findSymbol(arrayOffset) != null) symbols.add(findSymbol(arrayOffset));
                }
            }
            //System.out.println("symbols = " + symbols);
            code2Symbols.put(midCode, symbols);
        }
    }

    public static ArrayList<Symbol> getMidCodeSymbols(MidCode midCode) {
        return code2Symbols.get(midCode);
    }

    public void generateCode() {
        setMidCodeSymbols();
        globalArrayInit();
        globalVarInit();
        generateFunc();
    }

    //设置全局数组的地址，生成label
    private void globalArrayInit() {
        mipsCodes.addCode(new MipsCode(".data"));
        int addr = 0;
        int arrAddr = 0;
        for (Symbol symbol : globalTable.getSymbols()) {
            symbol.setAddress(addr);
            if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
                mipsCodes.addCode(new MipsCode("array_" + symbol.getName() + "_: .space " + symbol.getArraySize() * 4));
                globalArrayMap.put(symbol.getName(), addr);
                symbol.setArrayAddress(arrAddr);
                addr += symbol.getArraySize() * 4;
                arrAddr += symbol.getArraySize() * 4;
            } else {
                addr += 4;
            }
            if (symbol.getName().indexOf('#') == -1) {
                globalSize += symbol.getSymbolType().equals(Symbol.SymbolType.Array) ? symbol.getArraySize() * 4 : 4;
            }
        }
        for (int i = 0; i < strCons.size(); i++) {
            mipsCodes.addCode(new MipsCode("str" + i + ": .asciiz " + strCons.get(i)));
        }
    }

    //实现全局变量的初始化
    private void globalVarInit() {
        mipsCodes.addCode(new MipsCode(".text"));
        if (globalSize > 0) mipsCodes.addCode(new MipsCode("addi $gp, $gp, " + globalSize));
        ArrayList<Symbol> globalSymbols = globalTable.getSymbols();
        for (Symbol symbol : globalSymbols) {
            globalSymbolMap.put(symbol.getName(), symbol);
        }
        for (MidCode midCode : midCodeList.getMidCodes()) {
            midcodeIndex = midCodeList.getMidCodes().indexOf(midCode);
            if (midCode.getOperator().equals(MidCode.Op.VAR_DEF) ||
                    midCode.getOperator().equals(MidCode.Op.CONST_DEF)) {
                Symbol symbol = globalSymbolMap.get(MidCode.getOperandName(midCode.getOperand1()));
                symbol.setAddress(symbol.getAddress() - globalSize);
                mipsCodes.addCode(new MipsCode("#<------- " + midCode + " ------->"));
                if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
                    Integer offset = midCode.getOperand1Index();
                    if (offset != null && !Objects.equals(midCode.getOperand2(), "0")) {
                        mipsCodes.addCode(new MipsCode("li $t0, " + ((Immediate) symbol.getArrayInit().get(offset)).getValue()));
                        if (offset != 0)
                            mipsCodes.addCode(new MipsCode("sw $t0, array_" + symbol.getName() + "_+" + offset * 4));
                        else mipsCodes.addCode(new MipsCode("sw $t0, array_" + symbol.getName() + "_"));
                    }
                } else if (symbol.getSymbolType().equals(Symbol.SymbolType.Var) && ((Immediate) symbol.getVarInit()).getValue() != 0) {
                    mipsCodes.addCode(new MipsCode("li $t0, " + ((Immediate) symbol.getVarInit()).getValue()));
                    mipsCodes.addCode(new MipsCode("sw $t0, " + symbol.getAddress() + "($gp)"));
                }
            } else {
                break;
            }
        }
    }

    //生成函数目标代码
    public void generateFunc() {
        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$sp", "$sp", -1 * funcMap.get("main").getStackSize())));
        mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.j, "func_label_main")));
        MidCode midCode;
        while (midcodeIndex < midCodes.size() && midCodes.get(midcodeIndex).getOperator().equals(MidCode.Op.FUNC)) {
            //解析函数的时候，只是在解析，并没有调用，不会对寄存器产生实质的影响，不需要写回
            midCode = midCodes.get(midcodeIndex);
            mipsCodes.addCode(new MipsCode("#" + midCode));
            mipsCodes.addCode(new MipsCode("func_label_" + MidCode.getOperandName(midCode.getOperand1()) + ":"));
            FuncTable funcTable = funcMap.get(MidCode.getOperandName(midCode.getOperand1()));
            curFuncTable = funcTable;
            //将函数参数从栈内加载到寄存器中
            midcodeIndex++;
            midCode = midCodes.get(midcodeIndex);
            regAlloc.clear(false, midCode, new ArrayList<>());
            //解析形参
            while (midCode.getOperator().equals(MidCode.Op.FORM_VAR_DEF)) {
                mipsCodes.addCode(new MipsCode("#<------- " + midCode + " ------->"));
                //获取参数的符号表项
                Symbol symbol = funcTable.getParamMap().get(MidCode.getOperandName(midCode.getOperand1()));
                //获取参数的地址
                int address = symbol.getAddress();
                if (symbol.getSymbolType().equals(Symbol.SymbolType.Var)) {
                    regAlloc.allocRegister(symbol, true, midCode);
                } else if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
                    regAlloc.allocRegister(symbol, true, midCode);
                }
                midCode = midCodes.get(++midcodeIndex);
            }
            //进入函数体
            generateBlock();
            //返回
            if (!funcTable.isMain()) generateReturn(midCodes.get(midcodeIndex));
            midcodeIndex++; //end_func
            midcodeIndex++;
        }
    }


    public void generateBlock() {
        //每次进入一个块，需要解除映射并且写回，否则if-else和while等控制语句会出现问题，离开时也需要？
        //regAlloc.clear(false);
        MidCode midCode = midCodes.get(midcodeIndex);
        //new block
        String blockLoc = midCode.getOperand1(); //block的位置
        SymbolTable curSymbolTable = depth2SymbolTable.get(blockLoc);
        midCode = midCodes.get(++midcodeIndex);
        while (!(midCode.getOperator().equals(MidCode.Op.END_BLOCK) && midCode.getOperand1().equals(blockLoc))) {
            int parseBlock = 0;
            mipsCodes.addCode(new MipsCode("#<---- " + midCode + " ---->"));

            //如果是变量定义或者赋值(由于符号表已经保存，所以这两步可以统一处理?)
            if (midCode.getOperator().equals(MidCode.Op.VAR_DEF) || midCode.getOperator().equals(MidCode.Op.CONST_DEF)
                    || midCode.getOperator().equals(MidCode.Op.ASSIGN)) {
                generateVarDefOrAssign(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.GETINT)) {
                generateGetint(midCode);
            }

            //如果是计算型中间指令
            if (MidCode.arithOp.containsKey(midCode.getOperator())) {
                generateArith(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.RETURN)) {
                generateReturn(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.ARR_SAVE) || midCode.getOperator().equals(MidCode.Op.ARR_LOAD)) {
                generateArray(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.NEW_BLOCK)) {
                generateBlock();
                parseBlock = 1;
            }

            if (midCode.getOperator().equals(MidCode.Op.PRI)) {
                generatePrint(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.PRE_CALL)) {
                FuncTable funcTable = funcMap.get(midCode.getOperand1());
                /*mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$sp", "$sp",
                        -funcTable.getStackSize())));*/
            }

            if (midCode.getOperator().equals(MidCode.Op.PUSH_PARA) ||
                    midCode.getOperator().equals(MidCode.Op.PUSH_PARA_ARR)) {
                generatePushPara(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.FUNC_CALL)) {
                generateFuncCall(midCode, funcMap.get(midCode.getOperand1().split("@")[0]));
            }

            if (midCode.getOperator().equals(MidCode.Op.SET)) {
                generateSet(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.JUMP) || midCode.getOperator().equals(MidCode.Op.JUMP_IF)) {
                regAlloc.clear(true, midCode, code2Symbols.get(midCode));
                generateJump(midCode);
            }

            if (midCode.getOperator().equals(MidCode.Op.GEN_LABEL)) {
                regAlloc.clear(true, midCode, new ArrayList<>());
                mipsCodes.addCode(new MipsCode(midCode.getOperand1()));
            }
            midcodeIndex -= parseBlock;
            midCode = midCodes.get(++midcodeIndex);
        }
        mipsCodes.addCode(new MipsCode("#<---- " + midCode + " ---->")); //end_block
        //if (!blockLoc.equals("[1, 0]")) regAlloc.clear(true);
        midcodeIndex++;
    }


    private void generateGetint(MidCode midCode) {
        Symbol symbol = findSymbol(midCode.getOperand1());
        regAlloc.allocRegister(symbol, true, midCode);
        mipsCodes.addCode(new MipsCode("li $v0, 5"));
        mipsCodes.addCode(new MipsCode("syscall"));
        //不会有数组的情况
        if (symbol.getSymbolType().equals(Symbol.SymbolType.Var)) {
            mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.move,
                    regAlloc.getRegString(regAlloc.getRegOfSymbol(symbol, true, midCode)), "$v0")));
            if (symbol.isGlobal()) mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v0",
                    "$gp", String.valueOf(symbol.getAddress()))));
        } else {
            System.out.println("error: getint for array");
        }
    }

    private void generateReturn(MidCode midCode) {
        if (midCode.getOperand1() != null) {
            //获取返回值
            if (Immediate.checkImmediate(midCode.getOperand1())) {
                mipsCodes.addCode(new MipsCode("li $v0, " + midCode.getOperand1()));
            } else {
                Symbol symbol = findSymbol(midCode.getOperand1());
                //获取返回值的寄存器
                String reg = regAlloc.getRegString(regAlloc.getRegOfSymbol(symbol, true, midCode));
                //将返回值放入$v0中
                mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.move, "$v0", reg)));
            }
        }
        //返回
        if (!curFuncTable.isMain()) {
            mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.jr, "$ra")));
        } else {
            mipsCodes.addCode(new MipsCode("li $v0, 10"));
            mipsCodes.addCode(new MipsCode("syscall"));
        }


    }

    public void generateVarDefOrAssign(MidCode midCode) {
        Symbol symbol = findSymbol(midCode.getOperand1());
        //如果是普通变量的赋值
        if (symbol.getSymbolType().equals(Symbol.SymbolType.Var)) {
            //目标寄存器不需要load
            String assignValue = midCode.getOperand2();
            Symbol assignSymbol = null;
            int regAssign = -1;
            if (assignValue != null) {
                assignSymbol = findSymbol(assignValue);
                if (assignSymbol != null) {
                    regAssign = regAlloc.getRegOfSymbol(assignSymbol, true, midCode);
                }
            }

            int regSymbol = regAlloc.getRegOfSymbol(symbol, false, midCode);
            //如果是用变量赋值初始化，那么需要从寄存器中或者内存中读取
            //TODO::注意寄存器分配不能重合！

            //System.out.println("assignValue: " + assignValue);
            if (assignValue != null && assignSymbol != null) {
                mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu,
                        regAlloc.getRegString(regSymbol), regAlloc.getRegString(regAssign), 0)));
            } else if (assignValue != null && Immediate.checkImmediate(assignValue)) {
                int initValue = Integer.parseInt(assignValue);
                if (initValue == 0) {
                    mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.move,
                            regAlloc.getRegString(regSymbol), "$zero")));
                } else {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu,
                            regAlloc.getRegString(regSymbol), "$zero", initValue)));
                }
            } else if (Objects.equals(assignValue, "%RTX")) {
                mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.move,
                        regAlloc.getRegString(regSymbol), "$v0")));
            }

            if (symbol.isGlobal()) {
                regAlloc.cancelAlloc(regSymbol, midCode);
            }
        }

        // TODO::如果是数组的赋值
        if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
            Integer offset = midCode.getOperand1Index();
            String assignValue = midCode.getOperand2();
            if (offset != null) {
                if (!symbol.isGlobal()) {
                    if (Immediate.checkImmediate(assignValue)) {
                        mipsCodes.addCode(new MipsCode("li $v1, " + assignValue));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1",
                                "$sp", String.valueOf(symbol.getAddress() + offset * 4))));
                    } else {
                        String assignReg = regAlloc.getRegString(regAlloc.getRegOfSymbol
                                (findSymbol(assignValue), true, midCode));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, assignReg,
                                "$sp", String.valueOf(symbol.getAddress() + offset * 4))));
                    }
                } else {
                    /*if (Immediate.checkImmediate(assignValue)) {
                        mipsCodes.addCode(new MipsCode("li $v1, " + assignValue));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1",
                                "$gp", String.valueOf(symbol.getAddress() + offset * 4))));
                    } else {
                        String assignReg = regAlloc.getRegString(regAlloc.getRegOfSymbol
                                (findSymbol(midCode.getOperandName(assignValue), curSymbolTable), true));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, assignReg,
                                "$gp", String.valueOf(symbol.getAddress() + offset * 4))));
                    }*/
                }


            }
        }
    }

    private void generatePrint(MidCode midCode) {
        String printValue = midCode.getOperand1();
        if (Immediate.checkImmediate(printValue)) {
            mipsCodes.addCode(new MipsCode("li $a0, " + printValue));
            mipsCodes.addCode(new MipsCode("li $v0, 1"));
        } else if (printValue.contains("#str")) {
            mipsCodes.addCode(new MipsCode("la $a0", printValue.substring(1)));
            mipsCodes.addCode(new MipsCode("li $v0, 4"));
        } else {
            Symbol symbol = findSymbol(printValue);
            int reg = regAlloc.getRegOfSymbol(symbol, true, midCode);
            mipsCodes.addCode(new MipsCode("move $a0, " + regAlloc.getRegString(reg)));
            mipsCodes.addCode(new MipsCode("li $v0, 1"));
        }
        mipsCodes.addCode(new MipsCode("syscall"));

    }

    public void generateArith(MidCode midCode) {
        //两个都是立即数的情况？
        String op1 = midCode.getOperand1();
        Integer immOp1 = Immediate.checkImmediate(op1) ? Integer.parseInt(op1) : null;
        String regOp1 = null;
        String op2 = midCode.getOperand2();
        Integer immOp2 = Immediate.checkImmediate(op2) ? Integer.parseInt(op2) : null;
        String regOp2 = null;
        if (!Immediate.checkImmediate(midCode.getOperand2())) {
            Symbol opSym2 = findSymbol(midCode.getOperand2());
            if (opSym2.getSymbolType().equals(Symbol.SymbolType.Var)) {
                regOp2 = regAlloc.getRegString(regAlloc.getRegOfSymbol(opSym2, true, midCode));
            }
        }
        if (!Immediate.checkImmediate(midCode.getOperand1())) {
            Symbol opSym1 = findSymbol(midCode.getOperand1());
            if (opSym1.getSymbolType().equals(Symbol.SymbolType.Var)) {
                regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(opSym1, true, midCode));
            }
        }
        Symbol result = findSymbol(midCode.getResult());
        String regResult = regAlloc.getRegString(regAlloc.getRegOfSymbol(result, false, midCode));
        MidCode.Op operator = midCode.getOperator();
        switch (operator) {
            case ADD:
                if (regOp1 != null && regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, regResult, regOp1, regOp2)));
                } else if (regOp1 != null && immOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, regResult, regOp1, Integer.parseInt(op2))));
                } else if (regOp2 != null && immOp1 != null) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, regResult, regOp2, Integer.parseInt(op1))));
                } else if (immOp1 != null && immOp2 != null) {
                    mipsCodes.addCode(new MipsCode("li " + regResult + ", " + (immOp1 + immOp2)));
                }
                break;
            case SUB:
                if (regOp1 != null && regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.subu, regResult, regOp1, regOp2)));
                } else if (regOp1 != null && Immediate.checkImmediate(op2)) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, regResult, regOp1, -Integer.parseInt(op2))));
                } else if (regOp2 != null && Immediate.checkImmediate(op1)) {
                    mipsCodes.addCode(new MipsCode("li $v1, " + op1));
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.subu, regResult, "$v1", regOp2)));
                } else if (immOp1 != null && immOp2 != null) {
                    mipsCodes.addCode(new MipsCode("li " + regResult + ", " + (immOp1 - immOp2)));
                }
                break;
            case MUL:
                boolean flag = true;
                if (regOp1 != null && regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.mult, regOp1, regOp2)));
                } else if (regOp1 != null && Immediate.checkImmediate(op2)) {
                    flag = generateMulCode(op2, regOp1, regResult);
                } else if (regOp2 != null && Immediate.checkImmediate(op1)) {
                    flag = generateMulCode(op1, regOp2, regResult);
                } else if (immOp1 != null && immOp2 != null) {
                    flag = false;
                    mipsCodes.addCode(new MipsCode("li " + regResult + ", " + (immOp1 * immOp2)));
                }
                if (flag)
                    mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.mflo, regResult))); //不考虑超过32位的情况
                break;
            case DIV:
                flag = true;
                if (regOp1 != null && regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, regOp2)));
                } else if (regOp1 != null && Immediate.checkImmediate(op2)) {
                    if (!multDivOptimize) {
                        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$zero", Integer.parseInt(op2))));
                        mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, "$v1")));
                    } else {
                        MulDivOptimizer mulDivOptimizer = new MulDivOptimizer(this);
                        ArrayList<MipsCode> optimizeCodes = mulDivOptimizer.generateCodeFromDiv(midCode);
                        mipsCodes.getMipsCodes().addAll(optimizeCodes);
                        flag = false;
                    }
                } else if (regOp2 != null && Immediate.checkImmediate(op1)) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$zero", Integer.parseInt(op1))));
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, "$v1", regOp2)));
                } else if (immOp1 != null && immOp2 != null) {
                    flag = false;
                    mipsCodes.addCode(new MipsCode("li " + regResult + ", " + (immOp1 / immOp2)));
                }
                if (flag)
                    mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.mflo, regResult))); //不考虑超过32位的情况
                break;
            case MOD:
                flag = true;
                if (regOp1 != null && regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, regOp2)));
                } else if (regOp1 != null && Immediate.checkImmediate(op2)) {
                    if (!multDivOptimize) {
                        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$zero", Integer.parseInt(midCode.getOperand2()))));
                        mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, "$v1")));
                    } else {
                        MulDivOptimizer mulDivOptimizer = new MulDivOptimizer(this);
                        ArrayList<MipsCode> optimizeCodes = mulDivOptimizer.generateCodeFromMod(midCode);
                        mipsCodes.getMipsCodes().addAll(optimizeCodes);
                        flag = false;
                    }
                } else if (regOp2 != null && Immediate.checkImmediate(op1)) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$zero", Integer.parseInt(midCode.getOperand1()))));
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, "$v1", regOp2)));
                } else if (immOp1 != null && immOp2 != null) {
                    flag = false;
                    mipsCodes.addCode(new MipsCode("li " + regResult + ", " + (immOp1 % immOp2)));
                }
                if (flag) mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.mfhi, regResult))); //不考虑超过32位的情况
                break;

            //TODO::其他的算术运算
            default:
                break;
        }

    }

    private boolean generateMulCode(String op1, String regOp2, String regResult) {
        int i = Integer.parseInt(op1);
        if (MulDivOptimizer.isPowerOfTwo(i)) {
            if(i == 0) {
                mipsCodes.addCode(new MipsCode("li " + regResult + ", 0"));
            } else if (i == 1) {
                mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.move, regResult, regOp2)));
            } else {
                mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.sll, regResult, regOp2, MulDivOptimizer.getPowerOfTwo(i))));
            }
            return false;
        } else {
            mipsCodes.addCode(new MipsCode("li $v1, " + op1));
            mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.mult, regOp2, "$v1")));
            return true;
        }
    }

    //LOAD OR SAVE ARRAY
    private void generateArray(MidCode midCode) {
        if (midCode.getOperator().equals(MidCode.Op.ARR_LOAD)) {
            Symbol op1 = findSymbol(midCode.getOperand1());
            String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, false, midCode));
            Symbol op2 = findSymbol(midCode.getOperand2()); //数组不需要分配寄存器
            String arrayOffset = midCode.getLSArrayIndex(midCode.getOperand2());
            //System.out.println(midCode + "\n" + "before : arrayOffset: " + arrayOffset);
            arrayOffset = dealWithOffset(arrayOffset, midCode);
            //System.out.println(midCode + "\n" + "after : arrayOffset: " + arrayOffset + " isGlobal : " + op2.isGlobal());
            //否则，直接作为立即数使用offset
            assert op2 != null;
            if (op2.isGlobal() && !Immediate.checkImmediate(arrayOffset)) {
                mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, regOp1, arrayOffset, "array_" + op2.getName() + "_")));
            } else if (op2.isGlobal() && Immediate.checkImmediate(arrayOffset)) {
                mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, regOp1, null, "array_" + op2.getName() + "_+" + arrayOffset)));
            } else if (!op2.isGlobal() && Immediate.checkImmediate(arrayOffset) && !op2.isParam()) {
                mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, regOp1, "$sp", String.valueOf(op2.getAddress() + Integer.parseInt(arrayOffset)))));
            } else if (!op2.isGlobal() && !Immediate.checkImmediate(arrayOffset) && !op2.isParam()) {
                mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$sp", op2.getAddress())));
                mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", "$v1", arrayOffset))); // 位置
                mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, regOp1, "$v1", "0")));
            } else if (!op2.isGlobal() && Immediate.checkImmediate(arrayOffset) && op2.isParam()) {
                String regOp2 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op2, true, midCode));
                mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, regOp1, regOp2, String.valueOf(Integer.parseInt(arrayOffset)))));
            } else if (!op2.isGlobal() && !Immediate.checkImmediate(arrayOffset) && op2.isParam()) {
                String regOp2 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op2, true, midCode));
                mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", regOp2, arrayOffset))); // 位置
                mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, regOp1, "$v1", "0")));
            }
        }
        if (midCode.getOperator().equals(MidCode.Op.ARR_SAVE)) {
            Symbol op1 = findSymbol(midCode.getOperand1()); //局部数组需要分配寄存器
            String arrayOffset = midCode.getLSArrayIndex(midCode.getOperand1());
            arrayOffset = dealWithOffset(arrayOffset, midCode);
            //如果存入数组的不是立即数，则需要加载
            if (!Immediate.checkImmediate(midCode.getOperand2())) {
                Symbol op2 = findSymbol(midCode.getOperand2());
                String regOp2 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op2, true, midCode));

                //否则，直接作为立即数使用offset
                assert op1 != null;
                if (op1.isGlobal() && !Immediate.checkImmediate(arrayOffset)) {
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp2, arrayOffset, "array_" + op1.getName() + "_")));
                } else if (op1.isGlobal() && Immediate.checkImmediate(arrayOffset)) {
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp2, null, "array_" + op1.getName() + "_+" + arrayOffset)));
                } else if (!op1.isGlobal() && Immediate.checkImmediate(arrayOffset) && !op1.isParam()) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$sp", op1.getAddress())));
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp2, "$v1", arrayOffset)));
                } else if (!op1.isGlobal() && !Immediate.checkImmediate(arrayOffset) && !op1.isParam()) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$sp", op1.getAddress())));
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", "$v1", arrayOffset))); // 位置
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp2, "$v1", "0")));
                } else if (!op1.isGlobal() && Immediate.checkImmediate(arrayOffset) && op1.isParam()) {
                    String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp2, regOp1, String.valueOf(Integer.parseInt(arrayOffset)))));
                } else if (!op1.isGlobal() && !Immediate.checkImmediate(arrayOffset) && op1.isParam()) {
                    String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", regOp1, arrayOffset))); // 位置
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp2, "$v1", "0")));
                }
            } else {
                //如果存入数组的是立即数，则直接存入，如果不是全局数组，需要先计算数组地址 $sp + address + arrayOffset
                mipsCodes.addCode(new MipsCode("li $v1, " + midCode.getOperand2()));
                if (op1.isGlobal() && !Immediate.checkImmediate(arrayOffset)) {
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", arrayOffset, "array_" + op1.getName() + "_")));
                } else if (op1.isGlobal() && Immediate.checkImmediate(arrayOffset)) {
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", null, "array_" + op1.getName() + "_+" + arrayOffset)));
                } else if (!op1.isGlobal() && Immediate.checkImmediate(arrayOffset) && !op1.isParam()) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v0", "$sp", op1.getAddress())));
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$v0", arrayOffset)));
                } else if (!op1.isGlobal() && !Immediate.checkImmediate(arrayOffset) && !op1.isParam()) {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v0", "$sp", op1.getAddress())));
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v0", "$v0", arrayOffset))); // 位置
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$v0", "0")));
                } else if (!op1.isGlobal() && Immediate.checkImmediate(arrayOffset) && op1.isParam()) {
                    String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", regOp1, String.valueOf(Integer.parseInt(arrayOffset)))));
                } else if (!op1.isGlobal() && !Immediate.checkImmediate(arrayOffset) && op1.isParam()) {
                    String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v0", regOp1, arrayOffset))); // 位置
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$v0", "0")));
                }
            }
        }
    }

    private String dealWithOffset(String arrayOffset, MidCode midCode) {
        if (!Immediate.checkImmediate(arrayOffset)) {
            //如果offset是变量，则需要加载
            Symbol arrayOffsetSymbol = findSymbol(arrayOffset);
            arrayOffset = regAlloc.getRegString(regAlloc.getRegOfSymbol(arrayOffsetSymbol, true, midCode)); //替换为寄存器
            mipsCodes.addCode(new MipsCode(new ShiftInstr(ShiftInstr.ShiftInstruction.sll, "$a1", arrayOffset, "2")));
            return "$a1";
        } else {
            return String.valueOf(Integer.parseInt(arrayOffset) * 4);
        }
    }

    private int getNestedStackSize(MidCode midCode) {
        int index = midCodes.indexOf(midCode);
        int stackSize = 0;
        MidCode midCode1 = midCode;

        while (!midCode1.getOperator().equals(MidCode.Op.FUNC)) {
            if (midCode1.getOperator().equals(MidCode.Op.PRE_CALL)) {
                stackSize += funcMap.get(midCode1.getOperand1().split("@")[0]).getStackSize();
            } else if (midCode1.getOperator().equals(MidCode.Op.FUNC_CALL)) {
                stackSize -= funcMap.get(midCode1.getOperand1().split("@")[0]).getStackSize();
            }
            midCode1 = midCodes.get(--index);
        }
        return stackSize;
    }

    public void generatePushPara(MidCode midCode) {
        int stackSize = getNestedStackSize(midCode);
        FuncTable funcTable = funcMap.get(midCode.getOperand2().split("@")[0]);
        Symbol param = funcTable.getParamMap().get(midCode.getResult());
        //如果传入的是立即数
        if (Immediate.checkImmediate(midCode.getOperand1())) {
            mipsCodes.addCode(new MipsCode("li $v1, " + midCode.getOperand1()));
            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp",
                    String.valueOf(param.getAddress() - stackSize))));
        } else {
            //如果传入的是变量（含数组元素）或者数组
            Symbol op1 = findSymbol(midCode.getOperand1());
            if (op1.getSymbolType().equals(Symbol.SymbolType.Var)) {
                //如果不是数组元素
                String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp1, "$sp",
                        String.valueOf(param.getAddress() - stackSize))));
                //如果是数组元素(不存在这种情况)，中间代码会有LOAD这一步骤
            }
            if (op1.getSymbolType().equals(Symbol.SymbolType.Array)) {
                String index = midCode.getLSArrayIndex(midCode.getOperand1());
                if (index == null) {
                    //如果是二维数组或一维数组
                    if (op1.isGlobal()) {
                        mipsCodes.addCode(new MipsCode("li $v1, " + "0x" + Integer.toHexString(op1.getArrayAddress() + DATA_BASE_ADDRESS)));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw,
                                "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                    } else if (!op1.isParam()) {
                        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$sp", op1.getAddress())));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw,
                                "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                    } else {
                        String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw,
                                regOp1, "$sp", String.valueOf(param.getAddress() - stackSize))));
                    }
                } else {
                    //如果是二维数组的一部分
                    //如果是立即数
                    if (Immediate.checkImmediate(index)) {
                        int immIndex = Integer.parseInt(index);
                        if (op1.isGlobal()) {
                            mipsCodes.addCode(new MipsCode("li $v1, " + "0x" + Integer.toHexString(op1.getArrayAddress() + immIndex * 4 + DATA_BASE_ADDRESS)));
                            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                        } else if (!op1.isParam()) {
                            mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$sp", op1.getAddress() + immIndex * 4)));
                            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                        } else {
                            String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                            mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", regOp1, immIndex * 4)));
                            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                        }
                    } else {
                        String regIndex = dealWithOffset(index, midCode);
                        if (op1.isGlobal()) {
                            mipsCodes.addCode(new MipsCode("li $v1, " + "0x" + Integer.toHexString(op1.getArrayAddress() + DATA_BASE_ADDRESS)));
                            mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", "$v1", regIndex)));
                            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                        } else if (!op1.isParam()) {
                            mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$v1", "$sp", op1.getAddress())));
                            mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", "$v1", regIndex)));
                            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                        } else {
                            String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true, midCode));
                            mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", regOp1, regIndex)));
                            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress() - stackSize))));
                        }
                    }
                }
            }
        }
    }

    private void generateFuncCall(MidCode midCode, FuncTable funcTable) {
        //funcTable为被调用函数
        int stackSize = getNestedStackSize(midCodes.get(midCodes.indexOf(midCode) - 1));
        if (!curFuncTable.isMain()) {
            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$ra", "$sp", "0")));
        }
        /*for (Integer reg : allocatedIntReg) {
            Symbol symbol = regAlloc.getAllocatedRegs().get(reg);
            if (symbol.getSymbolType().equals(Symbol.SymbolType.Var) && symbol.isGlobal()) {
                regAlloc.cancelAlloc(reg);
            } else {
                String strReg = regAlloc.getRegString(reg);
                mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, strReg, "$sp",
                        String.valueOf(funcTable.getStackSize() + RegAlloc.REG_SAVED_PLACE.get(strReg)))));
            }
        }*/
        regAlloc.clear(true, midCode, new ArrayList<>());
        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$sp", "$sp", -stackSize)));
        mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.jal, "func_label_" + funcTable.getName())));
        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addiu, "$sp", "$sp", stackSize)));
        /*for (Integer reg : regAlloc.getAllocatedRegs().keySet()) {
            String strReg = regAlloc.getRegString(reg);
            mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, strReg, "$sp", String.valueOf(funcTable.getStackSize() + RegAlloc.REG_SAVED_PLACE.get(strReg)))));
        }*/
        if (!curFuncTable.isMain()) {
            mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, "$ra", "$sp", "0")));
        }
    }

    private void generateSet(MidCode midCode) {
        // SET #T7 := #T6 < b@<1,2>
        // SET #T7 := #T6 <= 3
        // SET #T7 := 3 < #T5
        // SET #T7 := #T3 == 0
        // SET #T7 := #T3 != 0
        // 拓展指令真好用
        Symbol result = findSymbol(midCode.getResult());
        String regResult = regAlloc.getRegString(regAlloc.getRegOfSymbol(result, false, midCode));
        String op1 = midCode.getOperand1();
        String op2 = midCode.getOperand2();
        Symbol symOp1 = findSymbol(op1);
        Symbol symOp2 = findSymbol(op2);
        String regOp1 = symOp1 != null ? regAlloc.getRegString(regAlloc.getRegOfSymbol(symOp1, true, midCode)) : null;
        String regOp2 = symOp2 != null ? regAlloc.getRegString(regAlloc.getRegOfSymbol(symOp2, true, midCode)) : null;
        String immOp1 = Immediate.checkImmediate(op1) ? String.valueOf(Integer.parseInt(op1)) : "0";
        String immOp2 = Immediate.checkImmediate(op2) ? String.valueOf(Integer.parseInt(op2)) : "0";
        switch (midCode.getCompare()) {
            case "<":
                if (symOp1 != null && symOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.slt, regResult, regOp1, regOp2)));
                } else if (symOp1 != null) {
                    if (Integer.parseInt(immOp2) < 65536) {
                        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.slti, regResult, regOp1, Integer.parseInt(immOp2))));
                    } else {
                        mipsCodes.addCode(new MipsCode("li $v1, ", immOp2));
                        mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.slt, regResult, regOp1, "$v1")));
                    }
                } else {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.sgt, regResult, regOp2, immOp1)));
                }
                break;
            case "<=":
                if (regOp1 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.sle, regResult, regOp1, regOp2 != null ? regOp2 : immOp2)));
                } else {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.sge, regResult, regOp2, immOp1)));
                }
                break;
            case "==":
                if (regOp1 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.seq, regResult, regOp1, regOp2 != null ? regOp2 : immOp2)));
                } else {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.seq, regResult, regOp2, immOp1)));
                }
                break;
            case "!=":
                if (regOp1 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.sne, regResult, regOp1, regOp2 != null ? regOp2 : immOp2)));
                } else {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.sne, regResult, regOp2, immOp1)));
                }
            default:
                break;
        }
    }


    private void generateJump(MidCode midCode) {
        if (midCode.getOperator().equals(MidCode.Op.JUMP)) {
            mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.j, midCode.getOperand1())));
        } else {
            if (Immediate.checkImmediate(midCode.getOperand1())) {
                int i = Integer.parseInt(midCode.getOperand1());
                if (i == 1 && midCode.getOperand2().equals("== 1")) {
                    mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.j, midCode.getResult())));
                } else if (i == 0 && midCode.getOperand2().equals("== 0")) {
                    mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.j, midCode.getResult())));
                }
            } else {
                Symbol sym = findSymbol(midCode.getOperand1());
                String reg = regAlloc.getRegString(regAlloc.getRegOfSymbol(sym, true, midCode));
                if (midCode.getOperand2().equals("== 0")) {
                    mipsCodes.addCode(new MipsCode(new BranchInstr(BranchInstr.BI.beq, "0", reg, midCode.getResult())));
                } else if (midCode.getOperand2().equals("== 1")) {
                    mipsCodes.addCode(new MipsCode(new BranchInstr(BranchInstr.BI.beq, "1", reg, midCode.getResult())));
                }
            }
        }

    }

}