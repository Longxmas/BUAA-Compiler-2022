package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.Cond;

public class IfElseStmt extends Stmt {
    private Cond cond = null;
    private Stmt ifStmt = null;
    private Stmt elseStmt = null;
    private Token ifToken = null;
    private Token elseToken = null;

    public IfElseStmt(Token ifToken, Cond cond, Stmt ifStmt,
                      Token elseToken, Stmt elseStmt) {
        this.cond = cond;
        this.ifStmt = ifStmt;
        this.elseStmt = elseStmt;
        this.ifToken = ifToken;
        this.elseToken = elseToken;
    }

    public Cond getCond() {
        return cond;
    }

    public Stmt getIfStmt() {
        return ifStmt;
    }

    public Stmt getElseStmt() {
        return elseStmt;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(ifToken);
        sb.append(Token.printSign("("));
        sb.append(cond.toString());
        sb.append(Token.printSign(")"));
        sb.append(ifStmt.toString());
        if (elseStmt != null) {
            sb.append(elseToken);
            sb.append(elseStmt);
        }
        return sb + "<Stmt>\n";
    }
}
