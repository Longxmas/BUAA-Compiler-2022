package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class EqExp extends Expression<RelExp> {
    public EqExp(RelExp relExp, ArrayList<RelExp> relExps, ArrayList<Token> tokens) {
        super("<EqExp>",relExp,relExps,tokens);
    }
}
