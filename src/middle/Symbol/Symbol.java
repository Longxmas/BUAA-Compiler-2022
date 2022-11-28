package middle.Symbol;

import middle.Code.MidCodeList;
import middle.operand.Operand;

import java.util.ArrayList;

public class Symbol implements Operand {
    public enum BasicType {
        INT(4);
        private final int size;

        BasicType(int size) {
            this.size = size;
        }

        public int getSize() {
            return this.size;
        }
    }

    private final String name;
    private final BasicType basicType; //int
    private String loc;
    private int address = 0; // 相对于$gp或者$sp的偏移量
    private int arrayAddress = 0;

    public enum SymbolType {
        Var,
        Array
    }

    private SymbolType type;
    private ArrayList<Integer> dims = new ArrayList<>();

    private Operand varInit; //var
    private boolean isConst = false;
    private boolean isGlobal = false;
    private ArrayList<Operand> arrayInit = new ArrayList<>();
    private Operand offset = null;
    private boolean isParam = false;
    private Symbol parentArray = null;
    private SymbolTable parentSymbolTable;

    //var or const
    public Symbol(String name, BasicType basicType, SymbolType type, boolean isConst, Operand varInit, SymbolTable symbolTable) {
        this.name = name;
        this.basicType = basicType;
        this.varInit = varInit;
        this.isConst = isConst;
        this.type = type;
        this.loc = symbolTable.getLoc();
        this.parentSymbolTable = symbolTable;
    }


    //array
    public Symbol(String name, BasicType basicType, SymbolType type, boolean isConst, ArrayList<Integer> dims
            , ArrayList<Operand> arrayInit, SymbolTable symbolTable) {
        this.name = name;
        this.basicType = basicType;
        this.type = type;
        this.isConst = isConst;
        this.dims = dims;
        this.arrayInit = arrayInit;
        this.loc = symbolTable.getLoc();
        this.parentSymbolTable = symbolTable;
    }

    //highDim array -> lowDim array / var
    public Symbol(Symbol parentArray, Operand offset, SymbolType type, SymbolTable symbolTable) {
        this.name = parentArray.getName();
        this.basicType = parentArray.getBasicType();
        this.type = type;
        this.isConst = parentArray.isConst();
        this.loc = parentArray.get_loc();
        this.parentSymbolTable = symbolTable;
        this.parentArray = parentArray;
        this.offset = offset;
    }

    private String get_loc() {
        return this.loc;
    }

    private SymbolType getType() {
        return this.type;
    }

    public BasicType getBasicType() {
        return this.basicType;
    }

    public String getName() {
        return name;
    }

    public Operand getVarInit() {
        return varInit;
    }

    public int getAddress() {
        return address;
    }

    public void setAddress(int address) {
        this.address = address;
    }

    public void setGlobal(boolean global) {
        isGlobal = global;
    }

    public boolean isGlobal() {
        return isGlobal;
    }

    public ArrayList<Operand> getArrayInit() {
        return arrayInit;
    }

    public SymbolType getSymbolType() {
        return type;
    }

    public boolean isConst() {
        return isConst;
    }

    public ArrayList<Integer> getDims() {
        return dims;
    }

    public Operand getOffset() {
        return offset;
    }

    public int getArrayAddress() {
        return arrayAddress;
    }

    public void setArrayAddress(int arrayAddress) {
        this.arrayAddress = arrayAddress;
    }

    public int getArraySize() {
        if (dims.isEmpty()) return 1;
        int size = 1;
        for (Integer dim : dims) {
            size *= dim;
        }
        return size;
    }

    public boolean isTemp() {
        return this.name.contains("#T");
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.name);
        sb.append("@").append(loc);
        if (offset != null) {
            sb.append("[").append(offset).append("]");
        }
        return sb.toString();
    }

    public static Symbol tempVar(MidCodeList midCodeList, BasicType basicType, SymbolTable symbolTable) {
        Symbol temp = new Symbol("#T" + midCodeList.tmpIndex, basicType, SymbolType.Var, false, null, symbolTable);
        symbolTable.addSymbol(temp);
        midCodeList.addTempIndex();
        return temp;
    }

    public void setParam() {
        this.isParam = true;
    }

    public boolean isParam() {
        return this.isParam;
    }

    public String getLoc() {
        return this.loc;
    }

}
