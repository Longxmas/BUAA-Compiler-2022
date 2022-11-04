package frontend.Parser.Decl.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.ConstExp;

import java.util.ArrayList;

public class VarDef {
    private Token ident;
    ArrayList<ConstExp> constExps = new ArrayList<>();
    private InitVal initVal = null;

    public VarDef(Token ident, ArrayList<ConstExp> constExps, InitVal initVal) {
        this.ident = ident;
        this.constExps = constExps;
        this.initVal = initVal;
    }

    public Token getIdent() {
        return ident;
    }

    public ArrayList<ConstExp> getConstExps() {
        return constExps;
    }

    public InitVal getInitVal() {
        return initVal;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(ident);
        for (ConstExp ce : constExps) {
            sb.append(Token.printSign("[")).append(ce).append(Token.printSign("]"));
        }
        if (initVal != null) {
            sb.append(Token.printSign("=")).append(initVal);
        }
        return sb + "<VarDef>\n";
    }
}