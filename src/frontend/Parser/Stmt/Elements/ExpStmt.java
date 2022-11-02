package frontend.Parser.Stmt.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.Exp;

public class ExpStmt extends Stmt {
    private Exp exp = null;

    public Exp getExp() {
        return exp;
    }

    public ExpStmt(Exp exp) {
        this.exp = exp;
    }

    public String toString() {
        if (exp != null) {
            return exp + Token.printSign(";") + "<Stmt>\n";
        }
        return Token.printSign(";") + "<Stmt>\n";
    }
}
