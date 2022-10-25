package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.Exp;

public class ExpStmt extends Stmt {
    private Exp exp = null;

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
