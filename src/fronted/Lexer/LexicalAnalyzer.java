package fronted.Lexer;

import java.util.ArrayList;

public class LexicalAnalyzer {
    private String code;
    private int index = 0;
    private char c;
    private int line = 1;
    private ArrayList<Token> ans = new ArrayList<>();

    public LexicalAnalyzer(String code) {
        this.code = code;
        this.parse();
    }

    void parse() {
        getChar();
        while (index < code.length()) {
            while (Token.isBlank(c)) {
                if(c == '\n') {
                    line++;
                }
                getChar();
            }
            if (Token.isNonDigit(c)) {
                parseIdent();
            } else if (Token.isDigit(c)) {
                parseInt();
            } else if (c == '"') {
                parseStringConst();
            } else {
                parseSign();
            }
        }
    }

    void getChar() {
        char ch = '\0';
        if (index < code.length()) ch = code.charAt(index++);
        c = ch;
    }

    void parseIdent() {
        StringBuilder sb = new StringBuilder();

        while (Token.isNonDigit(c) || Token.isDigit(c)) {
            sb.append(c);
            getChar();
        }
        String ident = sb.toString();
        Token token;
        if (Token.keywords.contains(ident)) {
            token = new Token(ident, Token.wordsMap.get(ident), line);
        } else {
            token = new Token(ident, "IDENFR", line);
        }
        ans.add(token);
    }

    void parseInt() {
        int number = 0;
        while (Token.isDigit(c)) {
            number = number * 10 + (c - '0');
            getChar();
        }
        Token token = new Token(Integer.toString(number), "INTCON", line);
        ans.add(token);
    }

    void parseStringConst() {
        StringBuilder sb = new StringBuilder();
        getChar();
        while (c != '"') {
            sb.append(c);
            getChar();
        }
        getChar();
        Token token = new Token('"' + sb.toString() + '"', "STRCON", line);
        ans.add(token);
    }

    void parseSign() {
        if (c == '+') {
            ans.add(new Token("+", Token.wordsMap.get("+"), line));
        } else if (c == '-') {
            ans.add(new Token("-", Token.wordsMap.get("-"), line));
        } else if (c == '*') {
            ans.add(new Token("*", Token.wordsMap.get("*"), line));
        } else if (c == '%') {
            ans.add(new Token("%", Token.wordsMap.get("%"), line));
        } else if (c == '{') {
            ans.add(new Token("{", Token.wordsMap.get("{"), line));
        } else if (c == '}') {
            ans.add(new Token("}", Token.wordsMap.get("}"), line));
        } else if (c == '[') {
            ans.add(new Token("[", Token.wordsMap.get("["), line));
        } else if (c == ']') {
            ans.add(new Token("]", Token.wordsMap.get("]"), line));
        } else if (c == '(') {
            ans.add(new Token("(", Token.wordsMap.get("("), line));
        } else if (c == ')') {
            ans.add(new Token(")", Token.wordsMap.get(")"), line));
        } else if (c == ';') {
            ans.add(new Token(";", Token.wordsMap.get(";"), line));
        } else if (c == ',') {
            ans.add(new Token(",", Token.wordsMap.get(","), line));
        } else if (c == '!') {
            if (index < code.length() && code.charAt(index) == '=') {
                getChar();
                ans.add(new Token("!=", Token.wordsMap.get("!="), line));
            } else ans.add(new Token("!", Token.wordsMap.get("!"), line));
        } else if (c == '>') {
            if (index < code.length() && code.charAt(index) == '=') {
                getChar();
                ans.add(new Token(">=", Token.wordsMap.get(">="), line));
            } else ans.add(new Token(">", Token.wordsMap.get(">"), line));
        } else if (c == '<') {
            if (index < code.length() && code.charAt(index) == '=') {
                getChar();
                ans.add(new Token("<=", Token.wordsMap.get("<="), line));
            } else ans.add(new Token("<", Token.wordsMap.get("<"), line));
        } else if (c == '=') {
            if (index < code.length() && code.charAt(index) == '=') {
                getChar();
                ans.add(new Token("==", Token.wordsMap.get("=="), line));
            } else ans.add(new Token("=", Token.wordsMap.get("="), line));
        } else if (c == '&') {
            if (index < code.length() && code.charAt(index) == '&') {
                getChar();
                ans.add(new Token("&&", Token.wordsMap.get("&&"), line));
            }
        } else if (c == '|') {
            if (index < code.length() && code.charAt(index) == '|') {
                getChar();
                ans.add(new Token("||", Token.wordsMap.get("||"), line));
            }
        } else if (c == '/') {
            if (index < code.length() && code.charAt(index) == '/') {
                getChar();
                while (c != '\n') {
                    getChar();
                    if(c == '\0') break;
                }
                line++;
            } else if (index < code.length() && code.charAt(index) == '*') {
                getChar();
                getChar();
                while (!(c == '*' && index < code.length() && code.charAt(index) == '/')) {
                    if (c == '\n') line++;
                    getChar();
                }
                getChar();
            } else {
                ans.add(new Token("/", Token.wordsMap.get("/"), line));
            }
        }
        if(index < code.length()) getChar();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Token token : ans) {
            sb.append(token.toString());
            sb.append("\n");
        }
        return sb.toString();
    }

    public ArrayList<Token> getAns() {
        return this.ans;
    }

}
