package fronted.error;

import fronted.Lexer.Token;

import java.util.ListIterator;

public class error {
    private final Type type;
    private final int line;

    public error(Type type, int line) {
        this.type = type;
        this.line = line;
    }

    public Type getType() {
        return this.type;
    }

    public int getLine() {
        return this.line;
    }

    public String toString() {
        return this.line + " " + this.type.getTag();
    }

    public static boolean checkFormatString(String s) {
        System.out.println(s);
        int l = s.length();
        //"{<Char>}"
        if (s.charAt(0) != '"' || s.charAt(l - 1) != '"') {
            return false;
        }
        // ""
        if (l == 2) return true;
        // "as!d /n testIt"
        for (int i = 1; i <= l - 2; i++) {
            if (s.charAt(i) == '%') {
                if (s.charAt(i + 1) != 'd') return false;
                continue;
            }
            if (!partOfFormatStringCheck(s.charAt(i))) return false;
            if ((int) s.charAt(i) == 92 && s.charAt(i + 1) != 'n') return false;
        }
        return true;
    }

    public static boolean partOfFormatStringCheck(char c) {
        return (int) c == 32 || (int) c == 33 || (40 <= (int) c && (int) c <= 126);
    }

    private static void checkSign(ListIterator<Token> iterator, String s, Type type) {
        Token token = iterator.previous();
        iterator.next();
        Token token2 = iterator.next(); //";"
        if (!token2.getSign().equals(s)) {
            iterator.previous();
            errorTable.getInstance().addError(new error(type, token.getLine()));
            System.out.println(errorTable.getInstance().getErrors().get(errorTable.getInstance().getErrors().size() - 1));
        }
    }

    public static void checkSemicolon(ListIterator<Token> iterator) {
        checkSign(iterator, ";", error.Type.MISSING_SEMICOLON);
    }

    public static void checkRightParent(ListIterator<Token> iterator) {
        checkSign(iterator, ")", Type.MISSING_RIGHT_PARENT);
    }

    public static void checkRightBracket(ListIterator<Token> iterator) {
        checkSign(iterator, "]", Type.MISSING_RIGHT_BRACKET);
    }

    public enum Type {
        ILLEGAL_CHAR("a"),
        DUPLICATED_IDENT("b"),
        UNDEFINED_IDENT("c"),
        MISMATCH_PARAM_NUM("d"),
        MISMATCH_PARAM_TYPE("e"),
        RETURN_VALUE_VOID("f"),
        MISSING_RETURN("g"),
        MODIFY_CONST("h"),
        MISSING_SEMICOLON("i"),
        MISSING_RIGHT_PARENT("j"),
        MISSING_RIGHT_BRACKET("k"),
        MISMATCH_PRINTF("l"),
        CONTROL_OUTSIDE_LOOP("m"),
        ;

        private final String tag;

        Type(String tag) {
            this.tag = tag;
        }

        public String getTag() {
            return tag;
        }
    }


    @Override
    public boolean equals(Object obj) {
        return this.line == ((error) obj).getLine() &&
                this.type == ((error) obj).getType();
    }
}

