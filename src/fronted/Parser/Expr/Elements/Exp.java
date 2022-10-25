package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class Exp extends Expression<AddExp>{
    public Exp(AddExp addExp, ArrayList<AddExp> addExps, ArrayList<Token> tokens) {
        super("<Exp>",addExp,addExps,tokens);
    }
}
