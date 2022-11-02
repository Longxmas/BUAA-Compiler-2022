package frontend.Parser.Stmt.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.Exp;
import frontend.Parser.Expr.Elements.LVal;

public class LValStmt extends Stmt {
    private LVal lVal;
    private Exp exp = null;
    private Token getintToken = null;

    public LValStmt(LVal lVal, Exp exp, Token getintToken) {
        this.lVal = lVal;
        this.exp = exp;
        this.getintToken = getintToken;
    }

    public LVal getlVal() {
        return lVal;
    }

    public Exp getExp() {
        return exp;
    }

    public Token getGetintToken() {
        return getintToken;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(lVal.toString());
        sb.append(Token.printSign("="));
        if (exp != null) {
            sb.append(exp).append(Token.printSign(";"));
        } else if (getintToken != null) {
            sb.append(Token.printSign("getint")).append(Token.printSign("(")).append(Token.printSign(")"))
                    .append(Token.printSign(";"));
        } else {
            sb.append(Token.printSign(";"));
        }
        return sb + "<Stmt>\n";
    }
}
