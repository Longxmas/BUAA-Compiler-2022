package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class UnaryExp {
    public static ArrayList<String> UnaryOpTypeString = new ArrayList<String>() {
        {
            add(Token.wordsMap.get("+"));
            add(Token.wordsMap.get("-"));
            add(Token.wordsMap.get("!"));
        }
    };

    ArrayList<Token> unaryOps = new ArrayList<>();
    PrimaryExp primaryExp = null;
    Token ident = null;
    FuncRParams funcRParams = null;

    public UnaryExp(ArrayList<Token> unaryOps, PrimaryExp primaryExp) {
        this.unaryOps = unaryOps;
        this.primaryExp = primaryExp;
    }

    public UnaryExp(ArrayList<Token> unaryOps, Token ident, FuncRParams funcRParams) {
        this.unaryOps = unaryOps;
        this.ident = ident;
        this.funcRParams = funcRParams;
    }

    public ArrayList<Token> getUnaryOps() {
        return unaryOps;
    }

    public PrimaryExp getPrimaryExp() {
        return primaryExp;
    }

    public Token getIdent() {
        return ident;
    }

    public FuncRParams getFuncRParams() {
        return funcRParams;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Token op : unaryOps) {
            sb.append(op.toString());
            sb.append("<UnaryOp>\n");
        }
        if (this.primaryExp != null) {
            sb.append(primaryExp);
            int count = unaryOps.size();
            while(count >= 0) {
                sb.append("<UnaryExp>\n");
                count--;
            }
            return sb.toString();
        } else if (this.ident != null) {
            sb.append(ident);
            sb.append(Token.printSign("("));
            if (funcRParams != null) {
                sb.append(funcRParams.toString());
            }
            sb.append(Token.printSign(")"));
            int count = unaryOps.size();
            while(count >= 0) {
                sb.append("<UnaryExp>\n");
                count--;
            }
            return sb.toString();
        } else {
            return null;
        }
    }
}
