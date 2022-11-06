package backend;

import backend.Mips.LoadInstr;
import backend.Mips.MipsCode;
import backend.Mips.MipsCodes;
import backend.Mips.StoreInstr;
import middle.Symbol.Symbol;

import java.util.*;

public class RegAlloc {
    private MipsCodes mipsCodes;
    // 可用来自由分配的寄存器：从 t0($8) 到 t9($25); v0($2)为函数返回值, v1($3)存储立即数, a0($4)作为系统调用参数
    // gp($28)为全局指针, sp($29)为栈指针, fp($30)为帧指针, ra($31)为返回地址
    public static final HashSet<Integer> allocatableRegs =
            new HashSet<>(Arrays.asList(5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 30));

    public static final HashMap<String, Integer> REG_SAVED_PLACE = new HashMap<String, Integer>() {{
        put("$ra", 0);
        put("$t0", 4);
        put("$t1", 2 * 4);
        put("$t2", 3 * 4);
        put("$t3", 4 * 4);
        put("$t4", 5 * 4);
        put("$t5", 6 * 4);
        put("$t6", 7 * 4);
        put("$t7", 8 * 4);
        put("$t8", 9 * 4);
        put("$t9", 10 * 4);
        put("$s0", 11 * 4);
        put("$s1", 12 * 4);
        put("$s2", 13 * 4);
        put("$s3", 14 * 4);
        put("$s4", 15 * 4);
        put("$s5", 16 * 4);
        put("$s6", 17 * 4);
        put("$s7", 18 * 4);
        put("$fp", 19 * 4);
        put("$a1", 20 * 4);
        put("$a2", 21 * 4);
        put("$a3", 22 * 4);
    }};

    public RegAlloc(MipsCodes mipsCodes) {
        this.mipsCodes = mipsCodes;
    }

    public static HashMap<Integer, String> intReg2SymReg = new HashMap<Integer, String>() {{
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
        put(30, "$fp");
    }};

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

    // 为变量符号分配寄存器, 返回分配的寄存器号
    // 如果没有空余的寄存器，则需要将一个已分配的寄存器的值存入内存，然后再分配
    public int allocRegister(Symbol symbol, boolean needToLoad) {
        if (symbolToReg.containsKey(symbol)) {
            return symbolToReg.get(symbol);
        }
        if (freeRegs.isEmpty()) {
            int reg = regToReplace();
            cancelAlloc(reg);
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
        //mipsCodes.addCode(new MipsCode("#<---- Alloc " + intReg2SymReg.get(register) + " for " + symbol.getName() + " ---->"));
        //System.out.println("#<---- Alloc " + intReg2SymReg.get(register) + " for " + symbol.getName() + " ---->");
        if (needToLoad) {
            mipsCodes.addCode(new MipsCode(new LoadInstr(LoadInstr.LI.lw,
                    intReg2SymReg.get(register), symbol.isGlobal() ? "$gp" : "$sp", String.valueOf(symbol.getAddress()))));
        }
        return register;
    }

    // 符号是否分配过寄存器
    public boolean isAllocated(Symbol symbol) {
        return symbolToReg.containsKey(symbol);
    }

    // 获取符号当前所在的寄存器，如果尚未被分配，则分配一个寄存器并返回
    public int getRegOfSymbol(Symbol symbol, boolean needToLoad) {
        if (!symbolToReg.containsKey(symbol)) {
            //System.out.println(symbol);
            return allocRegister(symbol, needToLoad);
        }
        return symbolToReg.get(symbol);
    }

    public String getRegString(int reg) {
        return intReg2SymReg.get(reg);
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
        mipsCodes.addCode(new MipsCode("#<---- Cancel " + intReg2SymReg.get(register) + " for " + symbol.getName() + " ---->"));
        //将符号写回内存
        mipsCodes.addCode(new MipsCode(new StoreInstr(StoreInstr.SI.sw,
                intReg2SymReg.get(register), symbol.isGlobal() ? "$gp" : "$sp", String.valueOf(symbol.getAddress()))));
        symbolToReg.remove(symbol);
        regCache.remove(register);
        return symbol;
    }

    // 获取当前所有可用寄存器的分配状态
    public HashMap<Integer, Symbol> getAllocatedRegs() {
        return allocatedRegs;
    }


    // 清空分配状态
    public void clear(boolean needToStore) {
        if (needToStore) {
            HashSet<Integer> regSet = new HashSet<>(allocatedRegs.keySet());
            for (int reg : regSet) {
                cancelAlloc(reg);
            }
        }
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

