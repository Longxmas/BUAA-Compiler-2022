package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class RelExp extends Expression<AddExp> {
    public RelExp(AddExp addExp, ArrayList<AddExp> addExps, ArrayList<Token> tokens) {
        super("<RelExp>",addExp,addExps,tokens);
    }

}
