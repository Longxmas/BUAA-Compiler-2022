package fronted.Parser.Decl.Elements;

import  fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.Exp;

import java.util.ArrayList;

public class InitVal {
    private Exp Exp = null;
    private final InitVal firstInit;
    private ArrayList<InitVal> initVals = new ArrayList<>();

    public InitVal(Exp Exp,InitVal firstInit,ArrayList<InitVal> initVals) {
        this.Exp = Exp;
        this.firstInit = firstInit;
        this.initVals = initVals;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (Exp!=null) {
            return Exp + "<InitVal>\n";
        } else {
            sb.append(Token.printSign("{"));
            if (firstInit != null) {
                sb.append(firstInit);
            }
            for (InitVal ini : initVals) {
                sb.append(Token.printSign(",")).append(ini);
            }
            return sb.append(Token.printSign("}")) + "<InitVal>\n";
        }
    }
    
}
