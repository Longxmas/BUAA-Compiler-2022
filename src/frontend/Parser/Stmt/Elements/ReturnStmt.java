package frontend.Parser.Stmt.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.Exp;

public class ReturnStmt extends Stmt {
    private Token returnToken;
    private Exp exp = null;

    public ReturnStmt(Token returnToken, Exp exp) {
        this.returnToken = returnToken;
        this.exp = exp;
    }

    public Exp getExp() {
        return exp;
    }

    public boolean hasValue() {
        return exp != null ;
    }

    public int getLine() {
        return this.returnToken.getLine();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(returnToken.toString());
        if(exp != null) {
            sb.append(exp);
        }
        sb.append(Token.printSign(";")).append("<Stmt>\n");
        return sb.toString();
    }

}
