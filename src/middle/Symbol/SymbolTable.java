package middle.Symbol;

import java.util.HashMap;

public class SymbolTable {
    private int depth; //成熟
    private int index; //第几块
    private final HashMap<String, Symbol> symbolMap = new HashMap<>();
    private int size = 0; //存储空间
    private final SymbolTable parent;

    public SymbolTable() {
        this.depth = 0;
        this.index = 1;
        this.parent = null;
    }

    public SymbolTable(int depth, int index, SymbolTable parent) {
        this.depth = depth;
        this.index = index;
        this.parent = parent;
    }

    public int getDepth() {
        return depth;
    }

    public int getIndex() {
        return index;
    }

    public SymbolTable getParent() {
        return this.parent;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public void addSymbol(Symbol symbol) {
        this.symbolMap.put(symbol.getName(), symbol);
    }

    public int getSize() {
        return size;
    }

    public HashMap<String , Symbol> getSymbolMap() {
        return this.symbolMap;
    }

    public boolean contains(String name) {
        return this.symbolMap.containsKey(name);
    }
}
