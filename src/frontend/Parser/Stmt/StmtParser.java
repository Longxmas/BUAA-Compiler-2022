package frontend.Parser.Stmt;

import frontend.Lexer.Token;

import java.util.ArrayList;
import java.util.ListIterator;

import frontend.Parser.Decl.DeclParser;
import frontend.Parser.Decl.Elements.Decl;
import frontend.Parser.Expr.Elements.Exp;
import frontend.Parser.Expr.Elements.LVal;
import frontend.Parser.Expr.ExpressionParser;
import frontend.Parser.Expr.Elements.Cond;
import frontend.Parser.Stmt.Elements.*;
import frontend.error.error;
import frontend.error.errorTable;

public class StmtParser {
    /*
    <BreakStmt>     := 'break'';'
    <ContinueStmt>  := 'continue'';'
    <ReturnStmt>    := 'return' [<Exp>]';'
    <OutputStmt>    := 'printf' '(' FormatString { ',' <Exp> } ')'';'
    <BlockStmt> 	:= <Block>
    <LValStmt>		:= <LVal> '=' <Exp> ';' | <LVal> '=' 'getint' '(' ')' ';'
    <IfElseStmt>    := 'if' '(' <Cond> ')' <Stmt> [ 'else' <Stmt> ]
    <WhileStmt>     := 'while' '(' <Cond> ')' <Stmt>
    <ExpStmt> 		:= [<Exp>] ';'

    <BlockItem>     := <Decl> | <Stmt>
    <Block>         := '{' { <BlockItem> } '}'
     */
    // FIRST(Exp) = {"(", "+", "-", "!", ident, intConst}
    private final ListIterator<Token> iterator;
    private ArrayList<Token> tokens = new ArrayList<>();

    public StmtParser(ArrayList<Token> tokens) {
        this.iterator = tokens.listIterator();
        this.tokens = tokens;
    }

    public StmtParser(ListIterator<Token> iterator, ArrayList<Token> tokens) {
        this.iterator = iterator;
        this.tokens = tokens;
    }

    // <IfElseStmt>    := 'if' '(' <Cond> ')' <Stmt> [ 'else' <Stmt> ]
    public IfElseStmt parseIfElseStmt(Token ifToken) {
        //已经parse了if
        Token leftToken = iterator.next(); // “(”
        //System.out.println("IfelseStmt leftToken = " + leftToken);
        Cond cond = new ExpressionParser(iterator).parseCond();
        error.checkRightParent(iterator);// ")"
        //System.out.println("IfelseStmt rightToken = " + rightToken);
        Stmt ifStmt = parseStmt();
        Stmt elseStmt = null;
        Token elseToken = null;
        if (iterator.hasNext()) {
            elseToken = iterator.next();
            //System.out.println("IfElseStmt elseToken = " + elseToken);
            if (!elseToken.getSign().equals("else")) {
                iterator.previous();
                elseToken = null;
            } else {
                elseStmt = parseStmt();
                //System.out.println("IfElseStmt elseStmt = " + elseStmt);
            }
        }
        return new IfElseStmt(ifToken, cond, ifStmt, elseToken, elseStmt);
    }

    // <WhileStmt>     := 'while' '(' <Cond> ')' <Stmt>
    public WhileStmt parseWhileStmt(Token whileToken) {
        Token token = iterator.next(); //"("
        Cond cond = new ExpressionParser(iterator).parseCond();
        error.checkRightParent(iterator); //")"
        Stmt stmt = parseStmt();
        return new WhileStmt(whileToken, cond, stmt);
    }

    private void checkSemicolon() {
        error.checkSemicolon(iterator);
    }

    // <PrintStmt>    := 'printf' '(' FormatString { ',' <Exp> } ')'';'
    public PrintStmt parsePrintStmt(Token printToken) {
        Token token = iterator.next(); //"("
        Token formatString = iterator.next();
        ArrayList<Exp> exps = new ArrayList<>();
        token = iterator.next(); // "," or ")"
        while (iterator.hasNext() && token.getSign().equals(",")) {
            exps.add(new ExpressionParser(iterator).parseExp());
            token = iterator.next(); //解析完成后都需要next才能获得当前表达式的第一项
        }
        iterator.previous(); //回退一个检查右小括号
        error.checkRightParent(iterator);
        checkSemicolon();
        return new PrintStmt(printToken, formatString, exps);
    }

    // <ReturnStmt>    := 'return' [<Exp>]';'
    public ReturnStmt parseReturnStmt(Token returnToken) {
        Token token = iterator.next();
        iterator.previous();
        //找出Exp的FIRST集合
        if (token.getSign().equals("(")
                || token.getSign().equals("+")
                || token.getSign().equals("-")
                || token.getSign().equals("!")
                || token.getType().equals("IDENFR")
                || token.getType().equals("INTCON")) {
            Exp exp = new ExpressionParser(iterator).parseExp();
            checkSemicolon(); //";"
            return new ReturnStmt(returnToken, exp);
        } else {
            checkSemicolon();
            return new ReturnStmt(returnToken, null);
        }
    }

    // <BreakStmt>     := 'break'';'
    public BreakStmt parseBreakStmt(Token breakToken) {
        checkSemicolon();
        return new BreakStmt(breakToken);
    }

    // <ContinueStmt>  := 'continue'';'
    public ContinueStmt parseContinueStmt(Token continueToken) {
        checkSemicolon();
        return new ContinueStmt(continueToken);
    }

    // <LValStmt>		:= <LVal> '=' <Exp> ';' | <LVal> '=' 'getint' '(' ')' ';'
    // FIRST(Exp) = {"(", "+", "-", "!", ident, intConst}
    public LValStmt parseLValStmt(LVal lval) {
        //假设已经解析好了LVal
        Token firstToken = iterator.next(); //"="
        Token secondToken = iterator.next();
        if (secondToken.getSign().equals("getint")) {
            iterator.next(); //"("
            error.checkRightParent(iterator); // ")"
            checkSemicolon(); // ";"
            return new LValStmt(lval, null, secondToken);
        } else if (secondToken.getSign().equals(";")) {
            return new LValStmt(lval, null, null);
        } else if (secondToken.getSign().equals("(")
                || secondToken.getSign().equals("+")
                || secondToken.getSign().equals("-")
                || secondToken.getSign().equals("!")
                || secondToken.getType().equals("IDENFR")
                || secondToken.getType().equals("INTCON")) {
            iterator.previous();
            Exp exp = new ExpressionParser(iterator).parseExp();
            checkSemicolon(); // ";"
            return new LValStmt(lval, exp, null);
        } else {
            return null;
        }
    }

    // <BlockItem>     := <Decl> | <Stmt>
    // FIRST(decl) = {"const", "int"}
    public BlockItem parseBlockItem() {
        //System.out.println("Start parse BlockItem\n");
        Token token = iterator.next();
        //System.out.println("BlockItem token = " + token);
        iterator.previous();
        //找到decl的FIRST集合
        if (token.getSign().equals("const")
                || token.getSign().equals("int")) {
            Decl decl = new DeclParser(iterator, tokens).parseDecl();
            return new BlockItem(decl, null);
        } else {
            Stmt stmt = parseStmt();
            return new BlockItem(null, stmt);
        }
    }

    // <Block>         := '{' { <BlockItem> } '}'
    public Block parseBlock() {
        //System.out.println("Start parse Block\n");
        Token token = iterator.next(); //"{"
        token = iterator.next();
        ArrayList<BlockItem> blockItems = new ArrayList<>();
        while (!token.getSign().equals("}")) {
            iterator.previous();
            BlockItem blockItem = parseBlockItem();
            blockItems.add(blockItem);
            token = iterator.next();
            //System.out.println("Block token = " + token);
        }
        return new Block(blockItems, token);
    }

    // <BlockStmt> 	:= <Block>
    public BlockStmt parseBlockStmt(Token leftToken) {
        Token token = iterator.next();
        ArrayList<BlockItem> blockItems = new ArrayList<>();
        while (!token.getSign().equals("}")) {
            iterator.previous();
            BlockItem blockItem = parseBlockItem();
            blockItems.add(blockItem);
            token = iterator.next();
        }
        return new BlockStmt(new Block(blockItems, token));
    }

    //
    public Stmt parseStmt() {
        Token token = iterator.next();
        Token token2 = iterator.next();
        iterator.previous();
        switch (token.getSign()) {
            case "if":
                return parseIfElseStmt(token);
            case "while":
                return parseWhileStmt(token);
            case "break":
                return parseBreakStmt(token);
            case "continue":
                return parseContinueStmt(token);
            case "printf":
                return parsePrintStmt(token);
            case "return":
                return parseReturnStmt(token);
            case "{":
                return parseBlockStmt(token);
            default:
                break;
        }

        //Follow(Stmt) = {'const','int','}','else'}
        if (token.getSign().equals("const")
                || token.getSign().equals("int")
                || token.getSign().equals("}")
                || token.getSign().equals("else")) {
            iterator.previous();
            Token token3 = iterator.previous();
            iterator.next();
            errorTable.getInstance().addError(new error(error.Type.MISSING_SEMICOLON, token3.getLine()));
        }

        if (token.getSign().equals(";")) {
            return new ExpStmt(null);
        }

        //如果是单纯的Exp且不是LVal
        if (token.getSign().equals("(")
                || token.getSign().equals("+")
                || token.getSign().equals("-")
                || token.getSign().equals("!")
                || (token.getType().equals("IDENFR")
                && token2.getSign().equals("("))
                || token.getType().equals("INTCON")) {
            iterator.previous(); //退回到一开始
            Exp exp = new ExpressionParser(iterator).parseExp();
            checkSemicolon(); //";"
            return new ExpStmt(exp);
        } else {
            //新建一个临时的用于查看下一元素的迭代器
            //System.out.println(tokens);
            ListIterator<Token> tempIterator = tokens.listIterator(tokens.indexOf(token) + 1);
            //token == ident
            LVal lVal = new ExpressionParser(tempIterator).parseLVal(token);
            //System.out.println("LValStmt Lval = \n" + lVal);
            Token token3 = tempIterator.next();
            //System.out.println("LValStmt token3 = " + token3);
            if (token3.getSign().equals("=")) {
                //一定是LValStmt，同步iterator并且解析LValStmt
                //System.out.println("Start LValStmt\n");
                lVal = new ExpressionParser(iterator).parseLVal(token);
                return parseLValStmt(lVal);
            } else {
                //否则解析exp
                iterator.previous(); //退回到一开始
                Exp exp = new ExpressionParser(iterator).parseExp();
                checkSemicolon(); //";"
                return new ExpStmt(exp);
            }
        }


    }


}
