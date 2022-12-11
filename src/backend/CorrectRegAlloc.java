package backend;


import backend.Mips.LoadInstr;
import backend.Mips.MipsCode;
import backend.Mips.MipsCodes;
import backend.Mips.StoreInstr;
import middle.Code.MidCode;
import middle.Symbol.Symbol;
import optimizer.DataFlowAnalyser;

import java.util.*;
/**
 * 描述当前的寄存器分配状况的表, 将寄存器当成 Cache
 * 功能：查询是否有可用的寄存器, 将寄存器分配给符号, 查看符号是否有对应寄存器, 置换出寄存器用于分配
 */
public class CorrectRegAlloc {
    private MipsCodes mipsCodes;
    private DataFlowAnalyser dataFlowAnalyser;
    // 可用来自由分配的寄存器：从 t0($8) 到 t9($25); v0($2)为函数返回值, v1($3)存储立即数, a0($4)作为系统调用参数, a1($5)用来计算地址
    // gp($28)为全局指针, sp($29)为栈指针, fp($30)为帧指针, ra($31)为返回地址
    public static final ArrayList<Integer> allocatableRegs =
            new ArrayList<>(Arrays.asList(6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 30));

    // 当前未使用(可自由分配)的寄存器
    private final Set<Integer> freeRegs = new HashSet<>(allocatableRegs);

    // 已经分配出去的寄存器对应的符号
    private final Map<Integer, Symbol> allocatedRegs = new HashMap<>();
    // 符号对应到寄存器
    private final Map<Symbol, Integer> symbolToRegs = new HashMap<>();

    // 模拟 LRU 实现 Cache 置换
    private final LinkedHashSet<Integer> regCache = new LinkedHashSet<>();

    public CorrectRegAlloc(MipsCodes mipsCodes, DataFlowAnalyser dataFlowAnalyser) {
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

    // 为变量符号分配寄存器（必须有自由寄存器）, 返回分配的寄存器号
    public int allocRegister(Symbol symbol, boolean needToLoad, MidCode midCode) {
        // 一个变量只能占用一个寄存器
        if (symbolToRegs.containsKey(symbol)) {
            refresh(symbol);
            return symbolToRegs.get(symbol);
        }
        // 如果没有富余寄存器则报错
        if (freeRegs.isEmpty()) {
            int reg = regToReplace();
            cancelAlloc(reg, midCode);
        }
        // 获取一个空闲寄存器
        int register = freeRegs.iterator().next();
        freeRegs.remove(register);
        // 将寄存器分配给符号
        allocatedRegs.put(register, symbol);
        // 记录符号对应的寄存器
        symbolToRegs.put(symbol, register);
        // 将寄存器置入 Cache
        regCache.add(register);
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

    // 获取符号当前所在的寄存器
    public int getRegOfSymbol(Symbol symbol, boolean needToLoad, MidCode midCode) {
        if (!symbolToRegs.containsKey(symbol)) {
            return allocRegister(symbol, needToLoad, midCode);
        }
        return symbolToRegs.get(symbol);
    }


    // 获取可被换出的寄存器编号
    public int regToReplace() {
        assert !regCache.isEmpty();
        return regCache.iterator().next();
    }

    public String getRegString(int reg) {
        return intReg2SymReg.get(reg);
    }

    // 取消某个寄存器的分配
    public Symbol cancelAlloc(int register, MidCode midCode) {
        if (!allocatedRegs.containsKey(register)) {
            return null;
        }
        freeRegs.add(register);
        Symbol symbol = allocatedRegs.remove(register);
        mipsCodes.addCode(new MipsCode("#<---- Cancel " + intReg2SymReg.get(register) +
                " which index is " + allocatableRegs.indexOf(register) + " for " + symbol.getName() + " ---->"));
        //将符号写回内存
        if (symbol.isGlobal() || needToStore(midCode, symbol)) {
            mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw,
                    intReg2SymReg.get(register), symbol.isGlobal() ? "$gp" : "$sp", String.valueOf(symbol.getAddress()))));
        }
        symbolToRegs.remove(symbol);
        regCache.remove(register);
        return symbol;
    }

    // 清空分配状态
    public void clear(boolean needToStore, MidCode midCode, ArrayList<Symbol> excepts) {
        if (needToStore) {
            HashSet<Integer> regSet = new HashSet<>(allocatedRegs.keySet());
            for (int reg : regSet) {
                Symbol symbol = allocatedRegs.get(reg);
                if (excepts.contains(symbol)) {
                    continue;
                }
                cancelAlloc(reg, midCode);
            }
        } else {
            allocatedRegs.clear();
            symbolToRegs.clear();
            regCache.clear();
            freeRegs.clear();
            freeRegs.addAll(allocatableRegs);
        }
    }

    // 更新 LRU
    public void refresh(Symbol symbol) {
        int register = symbolToRegs.get(symbol);
        assert regCache.contains(register);
        regCache.remove(register);
        regCache.add(register);
    }

    private boolean needToStore(MidCode midCode, Symbol symbol) {
        //System.out.println("midcode = " + midCode + " symbol = " + symbol);
        //System.out.println(this.dataFlowAnalyser.getMidCodeActiveOut().get(midCode));
        if (!this.dataFlowAnalyser.getMidCodeActiveOut().containsKey(midCode)
                || this.dataFlowAnalyser.getMidCodeActiveOut().get(midCode).isEmpty()) return true;
        return this.dataFlowAnalyser.getMidCodeActiveOut().get(midCode).contains(symbol);
    }

}
