package frontend.Parser.Stmt.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.Cond;

public class WhileStmt extends Stmt {
    private Token whileToken;
    private Cond cond;
    private Stmt stmt;
    private int label;

    public WhileStmt(Token whileToken, Cond cond, Stmt stmt) {
        this.whileToken = whileToken;
        this.cond = cond;
        this.stmt = stmt;
    }

    public Cond getCond() {
        return cond;
    }

    public Stmt getStmt() {
        return stmt;
    }

    public void setLabel(int label) {
        this.label = label;
    }

    public int getLabel() {
        return this.label;
    }

    public String toString() {
        String sb = Token.printSign("while") +
                Token.printSign("(") +
                cond.toString() +
                Token.printSign(")") +
                stmt.toString(); //这个Stmt的输出不能替代下面这个的输出
        return sb + "<Stmt>\n";
    }
}
