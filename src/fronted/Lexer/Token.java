package fronted.Lexer;

import java.util.HashMap;
import java.util.HashSet;

public class Token {
    public static HashMap<String, String> wordsMap = new HashMap<String, String>() {
        {
            put("main", "MAINTK");
            put("const", "CONSTTK");
            put("int", "INTTK");
            put("break", "BREAKTK");
            put("continue", "CONTINUETK");
            put("if", "IFTK");
            put("else", "ELSETK");
            put("while", "WHILETK");
            put("getint", "GETINTTK");
            put("printf", "PRINTFTK");
            put("return", "RETURNTK");
            put("void", "VOIDTK");
            put("!", "NOT");
            put("&&", "AND");
            put("||", "OR");
            put("+", "PLUS");
            put("-", "MINU");
            put("*", "MULT");
            put("/", "DIV");
            put("%", "MOD");
            put("<", "LSS");
            put("<=", "LEQ");
            put(">", "GRE");
            put(">=", "GEQ");
            put("==", "EQL");
            put("!=", "NEQ");
            put("=", "ASSIGN");
            put(";", "SEMICN");
            put(",", "COMMA");
            put("(", "LPARENT");
            put(")", "RPARENT");
            put("[", "LBRACK");
            put("]", "RBRACK");
            put("{", "LBRACE");
            put("}", "RBRACE");
        }
    };

    public static HashSet<String> keywords = new HashSet<String>() {
        {
            add("main");
            add("break");
            add("const");
            add("int");
            add("continue");
            add("if");
            add("else");
            add("while");
            add("getint");
            add("printf");
            add("return");
            add("void");
        }
    };

    private final String sign;
    private final String type;
    private int line;

    public Token(String sign, String type, int line) {
        this.sign = sign;
        this.type = type;
        this.line = line;
    }

    @Override
    public String toString() {
        return this.type + ' ' + this.sign + "\n"/*+ ' ' + this.line*/;
    }

    public static boolean isDigit(char c) {
        return Character.isDigit(c);
    }

    public static boolean isNonDigit(char c) {
        return Character.isLetter(c) || c == '_';
    }

    public static boolean isBlank(char c) {
        return c == ' ' || c == '\r' || c == '\t' || c == '\n';
    }

    public String getType() {
        return this.type;
    }

    public String getSign() {
        return this.sign;
    }

    public static String printSign(String sign) {
        return new Token(sign, Token.wordsMap.get(sign), 0).toString();
    }
}
