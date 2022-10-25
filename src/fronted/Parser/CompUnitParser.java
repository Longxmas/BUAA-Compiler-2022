package fronted.Parser;

import fronted.Lexer.Token;
import fronted.Parser.Decl.DeclParser;
import fronted.Parser.Decl.Elements.Decl;
import fronted.Parser.FuncDef.Elements.FuncDef;
import fronted.Parser.FuncDef.Elements.MainFuncDef;
import fronted.Parser.FuncDef.FuncParser;

import java.util.ArrayList;
import java.util.ListIterator;

public class CompUnitParser {
    private final ListIterator<Token> iterator;
    private ArrayList<Token> tokens = new ArrayList<>();

    public CompUnitParser(ArrayList<Token> tokens) {
        this.iterator = tokens.listIterator();
        this.tokens = tokens;
    }

    public CompUnitParser(ListIterator<Token> iterator) {
        this.iterator = iterator;
    }

    public CompUnit parseCompUnit() {
        Token token1 = iterator.next();
        Token token2 = iterator.next();
        Token token3 = iterator.next();
        ArrayList<Decl> decls = new ArrayList<>();
        ArrayList<FuncDef> funcDefs = new ArrayList<>();
        iterator.previous();
        iterator.previous();
        iterator.previous();
        while (token1.getSign().equals("const")
                || (token1.getSign().equals("int") &&
                token2.getType().equals("IDENFR") &&
                (!token3.getSign().equals("("))
        )) {
            Decl decl = new DeclParser(iterator, tokens).parseDecl();
            decls.add(decl);
            token1 = iterator.next();
            token2 = iterator.next();
            token3 = iterator.next();
            iterator.previous();
            iterator.previous();
            iterator.previous();
        }

        while (token1.getSign().equals("void")
                || (token1.getSign().equals("int")
                && token2.getType().equals("IDENFR")
                && token3.getSign().equals("("))
        ) {
            FuncDef funcDef = new FuncParser(iterator, tokens).parseFuncDef();
            //System.out.println("CompUnit funcDef = " + funcDef);
            funcDefs.add(funcDef);
            token1 = iterator.next();
            token2 = iterator.next();
            token3 = iterator.next();
            iterator.previous();
            iterator.previous();
            iterator.previous();
        }

        MainFuncDef mainFuncDef = new FuncParser(iterator, tokens).parseMainFuncDef();
        return new CompUnit(decls, funcDefs, mainFuncDef);
    }

}
