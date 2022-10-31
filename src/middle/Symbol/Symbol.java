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
    private int address = 0; // 基地址

    public enum SymbolType {
        Var,
        Array
    }

    private SymbolType type;
    private ArrayList<Integer> dims = new ArrayList<>();

    private Operand varInit; //var
    private boolean isConst = false;
    private ArrayList<Operand> arrayInit = new ArrayList<>();
    private Operand offset = null;
    private Symbol parentArray = null;

    //var or const
    public Symbol(String name, BasicType basicType, SymbolType type, boolean isConst, Operand varInit, String loc) {
        this.name = name;
        this.basicType = basicType;
        this.varInit = varInit;
        this.isConst = isConst;
        this.type = type;
        this.loc = loc;
    }


    //array
    public Symbol(String name, BasicType basicType, SymbolType type, boolean isConst, ArrayList<Integer> dims
            , ArrayList<Operand> arrayInit, String loc) {
        this.name = name;
        this.basicType = basicType;
        this.type = type;
        this.isConst = isConst;
        this.dims = dims;
        this.arrayInit = arrayInit;
        this.loc = loc;
    }

    //highDim array -> lowDim array / var
    public Symbol(Symbol parentArray, Operand offset, SymbolType type) {
        this.name = parentArray.getName();
        this.basicType = parentArray.getBasicType();
        this.type = type;
        this.isConst = parentArray.isConst();
        this.loc = parentArray.get_loc();
        this.parentArray = parentArray;
        this.offset = offset;
    }

    private String get_loc() {
        return this.loc;
    }

    private SymbolType getType() {
        return this.type;
    }

    private BasicType getBasicType() {
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

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.name);
        if (!this.name.contains("#")){
            sb.append("@").append(loc);
        }
        if (offset != null) {
            sb.append("[");
            sb.append(offset);
            sb.append("]");
        }
        return sb.toString();
    }

    public static Symbol tempVar(MidCodeList midCodeList, BasicType basicType, String loc) {
        Symbol temp = new Symbol("#T" + midCodeList.tmpIndex, basicType, SymbolType.Var, false, null, loc);
        midCodeList.addTempIndex();
        return temp;
    }
}
