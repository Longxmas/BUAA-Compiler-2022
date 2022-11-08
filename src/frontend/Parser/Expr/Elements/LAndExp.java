package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class LAndExp extends Expression<EqExp> {
    public LAndExp(EqExp eqExp, ArrayList<EqExp> eqExps, ArrayList<Token> tokens) {
        super("<LAndExp>",eqExp,eqExps,tokens);
    }

    private LOrExp parent = null;
    private Integer index = null;
    public void setParent(LOrExp parent) {
        this.parent = parent;
    }

    public void setIndex(Integer i) {
        this.index = i;
    }

    public LOrExp getParent() {
        return this.parent;
    }

    public Integer getIndex() {
        return this.index;
    }
}
