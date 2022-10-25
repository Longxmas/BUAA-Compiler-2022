package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.Exp;

public class ReturnStmt extends Stmt {
    private Token returnToken;
    private Exp exp = null;

    public ReturnStmt(Token returnToken, Exp exp) {
        this.returnToken = returnToken;
        this.exp = exp;
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
