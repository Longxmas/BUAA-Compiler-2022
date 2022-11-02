package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

public class Number {
    private int value;
    private Token token;

    public Number(Token token) {
        this.value = Integer.parseInt(token.getSign());
        this.token = token;
    }

    public int getValue() {
        return value;
    }

    public String toString() {
        return token.toString() + "<Number>\n";
    }
}
