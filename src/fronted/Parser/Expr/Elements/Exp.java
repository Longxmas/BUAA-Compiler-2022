package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class Exp extends Expression<AddExp>{
    // FIRST(Exp) = {"(", "+", "-", "!", ident, intConst}
    public static ArrayList<String> firstTypes = new ArrayList<String>(){
        {
            add(Token.wordsMap.get("("));
            add(Token.wordsMap.get("+"));
            add(Token.wordsMap.get("-"));
            add(Token.wordsMap.get("!"));
            add("IDENFR");
            add("INTCON");
        }
    };

    public Exp(AddExp addExp, ArrayList<AddExp> addExps, ArrayList<Token> tokens) {
        super("<Exp>",addExp,addExps,tokens);
    }
}
