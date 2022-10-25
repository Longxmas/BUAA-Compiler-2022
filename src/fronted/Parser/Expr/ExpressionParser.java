package fronted.Parser.Expr;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.*;
import fronted.Parser.Expr.Elements.Number;

import java.util.ArrayList;
import java.util.ListIterator;

public class ExpressionParser {
    /*
    <LVal>          := Ident { '[' <Exp> ']' } // ident ArrayList<Exp>
    <PrimaryExp>    := '(' Exp ')' | LVal | Number // Look forward: '(' :: '('Exp')', <Ident> :: <LVal>, <IntConst> :: <Number>
    <FuncRParams>   := <Exp> { ',', <Exp> } // ArrayList<Exp>
    <UnaryExp>      := <PrimaryExp> | <Ident> '(' [<FuncRParams>] ')' | <UnaryOp> <UnaryExp>
    //-----------分割线-------------
    <MulExp>        := <UnaryExp> { ('*' | '/' | '%') <UnaryExp> }    // 消左递归, 转成循环形式
    <AddExp>        := <MulExp> { ('+' | '-') <MulExp> }
    <RelExp>        := <AddExp> { ('<' | '>' | '<=' | '>=') <AddExp> }
    <EqExp>         := <RelExp> { ('==' | '!=') <RelExp> }
    <LAndExp>       := <EqExp> { '&&' <EqExp> }
    <LOrExp>        := <LAndExp> { '||' <LAndExp> }
    <Exp>           := <AddExp>
    <Cond>          := <LOrExp>
    <ConstExp>      := <AddExp>
     */
    // FIRST(Exp) = {"(", "+", "-", "!", ident, intConst}
    // FIRST(LVal) = { ident }
    private ListIterator<Token> iterator;

    public ExpressionParser(ArrayList<Token> tokens) {
        this.iterator = tokens.listIterator();
    }

    public ExpressionParser(ListIterator<Token> iterator) {
        this.iterator = iterator;
    }

    // <LVal>          := Ident { '[' <Exp> ']' }
    // 注意：有参数就是指从ident之后开始parse（iterator 此时指向indent后一个token)
    public LVal parseLVal(Token ident) {
        ArrayList<Exp> exps = new ArrayList<>();
        while (iterator.hasNext()) {
            Token token1 = iterator.next();
            if (!token1.getSign().equals("[")) {
                iterator.previous();
                break;
            }
            Exp exp = parseExp();
            exps.add(exp);
            if (!iterator.hasNext() ||
                    !iterator.next().getSign().equals("]")) {
                return null; //TODO:错误处理
            }
        }
        return new LVal(ident, exps);
    }

    //<Exp>           := <AddExp>
    public Exp parseExp() {
        AddExp addExp = parseAddExp();
        return new Exp(addExp, new ArrayList<>(), new ArrayList<>());
    }

    // <ConstExp>      := <AddExp>
    public ConstExp parseConstExp() {
        AddExp addExp = parseAddExp();
        return new ConstExp(addExp, new ArrayList<>(), new ArrayList<>());
    }

    // <Cond>          := <LOrExp>
    public Cond parseCond() {
        LOrExp lOrExp = parseLOrExp();
        return new Cond(lOrExp, new ArrayList<>(), new ArrayList<>());
    }

    // <RelExp>        := <AddExp> { ('<' | '>' | '<=' | '>=') <AddExp> }
    public RelExp parseRelExp() {
        AddExp addExp = parseAddExp();
        ArrayList<AddExp> addExps = new ArrayList<>();
        ArrayList<Token> ops = new ArrayList<>();
        ArrayList<String> opsString = new ArrayList<String>() {
            {
                add(Token.wordsMap.get("<"));
                add(Token.wordsMap.get(">"));
                add(Token.wordsMap.get("<="));
                add(Token.wordsMap.get(">="));
            }
        };
        while (iterator.hasNext()) {
            Token token = iterator.next();
            if (!opsString.contains(token.getType())) {
                iterator.previous();
                break;
            }
            ops.add(token);
            AddExp addExp1 = parseAddExp();
            addExps.add(addExp1);
        }
        return new RelExp(addExp, addExps, ops);
    }

    // <EqExp>         := <RelExp> { ('==' | '!=') <RelExp> }
    public EqExp parseEqExp() {
        RelExp relExp = parseRelExp();
        ArrayList<RelExp> relExps = new ArrayList<>();
        ArrayList<Token> ops = new ArrayList<>();
        ArrayList<String> opsString = new ArrayList<String>() {
            {
                add(Token.wordsMap.get("=="));
                add(Token.wordsMap.get("!="));
            }
        };
        while (iterator.hasNext()) {
            Token token = iterator.next();
            if (!opsString.contains(token.getType())) {
                iterator.previous();
                break;
            }
            ops.add(token);
            RelExp relExp1 = parseRelExp();
            relExps.add(relExp1);
        }
        return new EqExp(relExp, relExps, ops);
    }

    // <LAndExp>       := <EqExp> { '&&' <EqExp> }
    public LAndExp parseLAndExp() {
        EqExp eqExp = parseEqExp();
        ArrayList<EqExp> eqExps = new ArrayList<>();
        ArrayList<Token> ops = new ArrayList<>();
        while (iterator.hasNext()) {
            Token token = iterator.next();
            if (!token.getSign().equals("&&")) {
                iterator.previous();
                break;
            }
            ops.add(token);
            EqExp eqExp1 = parseEqExp();
            eqExps.add(eqExp1);
        }
        return new LAndExp(eqExp, eqExps, ops);
    }

    // <LOrExp>        := <LAndExp> { '||' <LAndExp> }
    public LOrExp parseLOrExp() {
        LAndExp exp = parseLAndExp();
        ArrayList<LAndExp> exps = new ArrayList<>();
        ArrayList<Token> ops = new ArrayList<>();
        while (iterator.hasNext()) {
            Token token = iterator.next();
            if (!token.getSign().equals("||")) {
                iterator.previous();
                break;
            }
            ops.add(token);
            LAndExp exp1 = parseLAndExp();
            exps.add(exp1);
        }
        return new LOrExp(exp, exps, ops);
    }

    // <AddExp>        := <MulExp> { ('+' | '-') <MulExp> }
    public AddExp parseAddExp() {
        MulExp exp = parseMulExp();
        ArrayList<MulExp> exps = new ArrayList<>();
        ArrayList<Token> ops = new ArrayList<>();
        while (iterator.hasNext()) {
            Token token = iterator.next();
            if (!(token.getSign().equals("+") ||
                    token.getSign().equals("-"))) {
                iterator.previous();
                break;
            }
            ops.add(token);
            MulExp exp1 = parseMulExp();
            exps.add(exp1);
        }
        return new AddExp(exp, exps, ops);
    }

    // <MulExp>        := <UnaryExp> { ('*' | '/' | '%') <UnaryExp> }
    public MulExp parseMulExp() {
        UnaryExp exp = parseUnaryExp();
        ArrayList<UnaryExp> exps = new ArrayList<>();
        ArrayList<Token> ops = new ArrayList<>();
        while (iterator.hasNext()) {
            Token token = iterator.next();
            if (!(token.getSign().equals("*") ||
                    token.getSign().equals("/") ||
                    token.getSign().equals("%"))) {
                iterator.previous();
                break;
            }
            ops.add(token);
            UnaryExp exp1 = parseUnaryExp();
            exps.add(exp1);
        }
        return new MulExp(exp, exps, ops);
    }

    // <FuncRParams>   := <Exp> { ',', <Exp> } // ArrayList<Exp>
    // 原文法没有左递归
    public FuncRParams parseFuncRParams() {
        Exp exp = parseExp();
        ArrayList<Exp> exps = new ArrayList<>();
        exps.add(exp);
        while (iterator.hasNext()) {
            Token token = iterator.next();
            if (!token.getSign().equals(",")) {
                iterator.previous();
                break;
            }
            exp = parseExp();
            exps.add(exp);
        }
        return new FuncRParams(exps);
    }

    public Number parseNumber(Token intConst) {
        return new Number(intConst);
    }

    // <PrimaryExp>    := '(' <Exp> ')' | <LVal> | <Number>  三种情况, 子表达式, 左值, 数字常量
    public PrimaryExp parsePrimaryExp() {
        Token token = iterator.next();
        if (token.getSign().equals("(")) {
            Exp exp = parseExp();
            if (!iterator.next().getSign().equals(")")) {
                return null; //TODO:错误处理
            }
            return new PrimaryExp(exp);
        } else if (token.getType().equals("IDENFR")) {
            LVal lVal = parseLVal(token);
            return new PrimaryExp(lVal);
        } else if (token.getType().equals("INTCON")) {
            Number number = parseNumber(token);
            return new PrimaryExp(number);
        } else {
            return null; //TODO:错误处理
        }
    }

    // <UnaryExp>      := <PrimaryExp> | <Ident> '(' [<FuncRParams>] ')' | <UnaryOp> <UnaryExp>
    // FIRST(<PrimaryExp>) = {"(",ident,intConst}
    // FIRST(<Ident>) = {ident}
    // 但是往后继续看一步会有不同，LVal也就是PrimaryExp后面不会接"("
    public UnaryExp parseUnaryExp() {
        ArrayList<Token> unaryOps = new ArrayList<>();
        Token token = null, secondToken = null;
        if (iterator.hasNext()) {
            token = iterator.next(); // 第一个非op的token
            while (iterator.hasNext() &&
                    UnaryExp.UnaryOpTypeString.contains(token.getType())) {
                unaryOps.add(token);
                token = iterator.next();
            }
        }
        if (iterator.hasNext()) {
            FuncRParams funcRParams = null;
            secondToken = iterator.next();
            if (token.getType().equals("IDENFR") && secondToken.getSign().equals("(")) {
                System.out.println("Unary token = " + token + "Unary secondToken = " + secondToken);
                secondToken = iterator.next();
                iterator.previous(); // 预读之后记得回退iterator
                if (!secondToken.getSign().equals(")")) {
                    funcRParams = parseFuncRParams();
                }
                if (!iterator.hasNext() || !iterator.next().getSign().equals(")")) {
                    return null;
                }
                return new UnaryExp(unaryOps, token, funcRParams);
            } else {
                //TODO:错误处理
                iterator.previous();
                iterator.previous(); // 回退iterator
                PrimaryExp primaryExp = parsePrimaryExp();
                return new UnaryExp(unaryOps, primaryExp);
            }
        } else {
            return null; //TODO:error()
        }
    }

}
