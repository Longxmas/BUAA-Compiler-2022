package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class FuncRParams {
    ArrayList<Exp> exps = null;
    // FIRST(FuncRParams) = {"(", "+", "-", "!", ident, intConst}
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

    public FuncRParams(ArrayList<Exp> exps) {
        this.exps = exps;
    }

    public ArrayList<Exp> getExps() {
        return exps;
    }

    public String toString() { //无括号
        StringBuilder sb = new StringBuilder();
        sb.append(exps.get(0).toString());
        for (int i = 1; i < exps.size(); i++) {
            sb.append(Token.printSign(","));
            sb.append(exps.get(i).toString());
        }
        return sb + "<FuncRParams>\n";
    }
}
