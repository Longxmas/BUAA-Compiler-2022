package backend;

import backend.Mips.LoadInstr;
import backend.Mips.MipsCode;
import backend.Mips.MipsCodes;
import backend.Mips.StoreInstr;
import middle.Code.MidCode;
import middle.Code.MidCodeList;
import middle.Symbol.Symbol;
import optimizer.DataFlowAnalyser;
import optimizer.tempVarChecker;

import java.util.*;

public class RegAlloc {
    private MipsCodes mipsCodes;
    private DataFlowAnalyser dataFlowAnalyser;
    private int pointer = 0;
    // 可用来自由分配的寄存器：从 t0($8) 到 t9($25); v0($2)为函数返回值, v1($3)存储立即数, a0($4)作为系统调用参数, a1($5)用来计算地址
    // gp($28)为全局指针, sp($29)为栈指针, fp($30)为帧指针, ra($31)为返回地址
    public static final ArrayList<Integer> allocatableRegs =
            new ArrayList<>(Arrays.asList(6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,26,27, 30));

    public RegAlloc(MipsCodes mipsCodes, DataFlowAnalyser dataFlowAnalyser) {
        this.mipsCodes = mipsCodes;
        this.dataFlowAnalyser = dataFlowAnalyser;
    }

    public static HashMap<Integer, String> intReg2SymReg = new HashMap<Integer, String>() {{
        put(3, "$v1");
        put(5, "$a1");
        put(6, "$a2");
        put(7, "$a3");
        put(8, "$t0");
        put(9, "$t1");
        put(10, "$t2");
        put(11, "$t3");
        put(12, "$t4");
        put(13, "$t5");
        put(14, "$t6");
        put(15, "$t7");
        put(16, "$t8");
        put(17, "$t9");
        put(18, "$s0");
        put(19, "$s1");
        put(20, "$s2");
        put(21, "$s3");
        put(22, "$s4");
        put(23, "$s5");
        put(24, "$s6");
        put(25, "$s7");
        put(26, "$k0");
        put(27, "$k1");
        put(30, "$fp");
    }};

    // 当前可自由分配的寄存器
    private final HashSet<Integer> freeRegs = new HashSet<>(allocatableRegs);

    // 已分配的寄存器对应的符号
    private final HashMap<Integer, Symbol> allocatedRegs = new HashMap<>();

    // 符号对应到寄存器
    private final HashMap<Symbol, Integer> symbolToReg = new HashMap<>();

    // 获取符号当前所在的寄存器，如果尚未被分配，则分配一个寄存器并返回
    public int getRegOfSymbol(Symbol symbol, boolean needToLoad, MidCode midCode) {
        if (!symbolToReg.containsKey(symbol)) {
            return allocRegister(symbol, needToLoad, midCode);
        }
        return symbolToReg.get(symbol);
    }

    public String getRegString(int reg) {
        return intReg2SymReg.get(reg);
    }


    // 为变量符号分配寄存器, 返回分配的寄存器号
    // 如果没有空余的寄存器，则需要将一个已分配的寄存器的值存入内存，然后再分配
    public int allocRegister(Symbol symbol, boolean needToLoad, MidCode midCode) {
        //如果已经分配了寄存器，则直接返回
        if (symbolToReg.containsKey(symbol)) {
            return symbolToReg.get(symbol);
        }

        // 如果没有空余的寄存器
        if (freeRegs.isEmpty()) {
            //System.out.println("pointer: " + pointer);
            //取消该寄存器的分配
            pointer++;
            int reg = allocatableRegs.get(pointer % allocatableRegs.size());
            cancelAlloc(reg, midCode);
        }
        // 获取一个空闲寄存器
        int register = freeRegs.iterator().next();
        freeRegs.remove(register);
        // 将寄存器分配给符号
        allocatedRegs.put(register, symbol);
        // 记录符号对应的寄存器
        symbolToReg.put(symbol, register);
        //System.out.println("set true allocated : " + allocatableRegs.indexOf(symbolToReg.get(symbol))
        // + " symbol : " + symbol + " pointer : " + pointer);
        // 如果需要加载，则加载
        mipsCodes.addCode(new MipsCode("#<---- Alloc " + intReg2SymReg.get(register) +
                " which index is " + allocatableRegs.indexOf(register) + " for " + symbol.getName() + " ---->"));
        //System.out.println("#<---- Alloc " + intReg2SymReg.get(register) + " for " + symbol.getName() + " ---->");
        if (needToLoad) {
            mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw,
                    intReg2SymReg.get(register), symbol.isGlobal() ? "$gp" : "$sp", String.valueOf(symbol.getAddress()))));
        }
        return register;
    }

    // 取消某个寄存器的分配
    public void cancelAlloc(int register, MidCode midCode) {
        if (!allocatedRegs.containsKey(register)) {
            return;
        }
        Symbol symbol = allocatedRegs.get(register);
        freeRegs.add(register);
        mipsCodes.addCode(new MipsCode("#<---- Cancel " + intReg2SymReg.get(register) +
                " which index is " + allocatableRegs.indexOf(register) + " for " + symbol.getName() + " ---->"));
        //将符号写回内存
        if (symbol.isGlobal() || needToStore(midCode, symbol)) {
            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw,
                    intReg2SymReg.get(register), symbol.isGlobal() ? "$gp" : "$sp", String.valueOf(symbol.getAddress()))));
        }
        allocatedRegs.remove(register);
        symbolToReg.remove(symbol);
    }

    // 清空分配状态
    public void clear(boolean needToStore, MidCode midCode, ArrayList<Symbol> excepts) {
        if (needToStore) {
            HashSet<Integer> regSet = new HashSet<>(allocatedRegs.keySet());
            for (int reg : regSet) {
                Symbol symbol = allocatedRegs.get(reg);
                if (excepts.contains(symbol) && !needToStore(midCode, symbol)) {
                    continue;
                } else if (excepts.contains(symbol) && needToStore(midCode, symbol)) {
                    mipsCodes.addCode(new MipsCode("#<---- Cancel " + intReg2SymReg.get(reg) +
                            " which index is " + allocatableRegs.indexOf(reg) + " for " + symbol.getName() + " ---->"));
                    mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw,
                            intReg2SymReg.get(reg), symbol.isGlobal() ? "$gp" : "$sp", String.valueOf(symbol.getAddress()))));
                } else {
                    cancelAlloc(reg, midCode);
                }
                pointer = 0;
            }
        } else {
            allocatedRegs.clear();
            symbolToReg.clear();
            freeRegs.clear();
            freeRegs.addAll(allocatableRegs);
            pointer = 0;
        }
    }

    private boolean needToStore(MidCode midCode, Symbol symbol) {
        ///System.out.println("midcode = " + midCode + " symbol = " + symbol);
        //System.out.println(this.dataFlowAnalyser.getMidCodeActiveOut().get(midCode));
        //if (symbol.isTemp()) return tempVarChecker.needToStore(midCodeList.getMidCodes(), symbol, midCode);
        if (!this.dataFlowAnalyser.getMidCodeActiveOut().containsKey(midCode)
                || this.dataFlowAnalyser.getMidCodeActiveOut().get(midCode).isEmpty()) return true;
        return this.dataFlowAnalyser.getMidCodeActiveOut().get(midCode).contains(symbol);
    }

}

