package frontend.Parser.Decl.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.ConstExp;

import java.util.ArrayList;

public class ConstDef {
    private Token ident;
    ArrayList<ConstExp> constExps = new ArrayList<>();
    private ConstInitVal constInitVal;

    public ConstDef(Token ident, ArrayList<ConstExp> constExps, ConstInitVal constInitVal) {
        this.ident = ident;
        this.constExps = constExps;
        this.constInitVal = constInitVal;
    }

    public Token getIdent() {
        return ident;
    }

    public ArrayList<ConstExp> getConstExps() {
        return constExps;
    }

    public ConstInitVal getConstInitVal() {
        return constInitVal;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(ident);
        for (ConstExp ce : constExps) {
            sb.append(Token.printSign("[")).append(ce).append(Token.printSign("]"));
        }
        sb.append(Token.printSign("=")).append(constInitVal);
        return sb + "<ConstDef>\n";
    }
}
