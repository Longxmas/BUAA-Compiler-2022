package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class LAndExp extends Expression<EqExp> {
    public LAndExp(EqExp eqExp, ArrayList<EqExp> eqExps, ArrayList<Token> tokens) {
        super("<LAndExp>",eqExp,eqExps,tokens);
    }
}
