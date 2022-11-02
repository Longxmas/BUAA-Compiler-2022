package frontend.Parser.Decl;

import frontend.Lexer.Token;
import frontend.Parser.Decl.Elements.*;
import frontend.Parser.Expr.Elements.ConstExp;
import frontend.Parser.Expr.Elements.Exp;
import frontend.Parser.Expr.ExpressionParser;
import frontend.error.error;

import java.util.ArrayList;
import java.util.ListIterator;

public class DeclParser {
    /*
    <Decl>          := <ConstDecl> | <VarDecl>
    <BType>         := 'int'
    // Const
    <ConstDecl>     := 'const' <BType> <ConstDef> { ',' <ConstDef> } ';'
    <ConstDef>      := Ident { '[' <ConstExp> ']' } '=' <ConstInitVal>
    <ConstInitVal>  := <ConstExp> | '{' [ <ConstInitVal> { ',' <ConstInitVal> } ] '}'
    // Var
    <VarDecl>       := <BType> <VarDef> { ',' <VarDef> } ';'
    <VarDef>        := Ident { '[' <ConstExp> ']' } | Ident { '[' <ConstExp> ']' } '=' <InitVal>
    <InitVal>       := <Exp> | '{' [ <InitVal> { ',' <InitVal> } ] '}'
     */
    private final ListIterator<Token> iterator;
    private ArrayList<Token> tokens = new ArrayList<>();

    public DeclParser(ArrayList<Token> tokens) {
        this.iterator = tokens.listIterator();
    }

    public DeclParser(ListIterator<Token> iterator, ArrayList<Token> tokens) {
        this.iterator = iterator;
        this.tokens = tokens;
    }

    // <Decl>          := <ConstDecl> | <VarDecl>
    // FIRST(ConstDecl) = { "const" }
    // FIRST(VarDecl) = { "int" }
    public Decl parseDecl() {
        Token token = iterator.next();
        iterator.previous();
        if (token.getSign().equals("const")) {
            return parseConstDecl();
        } else {
            return parseVarDecl();
        }
    }

    private void checkSemicolon() {
        error.checkSemicolon(iterator);
    }

    // <ConstDecl>     := 'const' <BType> <ConstDef> { ',' <ConstDef> } ';'
    public ConstDecl parseConstDecl() {
        Token token = iterator.next(); //"const"
        ArrayList<ConstDef> constDefs = new ArrayList<>();
        ConstDef firstConstDef;
        if (!token.getSign().equals("const")) {
            iterator.previous();
            return null;
        } else {
            token = iterator.next(); //"int"
            firstConstDef = parseConstDef();
            constDefs.add(firstConstDef);
            token = iterator.next();
            while (token.getSign().equals(",")) {
                ConstDef constDef = parseConstDef();
                constDefs.add(constDef);
                token = iterator.next(); //"," or ";"
            }
            iterator.previous(); //回退一个以检查分号
            checkSemicolon();
            /*token = iterator.next();
            System.out.println("after constDef " + token + iterator.next());
            iterator.previous(); iterator.previous();*/

        }
        return new ConstDecl(constDefs);
    }

    // <ConstDef>      := Ident { '[' <ConstExp> ']' } '=' <ConstInitVal>
    public ConstDef parseConstDef() {
        Token ident = iterator.next();
        ArrayList<ConstExp> constExps = new ArrayList<>();
        if (!ident.getType().equals("IDENFR")) {
            iterator.previous();
            return null;
        }
        Token token = iterator.next(); //"[" or "="
        //System.out.println("ConstDef token = " + token);
        while (!token.getSign().equals("=")) {
            ConstExp constExp = new ExpressionParser(iterator).parseConstExp(); // 需要使用ExpressionParser，注意传入参数iterator
            constExps.add(constExp);
            error.checkRightBracket(iterator); //"]"
            token = iterator.next(); //"[",记得更新token
        }
        ConstInitVal constInitVal = parseConstInitVal();
        //System.out.println("ConstDef constInitVal = " + constInitVal);
        return new ConstDef(ident, constExps, constInitVal);
    }

    // <ConstInitVal>  := <ConstExp> | '{' [ <ConstInitVal> { ',' <ConstInitVal> } ] '}'
    public ConstInitVal parseConstInitVal() {
        Token token = iterator.next();
        ConstExp constExp = null;
        ArrayList<ConstInitVal> constInitVals = new ArrayList<>();
        if (!token.getSign().equals("{")) {
            iterator.previous();
            constExp = new ExpressionParser(iterator).parseConstExp();
            return new ConstInitVal(constExp, new ArrayList<>()); //注意： 返回一个新的ArrayList而不是null
        } else {
            token = iterator.next();
            if (token.getSign().equals("}")) {
                return new ConstInitVal(null,new ArrayList<>());
            }
            iterator.previous(); // 预读记得回退
            constInitVals.add(parseConstInitVal());
            token = iterator.next(); // "," or "}"
            while (!token.getSign().equals("}")) {
                constInitVals.add(parseConstInitVal());
                token = iterator.next();
            }
            return new ConstInitVal(null, constInitVals);
        }
    }

    // <VarDecl>       := <BType> <VarDef> { ',' <VarDef> } ';'
    public VarDecl parseVarDecl() {
        Token token = iterator.next(); //"int"
        //System.out.println("varDecl " + token + iterator.next()); iterator.previous();
        ArrayList<VarDef> varDefs = new ArrayList<>();
        VarDef firstVarDef;
        if (!token.getSign().equals("int")) {
            iterator.previous();
            return null;
        } else {
            firstVarDef = parseVarDef();
            varDefs.add(firstVarDef);
            //System.out.println("firstVarDef " + firstVarDef);
            token = iterator.next(); // "," or ";"
            while (token.getSign().equals(",")) {
                VarDef varDef = parseVarDef(); // System.out.println(varDef);
                varDefs.add(varDef);
                token = iterator.next(); //","
            }
            iterator.previous(); //回退一个以检查分号
            checkSemicolon();
        }
        return new VarDecl(varDefs);
    }


    // <VarDef>        := Ident { '[' <ConstExp> ']' }
    //                     | Ident { '[' <ConstExp> ']' } '=' <InitVal>
    public VarDef parseVarDef() {
        Token ident = iterator.next();
        //System.out.println("VarDef ident = " + ident);
        ArrayList<ConstExp> constExps = new ArrayList<>();
        InitVal initVal = null;
        if (!ident.getType().equals("IDENFR")) {
            iterator.previous();
            return null;
        }
        Token token = iterator.next(); //"[" or "=" or null
        while (token.getSign().equals("[")) {
            ConstExp constExp = new ExpressionParser(iterator).parseConstExp();
            constExps.add(constExp);
            error.checkRightBracket(iterator); //"]"
            token = iterator.next(); //"[" or "=" or null
        }
        if (token.getSign().equals("=")) {
            initVal = parseInitVal();
        } else {
            iterator.previous(); // 如果没有"="，需要回退
        }
        // System.out.println("initVal " + initVal + "\n");
        return new VarDef(ident, constExps, initVal);
    }

    // <InitVal>       := <Exp> | '{' [ <InitVal> { ',' <InitVal> } ] '}'
    public InitVal parseInitVal() {
        Token token = iterator.next();
        // System.out.println("initval token = " + token);
        Exp exp = null;
        ArrayList<InitVal> initVals = new ArrayList<>();

        if (!token.getSign().equals("{")) {
            iterator.previous();
            exp = new ExpressionParser(iterator).parseExp();
            // System.out.println("exp = " + exp);
            return new InitVal(exp,  new ArrayList<>());
        } else {
            token = iterator.next();
            if (token.getSign().equals("}")) {
                return new InitVal(null,new ArrayList<>());
            }
            iterator.previous();
            initVals.add(parseInitVal());
            token = iterator.next(); // "," or "}"
            while (!token.getSign().equals("}")) {
                InitVal initVal = parseInitVal();
                initVals.add(initVal);
                token = iterator.next(); // "," or "}"
            }
            return new InitVal(null, initVals);
        }
    }
}
