package middle.Symbol;

import middle.operand.Operand;

import java.util.ArrayList;

public class FuncTable implements Operand {
    private final String name;

    public enum ReturnType {
        voidFunc, intFunc
    }

    private final ReturnType returnType;
    private SymbolTable paramTable;
    private final ArrayList<Symbol> params = new ArrayList<>();
    private int localSize = 0;
    private final boolean isMain;

    public FuncTable(String name, ReturnType returnType, SymbolTable symbolTable) {
        this.name = name;
        this.paramTable = symbolTable;
        this.isMain = false;
        this.returnType = returnType;
    }

    public FuncTable(SymbolTable globalSymbolTable) {
        this.paramTable = globalSymbolTable;
        this.name = "main";
        this.isMain = true;
        this.returnType = ReturnType.intFunc;
    }

    public String getName() {
        return this.name;
    }

    public ReturnType getReturnType() {
        return this.returnType;
    }

    public boolean isMain() {
        return this.isMain;
    }

    public ArrayList<Symbol> getParams() {
        return this.params;
    }

    public SymbolTable getParamTable() {
        return this.paramTable;
    }

    public int getLocalSize() {
        return this.localSize;
    }

    public void addParam(Symbol symbol) {
        this.params.add(symbol);
        paramTable.addSymbol(symbol);
        updateLocalSize(paramTable.getSize());
    }

    public void updateLocalSize(int size) {
        this.localSize = Math.max(size, localSize);
    }

    public String toString() {
        return this.name;
    }

}
