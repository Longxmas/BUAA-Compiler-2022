package frontend.Parser.Decl.Elements;

import  frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.Exp;

import java.util.ArrayList;

public class InitVal {
    private Exp Exp = null;
    private ArrayList<InitVal> initVals = new ArrayList<>();

    public InitVal(Exp Exp,ArrayList<InitVal> initVals) {
        this.Exp = Exp;
        this.initVals = initVals;
    }

    public frontend.Parser.Expr.Elements.Exp getExp() {
        return Exp;
    }

    public ArrayList<InitVal> getInitVals() {
        return initVals;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (Exp!=null) {
            return Exp + "<InitVal>\n";
        } else {
            sb.append(Token.printSign("{"));
            InitVal firstInit = null;
            if(initVals.size() > 0) {
                firstInit = initVals.get(0);
            }
            if (firstInit != null) {
                sb.append(firstInit);
            }
            for (int i = 1;i < initVals.size();i++) {
                sb.append(Token.printSign(",")).append(initVals.get(i));
            }
            return sb.append(Token.printSign("}")) + "<InitVal>\n";
        }
    }
    
}
