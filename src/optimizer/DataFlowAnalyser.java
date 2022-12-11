package optimizer;

import frontend.visitor.Visitor;
import middle.Code.MidCode;
import middle.Symbol.Symbol;
import middle.operand.Immediate;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

import static java.util.stream.Collectors.toList;

public class DataFlowAnalyser {
    private HashMap<Symbol, ArrayList<Integer>> symbolDefines = new HashMap<>();
    private HashMap<MidCode, HashSet<Symbol>> midCodeUses = new HashMap<>();
    private HashMap<MidCode, Symbol> midCodeDefines = new HashMap<>();
    private HashMap<MidCode, ArrayList<Integer>> midCodeKills = new HashMap<>();
    private HashMap<MidCode, HashSet<Symbol>> midCodeActiveOut = new HashMap<>();

    public DataFlowAnalyser() throws IOException {
    }


    public void dataFlowAnalyse(Visitor visitor, BlockAnalyser blockAnalyser) throws IOException {
        setSymbolDefines(visitor);
        reachDefineAnalyse(visitor, blockAnalyser);
        setMidCodeUses(visitor);
        activeVarAnalyse(visitor, blockAnalyser);
    }

    /*
        put(Op.ADD, "ADD");
        put(Op.SUB, "SUB");
        put(Op.MUL, "MUL");
        put(Op.DIV, "DIV");
        put(Op.MOD, "MOD");
        put(Op.SLL, "SLL");
        put(Op.SRL, "SRL");
        put(Op.ASSIGN, "ASSIGN");
        put(Op.GETINT, "GETINT");
        put(Op.VAR_DEF, "VAR_DEF");
        put(Op.FORM_VAR_DEF, "FORM_VAR_DEF");
     */
    //找出所有符号的定义或者被赋值的位置,不考虑数组，全局变量，常量
    public Symbol getMidCodeDefineSymbol(MidCode midCode, Visitor visitor) {
        Symbol symbol = null;
        if (MidCode.defineOp.containsKey(midCode.getOperator())) {
            //如果是算术运算符
            if ((MidCode.arithOp.containsKey(midCode.getOperator()) ||
                    midCode.getOperator().equals(MidCode.Op.SET)) &&
                    !Immediate.checkImmediate(midCode.getResult())) {
                symbol = visitor.findSymbol(midCode.getResult());
            }
            //其他情况为第一个操作数
            else if (!Immediate.checkImmediate(midCode.getOperand1())) {
                symbol = visitor.findSymbol(midCode.getOperand1());
            }
        }
        if (!isAbleToAnalyse(symbol)) symbol = null;
        return symbol;
    }

    public void setSymbolDefines(Visitor visitor) throws IOException {
        Writer writer = new FileWriter("symbolDefines.txt", false);
        this.symbolDefines = new HashMap<>();
        this.midCodeKills = new HashMap<>();
        this.midCodeDefines = new HashMap<>();
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        for (int i = 0; i < midCodes.size(); i++) {
            MidCode midCode = midCodes.get(i);
            Symbol symbol = getMidCodeDefineSymbol(midCode, visitor);
            //对于全局变量和数组不处理
            if (symbol == null) continue;
            if (!symbolDefines.containsKey(symbol)) symbolDefines.put(symbol, new ArrayList<>());
            symbolDefines.get(symbol).add(i);
            midCodeDefines.put(midCode, symbol);
        }
        //输出信息
        for (Symbol symbol : symbolDefines.keySet()) {
            writer.write(symbol.getName() + " " + symbolDefines.get(symbol) + "\n");
        }
        writer.flush();
        for (int i = 0; i < midCodes.size(); i++) {
            MidCode midCode = midCodes.get(i);
            Symbol symbol = getMidCodeDefineSymbol(midCode, visitor);
            if (symbol == null) continue;
            ArrayList<Integer> kills = new ArrayList<>();
            for (int j : symbolDefines.get(symbol)) {
                if (j != i) kills.add(j);
            }
            midCodeKills.put(midCode, kills);
        }
    }

    //到达定义分析
    //in[B] = U out[P](所有B的前驱P)
    //out[B] = in[B] - kill[B] + gen[B]
    // kill[B] = U kill[d1],kill[d2],...kill[dn](d1~dn为基本块B中的定义)
    // gen[B] = gen[dn] U (gen[dn-1] - kill[dn]) U (gen[dn-2] - kill[dn-1] - kill[dn]) U
    // ... U (gen[d1] - kill[d2] - kill[d3] - ... - kill[dn]) (d1~dn为基本块B中的定义)
    public void reachDefineAnalyse(Visitor visitor, BlockAnalyser blockAnalyser) throws IOException {
        Writer writer = new FileWriter("reachDefine.txt", false);
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        for (FuncBlock funcBlock : blockAnalyser.getFuncBlocks()) {
            for (int i = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                BasicBlock block = funcBlock.getBasicBlocks().get(i);
                HashSet<Integer> blockKill = new HashSet<>();
                HashSet<Integer> blockGen = new HashSet<>();
                ArrayList<MidCode> blockMidCodes = block.getMidCodes();
                for (MidCode midCode : blockMidCodes) {
                    if (midCodeKills.containsKey(midCode) && !midCodeKills.get(midCode).isEmpty()) {
                        blockKill.addAll(midCodeKills.get(midCode));
                    }
                }
                for (int j = blockMidCodes.size() - 1; j >= 0; j--) {
                    if (!MidCode.defineOp.containsKey(blockMidCodes.get(j).getOperator())) continue;
                    HashSet<Integer> gen = new HashSet<>();
                    HashSet<Integer> kills = new HashSet<>();
                    for (int k = j + 1; k < blockMidCodes.size(); k++) {
                        MidCode midCode = blockMidCodes.get(k);
                        if (midCodeKills.containsKey(midCode) && !midCodeKills.get(midCode).isEmpty()) {
                            kills.addAll(midCodeKills.get(midCode));
                        }
                    }
                    gen.add(midCodes.indexOf(blockMidCodes.get(j)));
                    gen.removeAll(kills);
                    blockGen.addAll(gen);
                }
                block.addGenDefines(blockGen);
                block.addKillDefines(blockKill);
                //输出信息
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " kill " + blockKill + '\n');
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " gen " + blockGen + '\n');
            }
            //进行块之间的到达定义分析，迭代直到所有的块的in和out不再变化
            boolean flag = true;
            while (flag) {
                flag = false;
                for (int i = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                    BasicBlock block = funcBlock.getBasicBlocks().get(i);
                    HashSet<Integer> in = new HashSet<>();
                    for (BasicBlock preBlock : block.getBefores()) {
                        if (!preBlock.getOutDefines().isEmpty()) in.addAll(preBlock.getOutDefines());
                    }
                    HashSet<Integer> out = new HashSet<>(in);
                    out.removeAll(block.getKillDefines());
                    out.addAll(block.getGenDefines());
                    if (!block.getInDefines().equals(in) || !block.getOutDefines().equals(out)) flag = true;
                    block.setInDefines(in);
                    block.setOutDefines(out);
                }
            }
            //输出信息
            for (int i = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                BasicBlock block = funcBlock.getBasicBlocks().get(i);
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " in " + block.getInDefines() + '\n');
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " out " + block.getOutDefines() + '\n');
            }
            writer.flush();
        }
    }

    public boolean isAbleToAnalyse(Symbol symbol) {
        //只对变量分析，且不能是数组变量，由visitor.findSymbol的写法，offset一定是空
        return symbol != null && symbol.getSymbolType().equals(Symbol.SymbolType.Var) && symbol.getOffset() == null
                && !symbol.isGlobal() && !symbol.isConst();
    }


    //建立中间代码使用的符号表
    public void setMidCodeUses(Visitor visitor) throws IOException {
        this.midCodeUses = new HashMap<>();
        Writer writer = new FileWriter("midCodeUses.txt", false);
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        for (MidCode midCode : midCodes) {
            //先统计所有出现过的变量
            HashSet<Symbol> symbols = new HashSet<>();
            ArrayList<String> operands = new ArrayList<String>() {{
                add(midCode.getOperand1());
                add(midCode.getOperand2());
            }};
            if (midCode.getOperator().equals(MidCode.Op.ASSIGN) ||
                    midCode.getOperator().equals(MidCode.Op.VAR_DEF) ||
                    midCode.getOperator().equals(MidCode.Op.FORM_VAR_DEF) ||
                    midCode.getOperator().equals(MidCode.Op.GETINT) ||
                    midCode.getOperator().equals(MidCode.Op.ARR_LOAD)){
                operands.remove(midCode.getOperand1());
            }

            for (String op : operands) {
                if (op == null) {
                    continue;
                }
                if (op.contains("@<")) {
                    Symbol symbol = visitor.findSymbol(op);
                    if (isAbleToAnalyse(symbol)) {
                        symbols.add(symbol);
                    }
                }
                //如果是数组
                if (op.contains("[") && op.contains("]")) {
                    String arrayOffset = midCode.getLSArrayIndex(op);
                    Symbol symbol = visitor.findSymbol(arrayOffset);
                    if (isAbleToAnalyse(symbol)) symbols.add(visitor.findSymbol(arrayOffset));
                }
            }
            //System.out.println(midCode + " " + operands + " " + symbols);
            midCodeUses.put(midCode, symbols);
        }
        //输出信息
        for (MidCode midCode : midCodes) {
            writer.write(midCode + " uses " + midCodeUses.get(midCode) + '\n');
            writer.write(midCode + " defines " + midCodeDefines.get(midCode) + '\n');
        }
        writer.flush();
    }

    //活跃变量分析
    public void activeVarAnalyse(Visitor visitor, BlockAnalyser blockAnalyser) throws IOException {
        Writer writer = new FileWriter("activeAnalyse.txt", false);
        for (FuncBlock funcBlock : blockAnalyser.getFuncBlocks()) {
            for (int i = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                //先求出每个基本块的use和def
                BasicBlock block = funcBlock.getBasicBlocks().get(i);
                HashSet<Symbol> blockUse = new HashSet<>();
                HashSet<Symbol> blockDef = new HashSet<>();
                ArrayList<MidCode> blockMidCodes = block.getMidCodes();
                //use[B] 为基本块B中所有使用比任何定义早的变量
                //def[B] 为基本块B中所有定义比任何使用早的变量
                for (MidCode midCode : blockMidCodes) {
                    HashSet<Symbol> uses = midCodeUses.get(midCode);
                    Symbol def = midCodeDefines.get(midCode);
                    for (Symbol symbol : uses) {
                        if (!blockDef.contains(symbol)) {
                            blockUse.add(symbol);
                        }
                    }
                    if (def != null && !blockUse.contains(def)) {
                        blockDef.add(def);
                    }
                }
                block.setVarUse(blockUse);
                block.setVarDef(blockDef);
                //输出信息
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " use " + blockUse + '\n');
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " def " + blockDef + '\n');
            }

            //out[B] = U in[P]，P是B所有的后继基本块
            //in[B] = use[B] U (out[B] - def[B])
            //迭代直到基本块的in和out不再变化
            boolean flag = true;
            while (flag) {
                flag = false;
                for (int i = funcBlock.getBasicBlocks().size() - 1; i >= 0; i--) {
                    BasicBlock block = funcBlock.getBasicBlocks().get(i);
                    HashSet<Symbol> out = new HashSet<>();
                    for (BasicBlock afterBlock : block.getAfters()) {
                        if (!afterBlock.getActiveIn().isEmpty()) out.addAll(afterBlock.getActiveIn());
                    }
                    HashSet<Symbol> in = new HashSet<>(out);
                    in.removeAll(block.getVarDefines());
                    in.addAll(block.getVarUses());
                    if (!block.getActiveIn().equals(in) || !block.getActiveOut().equals(out)) flag = true;
                    block.setActiveIn(in);
                    block.setActiveOut(out);
                }
            }

            //输出信息
            for (int i = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                BasicBlock block = funcBlock.getBasicBlocks().get(i);
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " in " + block.getActiveIn() + '\n');
                writer.write("funcBlock " + funcBlock.getFuncName() + " block " + i + " out " + block.getActiveOut() + '\n');
            }
            writer.flush();
        }

    }

    //常量折叠
    public void constFold(Visitor visitor) throws IOException {
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        ArrayList<MidCode> newMidCodes = new ArrayList<>();
        for (MidCode midCode : midCodes) {
            if (MidCode.arithOp.containsKey(midCode.getOperator())) {
                String op1 = midCode.getOperand1();
                String op2 = midCode.getOperand2();
                String result = midCode.getResult();
                //add sub mul div mod
                if (Immediate.checkImmediate(op1) && Immediate.checkImmediate(op2)) {
                    if (midCode.getOperator().equals(MidCode.Op.ADD)) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) + Integer.parseInt(op2)), null));
                    } else if (midCode.getOperator().equals(MidCode.Op.SUB)) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) - Integer.parseInt(op2)), null));
                    } else if (midCode.getOperator().equals(MidCode.Op.MUL)) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) * Integer.parseInt(op2)), null));
                    } else if (midCode.getOperator().equals(MidCode.Op.DIV)) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) / Integer.parseInt(op2)), null));
                    } else if (midCode.getOperator().equals(MidCode.Op.MOD)) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) % Integer.parseInt(op2)), null));
                    }
                } else {
                    newMidCodes.add(midCode);
                }
            } else if (midCode.getOperator().equals(MidCode.Op.SET)) {
                String compare = midCode.getCompare();
                String op1 = midCode.getOperand1();
                String op2 = midCode.getOperand2();
                String result = midCode.getResult();
                if (Immediate.checkImmediate(op1) && Immediate.checkImmediate(op2)) {
                    if (compare.equals("==")) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) == Integer.parseInt(op2) ? 1 : 0), null));
                    } else if (compare.equals("!=")) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) != Integer.parseInt(op2) ? 1 : 0), null));
                    } else if (compare.equals("<")) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) < Integer.parseInt(op2) ? 1 : 0), null));
                    } else if (compare.equals("<=")) {
                        newMidCodes.add(new MidCode(MidCode.Op.ASSIGN, result, String.valueOf(Integer.parseInt(op1) <= Integer.parseInt(op2) ? 1 : 0), null));
                    }
                } else {
                    newMidCodes.add(midCode);
                }
            } else {
                newMidCodes.add(midCode);
            }
        }
        Writer writer2 = new FileWriter("constFold.txt");
        writer2.write("常量折叠后的中间代码：\n");
        for (MidCode midCode : newMidCodes) {
            writer2.write(midCode.toString() + '\n');
        }
        writer2.flush();
        visitor.getMidCodeList().setMidCodes(newMidCodes);
    }

    //复写传播
    public void propagation(Visitor visitor) throws IOException {
        Writer writer1 = new FileWriter("propagation.txt");
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        BlockAnalyser blockAnalyser = new BlockAnalyser(visitor);
        dataFlowAnalyse(visitor, blockAnalyser);
        ArrayList<MidCode> newMidCodes = new ArrayList<>();
        for (FuncBlock funcBlock : blockAnalyser.getFuncBlocks()) {
            for (int i = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                BasicBlock block = funcBlock.getBasicBlocks().get(i);
                ArrayList<MidCode> blockMidCodes = block.getMidCodes();
                HashSet<Integer> blockInDefines = block.getInDefines();

                for (int j = 0; j < blockMidCodes.size(); j++) {
                    MidCode midCode = blockMidCodes.get(j);
                    if (!midCodeUses.containsKey(midCode) || midCodeUses.get(midCode).isEmpty()) {
                        newMidCodes.add(midCode);
                        continue;
                    }
                    HashSet<Symbol> uses = midCodeUses.get(midCode);
                    HashMap<Symbol, String> replace = new HashMap<>();

                    for (Symbol useSymbol : uses) {
                        //ArrayList<Integer> defines = symbolDefines.get(useSymbol);
                        //defines为该变量的所有定义位置
                        ArrayList<Integer> defines = symbolDefines.get(useSymbol);
                        if (defines == null || defines.isEmpty()) continue;
                        int nearestDefine = -1;
                        //找到该基本块中最近的定义
                        for (int k = 0; k < j; k++) {
                            MidCode defineCode = blockMidCodes.get(k);
                            if (midCodeDefines.containsKey(defineCode) && midCodeDefines.get(defineCode) != null &&
                                    midCodeDefines.get(defineCode).equals(useSymbol)) {
                                nearestDefine = k;
                            }
                        }

                        //如果该基本块中有最近的定义
                        if (nearestDefine != -1) {
                            MidCode defineCode = blockMidCodes.get(nearestDefine);
                            if (checkPropagation(defineCode)) {
                                if (visitor.findSymbol(defineCode.getOperand2()) != null) {
                                    Symbol theSymbol = visitor.findSymbol(defineCode.getOperand2());
                                    System.out.println("theSymbol = " + theSymbol);
                                    //考察该定义是否被修改过
                                    int k = midCodes.indexOf(defineCode);
                                    int end = midCodes.indexOf(midCode);
                                    boolean flag = false;
                                    for (int l = k + 1; l < end; l++) {
                                        System.out.println("midCodes.get(l) = " + midCodes.get(l) + " " + midCodeDefines.get(midCodes.get(l)));
                                        if (midCodeDefines.containsKey(midCodes.get(l)) &&
                                                midCodeDefines.get(midCodes.get(l)) != null &&
                                                midCodeDefines.get(midCodes.get(l)).equals(theSymbol)) {
                                            flag = true;
                                            break;
                                        }
                                    }
                                    if (!theSymbol.isGlobal() && !flag) {
                                        replace.put(useSymbol, defineCode.getOperand2());
                                    }
                                } else {
                                    replace.put(useSymbol, defineCode.getOperand2());
                                }
                            }
                        } else {
                            //如果基本块中没有定义，就从in中查找，先求出inDefines和defines的交集
                            //只有当in中只有一个定义时才能进行传播
                            ArrayList<Integer> intersection = (ArrayList<Integer>) defines.stream().
                                    filter(blockInDefines::contains).collect(toList());
                            //System.out.println("use = " + useSymbol +  " intersection " + intersection);
                            if (intersection.size() == 1) {
                                MidCode defineCode = midCodes.get(intersection.get(0));
                                if ((defineCode.getOperator().equals(MidCode.Op.ASSIGN)
                                        || defineCode.getOperator().equals(MidCode.Op.VAR_DEF))
                                        && Immediate.checkImmediate(defineCode.getOperand2())) {
                                    replace.put(useSymbol, defineCode.getOperand2());
                                }

                                /*if (checkPropagation(defineCode)) {
                                    if (visitor.findSymbol(defineCode.getOperand2()) != null
                                            && isAbleToAnalyse(visitor.findSymbol(defineCode.getOperand2()))) {
                                        Symbol theSymbol = visitor.findSymbol(defineCode.getOperand2());
                                        System.out.println("theSymbol = " + theSymbol);
                                        //考察该定义是否可能被修改过
                                        int k = midCodes.indexOf(defineCode);
                                        int end = midCodes.indexOf(midCode);
                                        AtomicReference<Boolean> flag = new AtomicReference<>(false);
                                        symbolDefines.get(theSymbol).forEach(integer -> {
                                            if (integer >= k && integer < end) {
                                                flag.set(true);
                                            }
                                        });
                                        if (!theSymbol.isGlobal() && !flag.get()) {
                                            replace.put(useSymbol, defineCode.getOperand2());
                                        }
                                    } else {
                                        replace.put(useSymbol, defineCode.getOperand2());
                                    }
                                }*/

                            }
                        }
                    }
                    //替换原中间代码
                    //System.out.println(midCode);
                    if (!replace.isEmpty()) {
                        //System.out.println(midCode);
                        String op1 = midCode.getOperand1();
                        String op2 = midCode.getOperand2();
                        String result = midCode.getResult();
                        if (op1 != null && op1.contains("@<") && replace.containsKey(visitor.findSymbol(op1))) {
                            op1 = replace.get(visitor.findSymbol(op1));
                        }
                        if (op2 != null && op2.contains("@<") && replace.containsKey(visitor.findSymbol(op2))) {
                            //System.out.println("op2 = " + op2);
                            op2 = replace.get(visitor.findSymbol(op2));
                        }
                        if (midCode.getCompare() != null) {
                            String compare = midCode.getCompare();
                            newMidCodes.add(new MidCode(midCode.getOperator(), op1, op2, result, compare));
                        } else {
                            //System.out.println("op1: " + op1 + " op2: " + op2 + " result: " + result);
                            newMidCodes.add(new MidCode(midCode.getOperator(), op1, op2, result));
                        }
                    } else {
                        newMidCodes.add(midCode);
                    }
                }
            }
        }
        //输出信息
        writer1.write("复写传播后的中间代码：\n");
        for (MidCode midCode : newMidCodes) {
            writer1.write(midCode.toString() + "\n");
        }
        writer1.flush();
        visitor.getMidCodeList().setMidCodes(newMidCodes);
    }

    public boolean checkPropagation(MidCode midCode) {
        return (midCode.getOperator().equals(MidCode.Op.ASSIGN)
                || midCode.getOperator().equals(MidCode.Op.VAR_DEF))
                && midCode.getOperand2() != null
                && !Objects.equals(midCode.getOperand2(), "%RTX");
    }


    //死代码删除
    public void deadCodeElimination(Visitor visitor) throws IOException {
        Writer writer = new FileWriter("deadCodeElimination.txt");
        ArrayList<MidCode> newMidCodes = new ArrayList<>();
        BlockAnalyser blockAnalyser = new BlockAnalyser(visitor);
        dataFlowAnalyse(visitor, blockAnalyser);
        midCodeActiveOut = new HashMap<>();
        for (FuncBlock funcBlock : blockAnalyser.getFuncBlocks()) {
            for (int i = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                BasicBlock block = funcBlock.getBasicBlocks().get(i);
                ArrayList<MidCode> blockMidCodes = block.getMidCodes();
                ArrayList<MidCode> newBlockMidCodes = new ArrayList<>();

                HashSet<Symbol> activeOut = new HashSet<>(block.getActiveOut());
                //System.out.println(funcBlock.getFuncName() + " " + block.getIndex()+ " activeOut: " + block.getActiveOut());
                for (int j = blockMidCodes.size() - 1; j >= 0; j--) {
                    MidCode midCode = blockMidCodes.get(j);
                    midCodeActiveOut.put(midCode, new HashSet<>(activeOut));
                    if (!midCodeUses.containsKey(midCode) || midCodeUses.get(midCode) == null
                            || midCode.getOperator().equals(MidCode.Op.GETINT)) {
                        newBlockMidCodes.add(midCode);
                        continue;
                    }
                    HashSet<Symbol> codeUses = midCodeUses.get(midCode);
                    if (midCodeDefines.get(midCode) != null &&
                            !midCode.getOperator().equals(MidCode.Op.FORM_VAR_DEF)) {
                        Symbol symbolDefine = midCodeDefines.get(midCode);
                        if (!activeOut.contains(symbolDefine)) {
                            //System.out.println(activeOut);
                            //System.out.println("delete code : " + midCode);
                            continue;
                        } else {
                            activeOut.remove(symbolDefine);
                            if (!codeUses.isEmpty()) activeOut.addAll(codeUses);
                        }
                    }
                    if (!codeUses.isEmpty()) activeOut.addAll(codeUses);
                    newBlockMidCodes.add(midCode);
                }
                Collections.reverse(newBlockMidCodes);
                newMidCodes.addAll(newBlockMidCodes);
            }
        }
        //输出信息
        writer.write("死代码删除后的中间代码：\n");
        for (MidCode midCode : newMidCodes) {
            writer.write(midCode.toString() + "\n");
        }
        writer.flush();

        visitor.getMidCodeList().setMidCodes(newMidCodes);
    }

    //循环不变量外提
    public void loopInvariant(Visitor visitor) throws IOException {
        Writer writer = new FileWriter("loopInvariant.txt");
        ArrayList<MidCode> newMidCodes = new ArrayList<>();
        HashMap<Integer, ArrayList<MidCode>> allNewLoopCodes = new HashMap<>();
        BlockAnalyser blockAnalyser = new BlockAnalyser(visitor);
        dataFlowAnalyse(visitor, blockAnalyser);
        //先确定循环换区间
        //从GEN: while_judge_label_i开始，到GEN: while_end_label_i结束
        HashMap<Integer, ArrayList<MidCode>> loopMidCodes = new HashMap<>();
        for (MidCode midCode : visitor.getMidCodeList().getMidCodes()) {
            if (midCode.getOperator().equals(MidCode.Op.GEN_LABEL) && midCode.getOperand1().contains("while_judge_label")) {
                int loopIndex = Integer.parseInt(midCode.getOperand1().substring(18, midCode.getOperand1().length() - 1));
                String endLabel = "while_end_label_" + loopIndex + ":";
                ArrayList<MidCode> loopCodes = new ArrayList<>();
                loopMidCodes.put(loopIndex, loopCodes);
                int i = visitor.getMidCodeList().getMidCodes().indexOf(midCode);
                while (i < visitor.getMidCodeList().getMidCodes().size()) {
                    MidCode code = visitor.getMidCodeList().getMidCodes().get(i);
                    if (code.getOperator().equals(MidCode.Op.GEN_LABEL) && code.getOperand1().equals(endLabel)) {
                        loopCodes.add(code);
                        break;
                    }
                    loopCodes.add(code);
                    i++;
                }
            }
        }
        /*for (int i : loopMidCodes.keySet()) {
            System.out.println(loopMidCodes.get(i));
        }*/

        for (int i : loopMidCodes.keySet()) {
            // 识别循环不变量
            ArrayList<MidCode> loopCodes = loopMidCodes.get(i);
            int begin = visitor.getMidCodeList().getMidCodes().indexOf(loopCodes.get(0));
            int end = visitor.getMidCodeList().getMidCodes().indexOf(loopCodes.get(loopCodes.size() - 1));
            ArrayList<MidCode> invariantCodes = new ArrayList<>();
            for (MidCode midCode : loopCodes) {
                if (midCode.getOperator().equals(MidCode.Op.PUSH_PARA_ARR) ||
                        midCode.getOperator().equals(MidCode.Op.PUSH_PARA) ||
                        midCode.getOperator().equals(MidCode.Op.JUMP_IF) ||
                        midCode.getOperator().equals(MidCode.Op.PRI) ||
                        inTheIfBlock(visitor.getMidCodeList().getMidCodes(), midCode)) {
                    //System.out.println(inTheIfBlock(visitor.getMidCodeList().getMidCodes(), midCode));
                    continue;
                }
                boolean flag = false;
                HashSet<Symbol> usedSymbols = midCodeUses.get(midCode);
                if (usedSymbols == null || usedSymbols.isEmpty()) continue;
                for (Symbol symbol : usedSymbols) {
                    if (checkGap(begin, end, symbol)) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    invariantCodes.add(midCode);
                }
            }
            //System.out.println("loopInvariant: " + invariantCodes);
            ArrayList<MidCode> newLoopCodes = new ArrayList<>(invariantCodes);
            for (MidCode midCode : loopCodes) {
                if (!invariantCodes.contains(midCode)) {
                    newLoopCodes.add(midCode);
                }
            }
            allNewLoopCodes.put(i, newLoopCodes);
        }

        //需要一层一层的外提
        for (int i = 0; i < visitor.getMidCodeList().getMidCodes().size(); i++) {
            MidCode midCode = visitor.getMidCodeList().getMidCodes().get(i);
            if (midCode.getOperator().equals(MidCode.Op.GEN_LABEL) && midCode.getOperand1().contains("while_judge_label")) {
                int loopIndex = Integer.parseInt(midCode.getOperand1().substring(18, midCode.getOperand1().length() - 1));
                newMidCodes.addAll(allNewLoopCodes.get(loopIndex));
                i += allNewLoopCodes.get(loopIndex).size() - 1;
            } else {
                newMidCodes.add(midCode);
            }
        }


        //输出信息
        writer.write("循环不变式外提后的中间代码：\n");
        for (MidCode midCode : newMidCodes) {
            writer.write(midCode.toString() + "\n");
        }
        writer.flush();

        visitor.getMidCodeList().setMidCodes(newMidCodes);
    }


    public HashMap<MidCode, HashSet<Symbol>> getMidCodeActiveOut() {
        return midCodeActiveOut;
    }

    public boolean checkGap(int begin,int end, Symbol symbol) {
        AtomicReference<Boolean> flag = new AtomicReference<>(false);
        symbolDefines.get(symbol).forEach(integer -> {
            if (integer >= begin && integer < end) {
                flag.set(true);
            }
        });
        return flag.get();
    }

    /*public boolean ableToOut(MidCode midCode) {
        return midCode.getOperator().equals(MidCode.Op.VAR_DEF) ||
                 midCode.getOperator().equals(MidCode.Op.ARR_LOAD) ||
                    midCode.getOperator().equals(MidCode.Op.ARR_STORE) ||
    }*/

    public boolean inTheIfBlock(ArrayList<MidCode> midCodes, MidCode midCode) {
        int index = midCodes.indexOf(midCode);
        int beginIndex = -2;
        int endIndex = -1;
        //从midCode开始往下找，分别找最接近的ifElse_begin_label和ifElse_end_label
        int i = index;
        while (i < midCodes.size()) {
            if (midCodes.get(i).getOperator().equals(MidCode.Op.GEN_LABEL) && midCodes.get(i).getOperand1().contains("ifElse_begin_label_")) {
                beginIndex = Integer.parseInt(midCodes.get(i).getOperand1().substring(19,20));
                break;
            }
            i++;
        }
        i = index;
        while (i < midCodes.size()) {
            if (midCodes.get(i).getOperator().equals(MidCode.Op.GEN_LABEL) && midCodes.get(i).getOperand1().contains("ifElse_end_label_")) {
                endIndex = Integer.parseInt(midCodes.get(i).getOperand1().substring(17,18));
                break;
            }
            i++;
        }
        //System.out.println("beginIndex: " + beginIndex + " endIndex: " + endIndex);
        return beginIndex > endIndex;
    }

}



