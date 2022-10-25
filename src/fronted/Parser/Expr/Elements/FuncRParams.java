package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class FuncRParams {
    ArrayList<Exp> exps = null;

    public FuncRParams(ArrayList<Exp> exps) {
        this.exps = exps;
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