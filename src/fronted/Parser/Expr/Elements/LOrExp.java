package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class LOrExp extends Expression<LAndExp> {
    public LOrExp(LAndExp landExp, ArrayList<LAndExp> landExps, ArrayList<Token> tokens) {
        super("<LOrExp>",landExp,landExps,tokens);
    }
}
