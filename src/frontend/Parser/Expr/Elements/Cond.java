package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class Cond extends Expression<LOrExp> {
    public Cond(LOrExp lorExp, ArrayList<LOrExp> lorExps, ArrayList<Token> tokens) {
        super("<Cond>", lorExp, lorExps, tokens);
    }
}
