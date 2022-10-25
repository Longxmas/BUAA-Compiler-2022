package fronted.Parser.Decl.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.ConstExp;

import java.util.ArrayList;

public class ConstInitVal {
    private ConstExp constExp = null;
    private ConstInitVal firstConstInit;
    private ArrayList<ConstInitVal> constInitVals = new ArrayList<>();

    public ConstInitVal(ConstExp constExp, ConstInitVal firstConstInit, ArrayList<ConstInitVal> constInitVals) {
        this.constExp = constExp;
        this.firstConstInit = firstConstInit;
        this.constInitVals = constInitVals;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (constExp != null) {
            return constExp + "<ConstInitVal>\n";
        } else {
            sb.append(Token.printSign("{"));
            if (firstConstInit != null) {
                sb.append(firstConstInit);
            }
            for (ConstInitVal ci : constInitVals) {
                sb.append(Token.printSign(",")).append(ci);
            }
            return sb.append(Token.printSign("}")) + "<ConstInitVal>\n";
        }
    }
}
