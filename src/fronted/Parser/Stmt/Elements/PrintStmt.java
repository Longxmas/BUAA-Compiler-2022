package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.Exp;

import java.util.ArrayList;

public class PrintStmt extends Stmt {
    private Token printToken;
    private Token formatString;
    private ArrayList<Exp> exps;

    public PrintStmt(Token printToken,Token formatString,ArrayList<Exp> exps) {
        this.printToken = printToken;
        this.formatString = formatString;
        this.exps = exps;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(printToken.toString());
        sb.append(Token.printSign("("));
        sb.append(formatString.toString());
        for(Exp exp : exps) {
            sb.append(Token.printSign(","));
            sb.append(exp.toString());
        }
        sb.append(Token.printSign(")")).append(Token.printSign(";"));
        return sb + "<Stmt>\n";
    }
}
