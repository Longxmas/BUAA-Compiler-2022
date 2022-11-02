package frontend.Parser.Stmt.Elements;

import frontend.Lexer.Token;

public class BreakStmt extends Stmt {
    private Token breakToken;

    public BreakStmt(Token token) {
        this.breakToken = token;
    }

    public int getLine() {
        return this.breakToken.getLine();
    }

    public String toString() {
        String sb = breakToken.toString() + Token.printSign(";");
        return sb + "<Stmt>\n";
    }
}
