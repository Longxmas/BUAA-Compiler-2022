package middle.Symbol;

import fronted.Parser.Decl.Elements.InitVal;
import fronted.Parser.Expr.Elements.Exp;

import java.util.ArrayList;

public class Symbol {
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
    private int address = 0; // 基地址

    public enum SymbolType {
        Var,
        Array
    }
    private SymbolType type;
    private ArrayList<Integer> dims = new ArrayList<>();

    private Integer varInit; //var
    private boolean isConst = false;
    private ArrayList<Integer> arrayInit = new ArrayList<>();

    //var or const
    public Symbol(String name, BasicType basicType,SymbolType type,boolean isConst,Integer varInit) {
        this.name = name;
        this.basicType = basicType;
        this.varInit = varInit;
        this.isConst = isConst;
        this.type = type;
    }


    //array
    public Symbol(String name, BasicType basicType,SymbolType type,boolean isConst,ArrayList<Integer> dims,ArrayList<Integer> arrayInit) {
        this.name = name;
        this.basicType = basicType;
        this.type = type;
        this.isConst = isConst;
        this.dims = dims;
        this.arrayInit = arrayInit;
    }


    public String getName() {
        return name;
    }

    public int getVarInit() {
        return varInit;
    }

    public int getAddress() {
        return address;
    }

    public ArrayList<Integer> getArrayInit() {
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

    public String toString() {
        return this.name +" " + this.dims + " " +isConst;
    }
}
