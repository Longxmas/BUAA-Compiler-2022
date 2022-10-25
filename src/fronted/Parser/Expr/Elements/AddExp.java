package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class AddExp extends Expression<MulExp>{
    public AddExp(MulExp mulExp, ArrayList<MulExp> mulExps, ArrayList<Token> tokens) {
        super("<AddExp>",mulExp,mulExps,tokens);
    }
}
