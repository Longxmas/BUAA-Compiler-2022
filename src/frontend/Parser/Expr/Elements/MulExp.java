package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class MulExp extends Expression<UnaryExp> {
    public MulExp(UnaryExp unaryExp, ArrayList<UnaryExp> unaryExps, ArrayList<Token> tokens) {
        super("<MulExp>", unaryExp, unaryExps, tokens);
    }
}
