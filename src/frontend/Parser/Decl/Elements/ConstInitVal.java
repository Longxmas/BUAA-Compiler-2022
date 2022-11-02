package frontend.Parser.Decl.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.ConstExp;

import java.util.ArrayList;

public class ConstInitVal {
    private ConstExp constExp = null;
    private ArrayList<ConstInitVal> constInitVals = new ArrayList<>();

    public ConstInitVal(ConstExp constExp,ArrayList<ConstInitVal> constInitVals) {
        this.constExp = constExp;
        this.constInitVals = constInitVals;
    }


    public ConstExp getConstExp() {
        return constExp;
    }

    public ArrayList<ConstInitVal> getConstInitVals() {
        return constInitVals;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (constExp != null) {
            return constExp + "<ConstInitVal>\n";
        } else {
            sb.append(Token.printSign("{"));
            ConstInitVal firstConstInit = null;
            if(constInitVals.size() > 0) {
                firstConstInit = constInitVals.get(0);
            }
            if (firstConstInit != null) {
                sb.append(firstConstInit);
            }
            for (int i = 1;i < constInitVals.size();i++) {
                sb.append(Token.printSign(",")).append(constInitVals.get(i));
            }
            return sb.append(Token.printSign("}")) + "<ConstInitVal>\n";
        }
    }
}
