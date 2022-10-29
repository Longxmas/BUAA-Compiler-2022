package fronted.Parser.FuncDef.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.ConstExp;

import java.util.ArrayList;

public class FuncFParam {
    private Token ident;
    private boolean isArray;
    private ArrayList<ConstExp> constExps = new ArrayList<>();

    public FuncFParam(Token ident,boolean isArray, ArrayList<ConstExp> constExps) {
        this.ident = ident;
        this.isArray = isArray;
        this.constExps = constExps;
    }

    public Token getIdent() {
        return ident;
    }

    public boolean isArray() {
        return isArray;
    }

    public ArrayList<ConstExp> getConstExps() {
        return constExps;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Token.printSign("int")).append(ident);
        if (isArray) {
            sb.append(Token.printSign("[")).append(Token.printSign("]"));
        }
        for (ConstExp ce : constExps) {
            sb.append(Token.printSign("[")).append(ce).append(Token.printSign("]"));
        }
        return sb + "<FuncFParam>\n";
    }
}
