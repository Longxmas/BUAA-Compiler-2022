package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class ConstExp extends Expression<AddExp>{
    public ConstExp(AddExp addExp, ArrayList<AddExp> addExps, ArrayList<Token> tokens) {
        super("<ConstExp>",addExp,addExps,tokens);
    }
}
