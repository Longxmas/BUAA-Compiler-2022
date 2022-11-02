package backend;

import middle.Symbol.Symbol;

import java.util.*;

public class RegAlloc {
    // 可用来自由分配的寄存器：从 t0($8) 到 t9($25); v0($2)为函数返回值, v1($3)存储立即数, a0($4)到a3($7)为函数调用参数
    // gp($28)为全局指针, sp($29)为栈指针, fp($30)为帧指针, ra($31)为返回地址
    private static final HashSet<Integer> allocatableRegs =
            new HashSet<>(Arrays.asList(8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25));


    // 当前可自由分配的寄存器
    private final HashSet<Integer> freeRegs = new HashSet<>(allocatableRegs);

    // 已分配的寄存器对应的符号
    private final HashMap<Integer, Symbol> allocatedRegs = new HashMap<>();

    // 符号对应到寄存器
    private final HashMap<Symbol, Integer> symbolToReg = new HashMap<>();

    private final LinkedHashSet<Integer> regCache = new LinkedHashSet<>();


    // 当前是否有未使用的寄存器
    public boolean hasFreeReg() {
        return !freeRegs.isEmpty();
    }

    // 在有自由寄存器的前提下, 为变量符号分配寄存器, 返回分配的寄存器号
    public int allocRegister(Symbol symbol) {
        if (symbolToReg.containsKey(symbol)) {
            return symbolToReg.get(symbol);
        }
        if (freeRegs.isEmpty()) {
            throw new RuntimeException("No free register");
        }
        // 获取一个空闲寄存器
        int register = freeRegs.iterator().next();
        freeRegs.remove(register);
        // 将寄存器分配给符号
        allocatedRegs.put(register, symbol);
        // 记录符号对应的寄存器
        symbolToReg.put(symbol, register);
        // 将寄存器放入 Cache
        regCache.add(register);
        return register;
    }

    // 符号是否分配过寄存器
    public boolean isAllocated(Symbol symbol) {
        return symbolToReg.containsKey(symbol);
    }

    // 获取符号当前所在的寄存器
    public int getRegOfSymbol(Symbol symbol) {
        if (!symbolToReg.containsKey(symbol)) {
            throw new AssertionError(String.format("%s hasn't been alloc register!", symbol.toString()));
        }
        return symbolToReg.get(symbol);
    }

    // 获取可被换出的寄存器编号
    public int regToReplace() {
        return regCache.iterator().next();
    }

    // 取消某个寄存器的分配
    public Symbol cancelAlloc(int register) {
        if (!allocatedRegs.containsKey(register)) {
            return null;
        }
        freeRegs.add(register);
        Symbol symbol = allocatedRegs.remove(register);
        symbolToReg.remove(symbol);
        regCache.remove(register);
        return symbol;
    }

    // 获取当前所有可用寄存器的分配状态
    public HashMap<Integer, Symbol> getAllocatedRegs() {
        return allocatedRegs;
    }

    // 清空分配状态
    public void clear() {
        allocatedRegs.clear();
        symbolToReg.clear();
        regCache.clear();
        freeRegs.clear();
        freeRegs.addAll(allocatableRegs);
    }

    public void refresh(Symbol symbol) {
        int register = symbolToReg.get(symbol); // 获取符号对应的寄存器
        assert regCache.contains(register);
        regCache.remove(register);
        regCache.add(register);
    }
}


