package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

public class PrimaryExp {
    private Exp exp = null;
    private LVal lVal = null;
    private Number number = null;

    public PrimaryExp(Exp exp) {
        this.exp = exp;
    }

    public PrimaryExp(LVal lVal) {
        this.lVal = lVal;
    }

    public PrimaryExp(Number number) {
        this.number = number;
    }

    public String toString() {
        if (exp != null) {
            return Token.printSign("(") +
                    exp.toString() +
                    Token.printSign(")") +
                    "<PrimaryExp>\n";
        } else if (lVal != null) {
            return lVal.toString() + "<PrimaryExp>\n";
        } else if (number != null) {
            return number.toString() + "<PrimaryExp>\n";
        } else {
            return null;
        }
    }
}
