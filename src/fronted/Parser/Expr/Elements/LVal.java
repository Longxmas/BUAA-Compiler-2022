package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class LVal {
    // FIRST(LVal) = { ident }
    private Token ident;
    private ArrayList<Exp> exps;

    public LVal(Token ident, ArrayList<Exp> exps) {
        this.ident = ident;
        this.exps = exps;
    }

    public Token getIdent() {
        return ident;
    }

    public ArrayList<Exp> getExps() {
        return exps;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(ident.toString());
        for (Exp exp : exps) {
            sb.append(Token.printSign("["));
            sb.append(exp.toString());
            sb.append(Token.printSign("]"));
        }
        sb.append("<LVal>\n");
        return sb.toString();
    }
}
