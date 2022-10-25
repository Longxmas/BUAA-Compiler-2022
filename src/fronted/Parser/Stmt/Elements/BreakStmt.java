package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;

public class BreakStmt extends Stmt {
    private Token breakToken;

    public BreakStmt(Token token) {
        this.breakToken = token;
    }

    public String toString() {
        String sb = breakToken.toString() + Token.printSign(";");
        return sb + "<Stmt>\n";
    }
}
