package frontend.Parser.Stmt.Elements;

import frontend.Lexer.Token;

public class ContinueStmt extends Stmt {
    private Token continueToken;

    public ContinueStmt(Token token) {
        this.continueToken = token;
    }

    public int getLine() {
        return this.continueToken.getLine();
    }

    public String toString() {
        String sb = continueToken.toString() + Token.printSign(";");
        return sb + "<Stmt>\n";
    }
}
