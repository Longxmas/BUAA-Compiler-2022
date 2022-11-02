package frontend.Parser.FuncDef.Elements;

import frontend.Lexer.Token;

public class FuncType {
    private Token type;

    public FuncType(Token type) {
        this.type = type;
    }

    public Token getType() {
        return this.type;
    }

    public String toString() {
        return type.toString() + "<FuncType>\n";
    }
}
