package frontend.Parser.Expr.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Stmt.Elements.Stmt;

import java.util.ArrayList;

public class LOrExp extends Expression<LAndExp> {
    public LOrExp(LAndExp landExp, ArrayList<LAndExp> landExps, ArrayList<Token> tokens) {
        super("<LOrExp>",landExp,landExps,tokens);
    }

    private Stmt parent = null;

    public void setParent(Stmt parent) {
        this.parent = parent;
    }

    public Stmt getParent() {
        return this.parent;
    }

}
