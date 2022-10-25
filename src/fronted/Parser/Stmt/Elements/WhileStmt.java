package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.Cond;

public class WhileStmt extends Stmt {
    private Token whileToken;
    private Cond cond;
    private Stmt stmt;

    public WhileStmt(Token whileToken, Cond cond, Stmt stmt) {
        this.whileToken = whileToken;
        this.cond = cond;
        this.stmt = stmt;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Token.printSign("while"));
        sb.append(Token.printSign("("));
        sb.append(cond.toString());
        sb.append(Token.printSign(")"));
        sb.append(stmt.toString()); //这个Stmt的输出不能替代下面这个的输出
        return sb + "<Stmt>\n";
    }
}
