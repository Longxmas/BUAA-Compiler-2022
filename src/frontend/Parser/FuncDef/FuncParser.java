package frontend.Parser.FuncDef;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.ConstExp;
import frontend.Parser.Expr.ExpressionParser;
import frontend.Parser.FuncDef.Elements.*;
import frontend.Parser.Stmt.Elements.Block;
import frontend.Parser.Stmt.StmtParser;
import frontend.error.error;

import java.util.ArrayList;
import java.util.ListIterator;

public class FuncParser {
    /*
    <FuncDef>       := <FuncType> Ident '(' [<FuncFParams> ] ')' <Block>
    <MainFuncDef>   := 'int' 'main' '(' ')' <Block>
    <FuncType>      := 'void' | 'int'
    <FuncFParams>   := <FuncFParam> { ',' <FuncFParam> }
    <FuncFParam>    := <BType> Ident [ '[' ']' { '[' <ConstExp> ']' } ]
     */
    private final ListIterator<Token> iterator;
    private ArrayList<Token> tokens = new ArrayList<>();

    public FuncParser(ArrayList<Token> tokens) {
        this.iterator = tokens.listIterator();
        this.tokens = tokens;
    }

    public FuncParser(ListIterator<Token> iterator, ArrayList<Token> tokens) {
        this.iterator = iterator;
        this.tokens = tokens;
    }

    public FuncType parseFuncType(Token type) {
        return new FuncType(type);
    }

    // <FuncFParam>    := <BType> Ident [ '[' ']' { '[' <ConstExp> ']' } ]
    public FuncFParam parseFuncFParam() {
        Token token = iterator.next(); //"int"
        Token ident = iterator.next(); //ident
        token = iterator.next(); //"["
        ArrayList<ConstExp> constExps = new ArrayList<>();
        if (!token.getSign().equals("[")) {
            iterator.previous();
            return new FuncFParam(ident, false, new ArrayList<>());
        } else {
            error.checkRightBracket(iterator); //"]"
            token = iterator.next();
            while (token.getSign().equals("[")) {
                ConstExp constExp = new ExpressionParser(iterator).parseConstExp();
                constExps.add(constExp);
                error.checkRightBracket(iterator); //"]"
                token = iterator.next();
            }
            iterator.previous(); //当最后一个字符为可能出现时，需要撤一格
            return new FuncFParam(ident, true, constExps);
        }
    }

    // <FuncFParams>   := <FuncFParam> { ',' <FuncFParam> }
    public FuncFParams parseFuncFParams() {
        Token token;
        ArrayList<FuncFParam> funcFParams = new ArrayList<>();
        funcFParams.add(parseFuncFParam());
        token = iterator.next();
        while (token.getSign().equals(",")) {
            //System.out.println("FuncFParams token = " + token);
            FuncFParam fp = parseFuncFParam();
            funcFParams.add(fp);
            token = iterator.next(); // “,” or null
        }
        iterator.previous();
        return new FuncFParams(funcFParams);
    }

    // <MainFuncDef>   := 'int' 'main' '(' ')' <Block>
    public MainFuncDef parseMainFuncDef() {
        Token token = iterator.next(); //"int"
        iterator.next(); //"main"
        iterator.next(); //"("
        error.checkRightParent(iterator); //")"
        Block block = new StmtParser(iterator, tokens).parseBlock();
        return new MainFuncDef(block);
    }

    // <FuncDef>       := <FuncType> Ident '(' [<FuncFParams> ] ')' <Block>
    public FuncDef parseFuncDef() {
        //System.out.println("Start parseFuncDef\n");
        Token type = iterator.next(); //void or int
        FuncType funcType = parseFuncType(type);
        Token ident = iterator.next(); //"ident"
        FuncFParams funcFParams = null;
        Token token = iterator.next(); //"("
        token = iterator.next(); // BType or ")"
        //System.out.println("FuncDef token = " + token);
        if (token.getSign().equals("int")) {
            iterator.previous();
            funcFParams = parseFuncFParams();
        } else iterator.previous();
        error.checkRightParent(iterator);
        Block block = new StmtParser(iterator, tokens).parseBlock();
        return new FuncDef(funcType, ident, funcFParams, block);
    }
}
