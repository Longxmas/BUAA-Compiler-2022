package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class EqExp extends Expression<RelExp> {
    public EqExp(RelExp relExp, ArrayList<RelExp> relExps, ArrayList<Token> tokens) {
        super("<EqExp>",relExp,relExps,tokens);
    }

    private LAndExp parent = null;
    private Integer index = null;
    public void setParent(LAndExp parent) {
        this.parent = parent;
    }

    public void setIndex(Integer i) {
        this.index = i;
    }

    public LAndExp getParent() {
        return this.parent;
    }

    public Integer getIndex() {
        return this.index;
    }
}
