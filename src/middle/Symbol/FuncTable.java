package middle.Symbol;

import backend.MipsGenerator;
import middle.operand.Operand;

import java.util.ArrayList;
import java.util.HashMap;

public class FuncTable implements Operand {
    private final String name;

    public enum ReturnType {
        voidFunc, intFunc
    }

    private final ReturnType returnType;
    private ArrayList<SymbolTable> symbolTables = new ArrayList<>();
    private final ArrayList<String> paramsNames = new ArrayList<>();
    private final HashMap<String, Symbol> paramMap = new HashMap<>();
    private final ArrayList<Symbol> params = new ArrayList<>();
    private int stackSize = 0;
    private final boolean isMain;

    public FuncTable(String name, ReturnType returnType, SymbolTable symbolTable) {
        this.name = name;
        this.symbolTables.add(symbolTable);
        this.isMain = false;
        this.returnType = returnType;
    }

    public FuncTable(SymbolTable globalSymbolTable) {
        this.symbolTables.add(globalSymbolTable);
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

    public HashMap<String, Symbol> getParamMap() {
        return paramMap;
    }

    public void addParam(Symbol symbol) {
        this.params.add(symbol);
        this.paramsNames.add(symbol.getName());
        this.paramMap.put(symbol.getName(), symbol);
    }

    public ArrayList<String> getParamsNames() {
        return paramsNames;
    }

    public String toString() {
        return this.name;
    }

    public void addSymbolTable(SymbolTable symbolTable) {
        this.symbolTables.add(symbolTable);
    }

    public ArrayList<SymbolTable> getSymbolTables() {
        return symbolTables;
    }

    public void setStackSize() {
        int size = 4;
        int ismain = this.isMain ? 1 : 0;
        for (int i = ismain; i < symbolTables.size(); i++) {
            SymbolTable symbolTable = symbolTables.get(i);
            for (Symbol symbol : symbolTable.getSymbols()) {
                //System.out.println(this.name + " " + symbol.getName());
                if (symbol.getSymbolType() == Symbol.SymbolType.Var) {
                    symbol.setAddress(size);
                    size += 4;
                } else {
                    symbol.setAddress(size);
                    size += 4 * (params.contains(symbol) ? 1 : symbol.getArraySize());
                }
            }
        }
        this.stackSize = size + MipsGenerator.SAVED_STACK_SIZE;
    }

    public int getStackSize() {
        return stackSize;
    }
}
