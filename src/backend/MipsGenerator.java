package backend;

import backend.Mips.*;
import frontend.visitor.visitor;
import middle.Code.MidCode;
import middle.Code.MidCodeList;
import middle.Symbol.FuncTable;
import middle.Symbol.Symbol;
import middle.Symbol.SymbolTable;
import middle.operand.Immediate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;


public class MipsGenerator {
    private static final int DATA_BASE_ADDRESS = 0x10010000;
    private static final int SAVED_STACK_SIZE = RegAlloc.REG_SAVED_PLACE.size() * 4;
    private RegAlloc regAlloc;
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


    public MipsGenerator(visitor visitor) {
        this.midCodeList = visitor.getMidCodeList();
        this.midCodes = midCodeList.getMidCodes();
        this.globalTable = visitor.getGlobalTable();
        this.strCons = visitor.getMidCodeList().strCons;
        this.funcMap = visitor.getFuncMap();
        this.funcTables = visitor.getFuncTables();
        this.depth2SymbolTable = visitor.getDepth2Table();
        this.regAlloc = new RegAlloc(mipsCodes);
    }

    public void calculateAddress() {
        for (FuncTable funcTable : funcTables) {
            funcTable.setStackSize();
            // System.out.println(funcTable.getName() + "  "+ funcTable.getStackSize());
        }
    }

    public MipsCodes getMipsCodes() {
        return mipsCodes;
    }

    public Symbol findSymbol(String name, SymbolTable symbolTable) {
        SymbolTable temp = symbolTable;
        while (temp != null) {
            if (temp.getSymbolMap().containsKey(name)) {
                return temp.getSymbolMap().get(name);
            } else temp = temp.getParent();
        }
        return null;
    }

    public void generateCode() {
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
                mipsCodes.addCode(new MipsCode("array_" + symbol.getName() + ": .space " + symbol.getArraySize() * 4));
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
                Symbol symbol = globalSymbolMap.get(midCode.getOperandName(midCode.getOperand1()));
                symbol.setAddress(symbol.getAddress() - globalSize);
                mipsCodes.addCode(new MipsCode("#<------- " + midCode + " ------->"));
                if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
                    Integer offset = midCode.getOperand1Index();
                    if (offset != null && !Objects.equals(midCode.getOperand2(), "0")) {
                        mipsCodes.addCode(new MipsCode("li $t0, " + ((Immediate) symbol.getArrayInit().get(offset)).getValue()));
                        mipsCodes.addCode(new MipsCode("sw $t0, array_" + symbol.getName() + "+" + offset * 4 + "($zero)"));
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
        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$sp", "$sp", -1 * funcMap.get("main").getStackSize())));
        mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.j, "func_label_main")));
        MidCode midCode;
        while (midcodeIndex < midCodes.size() && midCodes.get(midcodeIndex).getOperator().equals(MidCode.Op.FUNC)) {
            regAlloc.clear();
            midCode = midCodes.get(midcodeIndex);
            mipsCodes.addCode(new MipsCode("#" + midCode));
            mipsCodes.addCode(new MipsCode("func_label_" + midCode.getOperandName(midCode.getOperand1()) + ":"));
            FuncTable funcTable = funcMap.get(midCode.getOperandName(midCode.getOperand1()));
            curFuncTable = funcTable;
            //将函数参数从栈内加载到寄存器中
            midcodeIndex++;
            midCode = midCodes.get(midcodeIndex);
            //解析形参
            while (midCode.getOperator().equals(MidCode.Op.FORM_VAR_DEF)) {
                mipsCodes.addCode(new MipsCode("#<------- " + midCode + " ------->"));
                //获取参数的符号表项
                Symbol symbol = funcTable.getParamMap().get(midCode.getOperandName(midCode.getOperand1()));
                //获取参数的地址
                int address = symbol.getAddress();
                if (symbol.getSymbolType().equals(Symbol.SymbolType.Var)) {
                    regAlloc.allocRegister(symbol, true);
                } else if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
                    regAlloc.allocRegister(symbol, true);
                }
                midCode = midCodes.get(++midcodeIndex);
            }
            //进入函数体
            generateBlock();
            //返回
            if (!funcTable.isMain()) generateReturn(midCodes.get(midcodeIndex), null);
            midcodeIndex++; //end_func
            midcodeIndex++;
        }
    }


    public void generateBlock() {
        MidCode midCode = midCodes.get(midcodeIndex);
        //new block
        mipsCodes.addCode(new MipsCode("#<---- " + midCode + " ---->"));
        String blockLoc = midCode.getOperand1(); //block的位置
        SymbolTable curSymbolTable = depth2SymbolTable.get(blockLoc);
        midCode = midCodes.get(++midcodeIndex);
        while (!(midCode.getOperator().equals(MidCode.Op.END_BLOCK) && midCode.getOperand1().equals(blockLoc))) {
            int parseBlock = 0;
            mipsCodes.addCode(new MipsCode("#<---- " + midCode + " ---->"));

            //如果是变量定义或者赋值(由于符号表已经保存，所以这两步可以统一处理?)
            if (midCode.getOperator().equals(MidCode.Op.VAR_DEF) || midCode.getOperator().equals(MidCode.Op.CONST_DEF)
                    || midCode.getOperator().equals(MidCode.Op.ASSIGN)) {
                generateVarDefOrAssign(midCode, curSymbolTable);
            }

            //如果是计算型中间指令
            if (MidCode.arithOp.containsKey(midCode.getOperator())) {
                generateArith(midCode, curSymbolTable);
            }

            if (midCode.getOperator().equals(MidCode.Op.RETURN)) {
                generateReturn(midCode, curSymbolTable);
            }

            if (midCode.getOperator().equals(MidCode.Op.ARR_SAVE) || midCode.getOperator().equals(MidCode.Op.ARR_LOAD)) {
                generateArray(midCode, curSymbolTable);
            }

            if (midCode.getOperator().equals(MidCode.Op.NEW_BLOCK)) {
                generateBlock();
                parseBlock = 1;
            }

            if (midCode.getOperator().equals(MidCode.Op.PRI)) {
                generatePrint(midCode, curSymbolTable);
            }

            if (midCode.getOperator().equals(MidCode.Op.PRE_CALL)) {
                FuncTable funcTable = funcMap.get(midCode.getOperand1());
                mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$sp", "$sp",
                        -funcTable.getStackSize() - SAVED_STACK_SIZE)));
            }

            if (midCode.getOperator().equals(MidCode.Op.PUSH_PARA) ||
                    midCode.getOperator().equals(MidCode.Op.PUSH_PARA_ARR)) {
                generatePushPara(midCode, curSymbolTable);
            }

            if (midCode.getOperator().equals(MidCode.Op.FUNC_CALL)) {
                generateFuncCall(midCode, curSymbolTable, funcMap.get(midCode.getOperand1()));
            }
            midcodeIndex -= parseBlock;
            midCode = midCodes.get(++midcodeIndex);
        }
        mipsCodes.addCode(new MipsCode("#<---- " + midCode + " ---->")); //end_block
        midcodeIndex++;
    }

    private void generateReturn(MidCode midCode, SymbolTable curSymbolTable) {
        if (midCode.getOperand1() != null) {
            //获取返回值
            if (Immediate.checkImmediate(midCode.getOperand1())) {
                mipsCodes.addCode(new MipsCode("li $v0, " + midCode.getOperand1()));
            } else {
                Symbol symbol = findSymbol(midCode.getOperandName(midCode.getOperand1()), curSymbolTable);
                //获取返回值的寄存器
                String reg = regAlloc.getRegString(regAlloc.getRegOfSymbol(symbol, true));
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

    public void generateVarDefOrAssign(MidCode midCode, SymbolTable curSymbolTable) {
        Symbol symbol = findSymbol(midCode.getOperandName(midCode.getOperand1()), curSymbolTable);
        //如果是普通变量的赋值
        if (symbol.getSymbolType().equals(Symbol.SymbolType.Var)) {
            //目标寄存器不需要load
            int regSymbol = regAlloc.getRegOfSymbol(symbol, false);
            String assignValue = midCode.getOperand2();
            //如果是用变量赋值初始化，那么需要从寄存器中或者内存中读取
            //TODO::注意寄存器分配不能重合！

            if (assignValue != null && findSymbol(assignValue, curSymbolTable) != null) {
                Symbol assignSymbol = findSymbol(assignValue, curSymbolTable);
                int regAssign = regAlloc.getRegOfSymbol(assignSymbol, true);
                mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi,
                        regAlloc.getRegString(regSymbol), regAlloc.getRegString(regAssign), 0)));
            } else if (assignValue != null && Immediate.checkImmediate(assignValue)) {
                int initValue = Integer.parseInt(assignValue);
                if (initValue == 0) {
                    mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.move,
                            regAlloc.getRegString(regSymbol), "$zero")));
                } else {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi,
                            regAlloc.getRegString(regSymbol), "$zero", initValue)));
                }
            } else if (Objects.equals(assignValue, "%RTX")) {
                mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.move,
                        regAlloc.getRegString(regSymbol), "$v0")));
            }
        }
        // TODO::如果是数组的赋值
    }

    private void generatePrint(MidCode midCode, SymbolTable curSymbolTable) {
        String printValue = midCode.getOperand1();
        if (Immediate.checkImmediate(printValue)) {
            mipsCodes.addCode(new MipsCode("li $a0, " + printValue));
            mipsCodes.addCode(new MipsCode("li $v0, 1"));
        } else if (printValue.contains("#str")) {
            mipsCodes.addCode(new MipsCode("la $a0", printValue.substring(1)));
            mipsCodes.addCode(new MipsCode("li $v0, 4"));
        } else {
            Symbol symbol = findSymbol(midCode.getOperandName(printValue), curSymbolTable);
            int reg = regAlloc.getRegOfSymbol(symbol, true);
            mipsCodes.addCode(new MipsCode("move $a0, " + regAlloc.getRegString(reg)));
            mipsCodes.addCode(new MipsCode("li $v0, 1"));
        }
        mipsCodes.addCode(new MipsCode("syscall"));

    }

    public void generateArith(MidCode midCode, SymbolTable curSymbolTable) {
        //两个都是立即数的情况？
        String op1 = midCode.getOperand1();
        String regOp1 = null;
        String op2 = midCode.getOperand2();
        String regOp2 = null;
        if (!Immediate.checkImmediate(midCode.getOperand2())) {
            Symbol opSym2 = findSymbol(midCode.getOperandName(midCode.getOperand2()), curSymbolTable);
            if (opSym2.getSymbolType().equals(Symbol.SymbolType.Var)) {
                regOp2 = regAlloc.getRegString(regAlloc.getRegOfSymbol(opSym2, true));
            }
        }
        if (Immediate.checkImmediate(midCode.getOperand1())) {
            String temp = op1;
            op1 = op2;
            op2 = temp;
            regOp1 = regOp2;
            regOp2 = null;
        } else {
            Symbol opSym1 = findSymbol(midCode.getOperandName(midCode.getOperand1()), curSymbolTable);
            if (opSym1.getSymbolType().equals(Symbol.SymbolType.Var)) {
                regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(opSym1, true));
            }
        }
        Symbol result = findSymbol(midCode.getOperandName(midCode.getResult()), curSymbolTable);
        String regResult = regAlloc.getRegString(regAlloc.getRegOfSymbol(result, false));
        MidCode.Op operator = midCode.getOperator();
        switch (operator) {
            case ADD:
                if (regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.addu, regResult, regOp1, regOp2)));
                } else
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, regResult, regOp1, Integer.parseInt(op2))));
                break;
            case SUB:
                if (regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new RRInstr(RRInstr.RRI.subu, regResult, regOp1, regOp2)));
                } else
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, regResult, regOp1, -Integer.parseInt(op2))));
                break;
            case MUL:
                if (regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.mult, regOp1, regOp2)));
                } else {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$v1", "$zero", Integer.parseInt(op2))));
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.mult, regOp1, "$v1")));
                }
                mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.mflo, regResult))); //不考虑超过32位的情况
                break;
            case DIV:
                if (regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, regOp2)));
                } else {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$v1", "$zero", Integer.parseInt(op2))));
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, "$v1")));
                }
                mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.mflo, regResult))); //不考虑超过32位的情况
                break;
            case MOD:
                if (regOp2 != null) {
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, regOp2)));
                } else {
                    mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$v1", "$zero", Integer.parseInt(midCode.getOperand2()))));
                    mipsCodes.addCode(new MipsCode(new MulDivInstr(MulDivInstr.MDI.div, regOp1, "$v1")));
                }
                mipsCodes.addCode(new MipsCode(new MoveInstr(MoveInstr.MI.mfhi, regResult))); //不考虑超过32位的情况
                break;

            //TODO::其他的算术运算
            default:
                break;
        }

    }

    //LOAD OR SAVE ARRAY
    private void generateArray(MidCode midCode, SymbolTable curSymbolTable) {
        if (midCode.getOperator().equals(MidCode.Op.ARR_LOAD)) {
            Symbol op1 = findSymbol(midCode.getOperandName(midCode.getOperand1()), curSymbolTable);
            String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true));
            Symbol op2 = findSymbol(midCode.getOperandName(midCode.getOperand2()), curSymbolTable); //数组不需要分配寄存器
            String arrayOffset = midCode.getLSArrayIndex(midCode.getOperand2()).split("@")[0];
            if (!Immediate.checkImmediate(arrayOffset)) {
                //如果offset是变量，则需要加载
                Symbol arrayOffsetSymbol = findSymbol(arrayOffset, curSymbolTable);
                arrayOffset = regAlloc.getRegString(regAlloc.getRegOfSymbol(arrayOffsetSymbol, true));
            }
            //否则，直接作为立即数使用offset
            assert op2 != null;
            mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, regOp1, arrayOffset, "array_" + op2.getName())));
        } else if (midCode.getOperator().equals(MidCode.Op.ARR_SAVE)) {
            Symbol op1 = findSymbol(midCode.getOperandName(midCode.getOperand1()), curSymbolTable); //数组不需要分配寄存器
            String arrayOffset = midCode.getLSArrayIndex(midCode.getOperand1()).split("@")[0];
            //如果存入数组的不是立即数，则需要加载
            if (!Immediate.checkImmediate(midCode.getOperand2())) {
                Symbol op2 = findSymbol(midCode.getOperandName(midCode.getOperand2()), curSymbolTable);
                String regOp2 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op2, true));
                if (!Immediate.checkImmediate(arrayOffset)) {
                    //如果offset是变量，则需要加载
                    Symbol arrayOffsetSymbol = findSymbol(arrayOffset, curSymbolTable);
                    arrayOffset = regAlloc.getRegString(regAlloc.getRegOfSymbol(arrayOffsetSymbol, true));
                }
                //否则，直接作为立即数使用offset
                assert op1 != null;
                mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp2, arrayOffset, "array_" + op1.getName())));
            } else {
                mipsCodes.addCode(new MipsCode("li $v1, " + midCode.getOperand2()));
                mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", arrayOffset, "array_" + op1.getName())));
            }
        }
    }

    public void generatePushPara(MidCode midCode, SymbolTable curSymbolTable) {
        FuncTable funcTable = funcMap.get(midCode.getOperand2());
        Symbol param = funcTable.getParamMap().get(midCode.getResult());
        //如果传入的是立即数
        if (Immediate.checkImmediate(midCode.getOperand1())) {
            mipsCodes.addCode(new MipsCode("li $v1, " + midCode.getOperand1()));
            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress()))));
        } else {
            //如果传入的是变量（含数组元素）或者数组
            Symbol op1 = findSymbol(midCode.getOperandName(midCode.getOperand1()), curSymbolTable);
            if (op1.getSymbolType().equals(Symbol.SymbolType.Var)) {
                //如果不是数组元素
                String regOp1 = regAlloc.getRegString(regAlloc.getRegOfSymbol(op1, true));
                mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, regOp1, "$sp", String.valueOf(param.getAddress()))));
                //如果是数组元素(不存在这种情况)，中间代码会有LOAD这一步骤
            } else if (op1.getSymbolType().equals(Symbol.SymbolType.Array)) {
                String index = midCode.getLSArrayIndex(midCode.getOperand1());
                if (index == null) {
                    //如果是二维数组或一维数组
                    mipsCodes.addCode(new MipsCode("li $v1, " + "0x" + Integer.toHexString(op1.getArrayAddress() + DATA_BASE_ADDRESS)));
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress()))));
                } else {
                    //如果是二维数组的一部分
                    //如果是立即数
                    if (Immediate.checkImmediate(index)) {
                        int immIndex = Integer.parseInt(index);
                        mipsCodes.addCode(new MipsCode("li $v1, " + "0x" + Integer.toHexString(op1.getArrayAddress() + immIndex * 4 + DATA_BASE_ADDRESS)));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress()))));
                    } else {
                        Symbol symIndex = findSymbol(index, curSymbolTable);
                        String regIndex = regAlloc.getRegString(regAlloc.getRegOfSymbol(symIndex, true));
                        mipsCodes.addCode(new MipsCode(new ShiftInstr(ShiftInstr.ShiftInstruction.sll, regIndex, regIndex, "2")));
                        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$v1", "$v1", op1.getArrayAddress() + DATA_BASE_ADDRESS)));
                        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$v1", "$sp", String.valueOf(param.getAddress()))));
                    }
                }
            }
        }
    }

    private void generateFuncCall(MidCode midCode, SymbolTable curSymbolTable, FuncTable funcTable) {
        //funcTable为被调用函数
        ArrayList<Integer> allocatedIntReg = new ArrayList<>(regAlloc.getAllocatedRegs().keySet());
        allocatedIntReg.sort(Integer::compareTo);
        if (!curFuncTable.isMain()) {
            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, "$ra", "$sp", String.valueOf(funcTable.getStackSize()))));
        }
        for (Integer reg : allocatedIntReg) {
            String strReg = regAlloc.getRegString(reg);
            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw, strReg, "$sp", String.valueOf(funcTable.getStackSize() + RegAlloc.REG_SAVED_PLACE.get(strReg)))));
        }
        mipsCodes.addCode(new MipsCode(new JumpInstr(JumpInstr.JI.jal, "func_label_" + funcTable.getName())));
        for (Integer reg : allocatedIntReg) {
            String strReg = regAlloc.getRegString(reg);
            mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, strReg, "$sp", String.valueOf(funcTable.getStackSize() + RegAlloc.REG_SAVED_PLACE.get(strReg)))));
        }
        if (!curFuncTable.isMain()) {
            mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw, "$ra", "$sp", String.valueOf(funcTable.getStackSize()))));
        }
        mipsCodes.addCode(new MipsCode(new RIInstr(RIInstr.RII.addi, "$sp", "$sp", funcTable.getStackSize() + SAVED_STACK_SIZE)));
    }


}
