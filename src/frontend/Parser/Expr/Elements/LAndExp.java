package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class LAndExp extends Expression<EqExp> {
    public LAndExp(EqExp eqExp, ArrayList<EqExp> eqExps, ArrayList<Token> tokens) {
        super("<LAndExp>",eqExp,eqExps,tokens);
    }
}
