package fronted.visitor;

import fronted.Lexer.Token;
import fronted.Parser.CompUnit;
import fronted.Parser.Decl.Elements.*;
import fronted.Parser.Expr.Elements.*;
import fronted.Parser.FuncDef.Elements.FuncDef;
import fronted.Parser.FuncDef.Elements.FuncFParam;
import fronted.Parser.FuncDef.Elements.FuncFParams;
import fronted.Parser.FuncDef.Elements.MainFuncDef;
import fronted.Parser.Stmt.Elements.*;
import fronted.error.error;
import fronted.error.errorTable;
import middle.Symbol.FuncTable;
import middle.Symbol.Symbol;
import middle.Symbol.SymbolTable;
import middle.operand.Immediate;
import middle.operand.Operand;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import static fronted.visitor.CalExp.*;

public class visitor {
    private SymbolTable globalSymbolTable = new SymbolTable();
    private SymbolTable currentTable = globalSymbolTable;
    private int currentDepth = 0;
    private ArrayList<Integer> depths = new ArrayList<Integer>() {{
        for (int i = 0; i < 200; i++) add(0);
    }};
    private HashMap<String, FuncTable> funcTables = new HashMap<>();
    private ArrayList<SymbolTable> symbolTables = new ArrayList<>();
    private HashMap<String, SymbolTable> depth2Table = new HashMap<>();
    private FuncTable currentFuncTable = null;
    private int inWhile = 0;

    public void analyseBlock(Block block) {
        currentDepth++;
        currentTable = new SymbolTable(currentDepth, depths.get(currentDepth), currentTable);
        depth2Table.put(currentDepth + " " + depths.get(currentDepth), currentTable);
        depths.set(currentDepth, depths.get(currentDepth) + 1);
        for (BlockItem blockItem : block.getBlockItems()) {
            if (blockItem.getDecl() != null) {
                analyseDecl(blockItem.getDecl());
            } else {
                analyseStmt(blockItem.getStmt());
            }
        }
        symbolTables.add(currentTable);
        currentTable = currentTable.getParent();
        currentDepth--;
    }

    //Stmt
    public void analyseStmt(Stmt stmt) {
        if (stmt instanceof BreakStmt) {
            analyseBreakStmt((BreakStmt) stmt);
        } else if (stmt instanceof ContinueStmt) {
            analyseContinueStmt((ContinueStmt) stmt);
        } else if (stmt instanceof ReturnStmt) {
            analyseReturnStmt((ReturnStmt) stmt);
        } else if (stmt instanceof PrintStmt) {
            analysePrintStmt((PrintStmt) stmt);
        } else if (stmt instanceof LValStmt) {
            analyseLValStmt((LValStmt) stmt);
        } else if (stmt instanceof ExpStmt) {
            analyseExpStmt((ExpStmt) stmt);
        } else if (stmt instanceof WhileStmt) {
            analyseWhileStmt((WhileStmt) stmt);
        } else if (stmt instanceof IfElseStmt) {
            analyseIfElseStmt((IfElseStmt) stmt);
        } else if (stmt instanceof BlockStmt) {
            analyseBlockStmt((BlockStmt) stmt);
        }
    }

    public Symbol findLValSymbol(String name, Token token, boolean checkError) {
        SymbolTable temp = currentTable;
        while (temp != null) {
            if (temp.getSymbolMap().containsKey(name)) {
                return temp.getSymbolMap().get(name);
            } else temp = temp.getParent();
        }
        if (checkError) {
            errorTable.getInstance().addError(new error(error.Type.UNDEFINED_IDENT, token.getLine()));
        }
        return null;
    }

    public void analyseLValStmt(LValStmt lValStmt) {
        LVal lval = lValStmt.getlVal();
        Symbol symbol = findLValSymbol(lval.getIdent().getSign(), lval.getIdent(), true);
        Exp exp = lValStmt.getExp();
        if (symbol != null && symbol.isConst())
            errorTable.getInstance().addError(new error(error.Type.MODIFY_CONST, lval.getIdent().getLine()));
        if (lValStmt.getGetintToken() != null) {
            //TODO:getint()
        } else {
            analyseExp(exp);
        }
    }

    public void analyseBlockStmt(BlockStmt stmt) {
        analyseBlock(stmt.getBlock());
    }

    public void analyseBreakStmt(BreakStmt stmt) {
        if (inWhile == 0)
            errorTable.getInstance().addError(new error(error.Type.CONTROL_OUTSIDE_LOOP, stmt.getLine()));
    }

    public void analyseContinueStmt(ContinueStmt stmt) {
        if (inWhile == 0)
            errorTable.getInstance().addError(new error(error.Type.CONTROL_OUTSIDE_LOOP, stmt.getLine()));
    }

    public void analyseReturnStmt(ReturnStmt stmt) {
        if (stmt.getExp() != null) {
            analyseExp(stmt.getExp());
        }
        if (stmt.hasValue() && currentFuncTable.getReturnType().equals(FuncTable.ReturnType.voidFunc))
            errorTable.getInstance().addError(new error(error.Type.RETURN_VALUE_VOID, stmt.getLine()));
    }

    public void analysePrintStmt(PrintStmt printStmt) {
        Token format = printStmt.getFormatString();
        int number = 0;
        for (int i = 0; i < format.getSign().length() - 1; i++) {
            if (format.getSign().charAt(i) == '%' && format.getSign().charAt(i + 1) == 'd') number++;
        }
        if (number != printStmt.getExps().size()) {
            errorTable.getInstance().addError(new error(error.Type.MISMATCH_PRINTF, format.getLine()));
        }
        for (Exp exp : printStmt.getExps()) {
            analyseExp(exp);
        }
    }

    public void analyseIfElseStmt(IfElseStmt ifElseStmt) {
        analyseCond(ifElseStmt.getCond());
        analyseStmt(ifElseStmt.getIfStmt());
        if (ifElseStmt.getElseStmt() != null) {
            analyseStmt(ifElseStmt.getElseStmt());
        }
    }

    public void analyseWhileStmt(WhileStmt stmt) {
        inWhile++;
        analyseCond(stmt.getCond());
        analyseStmt(stmt.getStmt());
        inWhile--;
    }

    public void analyseExpStmt(ExpStmt expStmt) {
        if (expStmt.getExp() != null) analyseExp(expStmt.getExp());
    }

    //Expression
    public void analyseExp(Exp exp) {
        analyseAddExp(exp.getFirstSon());
    }

    public void analyseConstExp(ConstExp exp) {
        analyseAddExp(exp.getFirstSon());
    }

    public void analyseAddExp(AddExp exp) {
        analyseMulExp(exp.getFirstSon());
        for (MulExp exp1 : exp.getSons()) {
            analyseMulExp(exp1);
        }
    }

    public void analyseCond(Cond cond) {
        analyseLOrExp(cond.getFirstSon());
    }

    public void analyseLOrExp(LOrExp exp) {
        analyseLAndExp(exp.getFirstSon());
        for (LAndExp exp1 : exp.getSons()) {
            analyseLAndExp(exp1);
        }
    }

    public void analyseLAndExp(LAndExp exp) {
        analyseEqExp(exp.getFirstSon());
        for (EqExp exp1 : exp.getSons()) {
            analyseEqExp(exp1);
        }
    }

    public void analyseEqExp(EqExp exp) {
        analyseRelExp(exp.getFirstSon());
        for (RelExp exp1 : exp.getSons()) {
            analyseRelExp(exp1);
        }
    }

    public void analyseRelExp(RelExp exp) {
        analyseAddExp(exp.getFirstSon());
        for (AddExp exp1 : exp.getSons()) {
            analyseAddExp(exp1);
        }
    }

    public void analyseMulExp(MulExp exp) {
        analyseUnaryExp(exp.getFirstSon());
        for (UnaryExp exp1 : exp.getSons()) {
            analyseUnaryExp(exp1);
        }
    }


    public void analyseUnaryExp(UnaryExp exp) {
        //注意需要处理unaryOp
        if (exp.getPrimaryExp() != null) analysePrimaryExp(exp.getPrimaryExp());
        Token ident = exp.getIdent(); //函数名
        if (ident != null) {
            FuncTable funcTable = funcTables.get(ident.getSign());
            if (funcTable == null) {
                errorTable.getInstance().addError(new error(error.Type.UNDEFINED_IDENT, ident.getLine()));
            } else {
                //System.out.println(funcTable.getName());
                FuncRParams funcRParams = exp.getFuncRParams();
                ArrayList<Exp> params = new ArrayList<>();
                if (funcRParams != null) {
                    params = funcRParams.getExps();
                }
                ArrayList<Symbol> args = funcTable.getParams();
                if (params.size() != args.size()) {
                    //System.out.println(params.size() + " " + args.size());
                    errorTable.getInstance().addError(new error(error.Type.MISMATCH_PARAM_NUM, ident.getLine()));
                } else {
                    for (int i = 0; i < params.size(); i++) {
                        Symbol arg = args.get(i);
                        Exp param = params.get(i);
                        analyseExp(param);
                        Symbol.SymbolType type = checkExp(param);
                        //type == array && arg == var
                        if (type == null || type != arg.getSymbolType()) {
                            errorTable.getInstance().addError(new error(error.Type.MISMATCH_PARAM_TYPE, ident.getLine()));
                        }
                        if (type != null && type.equals(Symbol.SymbolType.Array) &&
                                arg.getSymbolType().equals(Symbol.SymbolType.Array)) {
                            LVal arrayLVal = getArrayLVal(params.get(i)); // 数组左值表达式
                            ArrayList<Exp> exps = arrayLVal.getExps();
                            Symbol array = findLValSymbol(arrayLVal.getIdent().getSign(), arrayLVal.getIdent(), true); //实际的声明数组b[2][3]
                            //arg: int c[][3]
                            if (array != null && arg.getDims().size() != array.getDims().size() - exps.size()) {
                                System.out.println(arg.getDims().size() + " " + (array.getDims().size() - exps.size()));
                                errorTable.getInstance().addError(new error(error.Type.MISMATCH_PARAM_TYPE, ident.getLine()));
                            } else if (array != null && arg.getDims().size() == array.getDims().size() - exps.size()) {
                                if (arg.getDims().size() == 2 && array.getDims().get(1) != arg.getDims().get(1)) {
                                    System.out.println(array.getDims().get(1) + " " + arg.getDims().get(1));
                                    errorTable.getInstance().addError(new error(error.Type.MISMATCH_PARAM_TYPE, ident.getLine()));
                                }
                            }

                        }
                    }
                }

            }
        }
    }

    private LVal getArrayLVal(Exp exp) {
        PrimaryExp primaryExp = exp.getFirstSon().getFirstSon().getFirstSon().getPrimaryExp();
        if (primaryExp.getExp() != null) return getArrayLVal(primaryExp.getExp());
        return primaryExp.getlVal();
    }

    private Symbol.SymbolType checkExp(Exp exp) {
        AddExp addexp = exp.getFirstSon();
        if (addexp.getSons().size() > 0) return Symbol.SymbolType.Var;
        MulExp mulExp = addexp.getFirstSon();
        if (mulExp.getSons().size() > 0) return Symbol.SymbolType.Var;
        UnaryExp unaryExp = mulExp.getFirstSon();
        PrimaryExp primaryExp = unaryExp.getPrimaryExp();
        LVal lVal;
        if (primaryExp != null) {
            if (primaryExp.getExp() != null) return checkExp(primaryExp.getExp());
            else if (primaryExp.getlVal() != null) {
                lVal = primaryExp.getlVal();
                Symbol symbol = findLValSymbol(lVal.getIdent().getSign(), lVal.getIdent(), true);
                ArrayList<Exp> exps = lVal.getExps();
                if (symbol == null) return Symbol.SymbolType.Var;
                if (symbol.getDims().size() - exps.size() == 0) return Symbol.SymbolType.Var;
                else return Symbol.SymbolType.Array;
            } else return Symbol.SymbolType.Var;
        }
        Token ident = unaryExp.getIdent();
        if (ident != null) {
            FuncTable funcTable = funcTables.get(ident.getSign());
            return funcTable.getReturnType() == FuncTable.ReturnType.intFunc ?
                    Symbol.SymbolType.Var : null;
        }
        return null;
    }

    public void analysePrimaryExp(PrimaryExp exp) {
        if (exp.getExp() != null) {
            analyseExp(exp.getExp());
        } else if (exp.getlVal() != null) {
            analyseLVal(exp.getlVal());
        } else {
            Immediate immediate = new Immediate(exp.getNumber().getValue());
        }
    }

    public void analyseLVal(LVal lVal) {
        Symbol symbol = findLValSymbol(lVal.getIdent().getSign(), lVal.getIdent(), true);
    }

    //Decl
    public void analyseDecl(Decl decl) {
        if (decl instanceof ConstDecl) {
            analyseConstDecl((ConstDecl) decl);
        } else {
            analyseVarDecl((VarDecl) decl);
        }
    }

    public void analyseConstDecl(ConstDecl decl) {
        for (ConstDef def : decl.getConstDefs()) {
            analyseConstDef(def);
        }
    }

    public void partOfAnalyseConstDef(ConstInitVal constInitVal, ArrayList<Integer> initArray, int dim) {
        for (ConstInitVal init : constInitVal.getConstInitVals()) {
            initArray.add(new CalExp(currentTable).CalculateConstExp(init.getConstExp()));
        }
        if (constInitVal.getConstInitVals().size() == 0) {
            for (int i = 0; i < dim; i++) initArray.add(0);
        }
    }

    public void analyseConstDef(ConstDef def) {
        boolean hasError = false;
        Token ident = def.getIdent();
        ConstInitVal constInitVal = def.getConstInitVal();
        ArrayList<ConstExp> exps = def.getConstExps();
        ConstExp initExp = constInitVal.getConstExp();
        if (currentTable.contains(ident.getSign())) {
            errorTable.getInstance().addError(new error(error.Type.DUPLICATED_IDENT, ident.getLine()));
            hasError = true;
        }
        if (initExp != null && !hasError) {
            //constVar
            int initValue = new CalExp(currentTable).CalculateConstExp(initExp);
            Symbol symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var, true, initValue);
            currentTable.addSymbol(symbol);
        } else if (initExp == null && !hasError) {
            //Array
            ArrayList<Integer> dims = new ArrayList<>();
            for (ConstExp exp : exps) {
                dims.add(new CalExp(currentTable).CalculateConstExp(exp));
            }
            ArrayList<Integer> initArray = new ArrayList<>();
            int dimCount = exps.size();
            if (dimCount == 1) {
                partOfAnalyseConstDef(constInitVal, initArray, dims.get(0));
            } else if (dimCount == 2) {
                int dim1 = dims.get(0);
                int dim2 = dims.get(1);
                for (int i = 0; i < dim1; i++) {
                    partOfAnalyseConstDef(constInitVal.getConstInitVals().get(i), initArray, dim2);
                }
            }
            Symbol symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array, true, dims, initArray);
            currentTable.addSymbol(symbol);
        }
    }

    public void analyseVarDecl(VarDecl decl) {
        for (VarDef def : decl.getVarDefs()) {
            analyseVarDef(def);
        }
    }

    private void analyseVarDef(VarDef def) {
        boolean hasError = false;
        Token ident = def.getIdent();
        ArrayList<ConstExp> exps = def.getConstExps();
        ArrayList<Integer> dims = new ArrayList<>();
        Symbol symbol = null;
        for (ConstExp exp : exps) {
            dims.add(new CalExp(currentTable).CalculateConstExp(exp));
        }
        if (currentTable.contains(ident.getSign())) {
            errorTable.getInstance().addError(new error(error.Type.DUPLICATED_IDENT, ident.getLine()));
            hasError = true;
        }
        InitVal initVal = def.getInitVal();
        if (initVal == null && !hasError) {
            if (exps.size() == 0) {
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var, false, (Integer) null);
            } else {
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims, new ArrayList<>());
            }
            currentTable.addSymbol(symbol);
        } else if (initVal != null && !hasError) {
            analyseInitVal(initVal);
            Exp exp = initVal.getExp();
            if (exp != null) {
                analyseExp(exp);
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var, false, null);
            } else {
                //Array
                ArrayList<Integer> initArray = new ArrayList<>();
                int dimCount = exps.size();
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims, null);
            }
            currentTable.addSymbol(symbol);
        }
        //if (symbol != null) System.out.println(symbol);
    }

    public void analyseInitVal(InitVal initVal) {
        if (initVal.getExp() != null) {
            analyseExp(initVal.getExp());
        } else {
            for (InitVal val : initVal.getInitVals()) {
                analyseInitVal(val);
            }
        }
    }

    //Def
    public void analyseFuncDef(FuncDef funcDef) {
        String name = funcDef.getIdent().getSign();
        FuncFParams funcFParams = funcDef.getFuncFParams();
        ArrayList<FuncFParam> funcFParamsList = funcFParams != null ? funcDef.getFuncFParams().getFuncFParams() : new ArrayList<>();
        FuncTable.ReturnType returnType = funcDef.getFuncType().getType().getSign().equals("void") ?
                FuncTable.ReturnType.voidFunc : FuncTable.ReturnType.intFunc;
        if (funcTables.containsKey(name) || currentTable.contains(name)) {
            errorTable.getInstance().addError(new error(error.Type.DUPLICATED_IDENT, funcDef.getIdent().getLine()));
        } else {
            currentDepth++;
            currentTable = new SymbolTable(currentDepth, depths.get(currentDepth), currentTable);
            depths.set(currentDepth, depths.get(currentDepth) + 1);
            FuncTable funcTable = new FuncTable(name, returnType, currentTable);
            funcTables.put(name, funcTable);
            currentFuncTable = funcTable;
            for (FuncFParam funcFParam : funcFParamsList) {
                analyseFuncFParam(funcFParam, funcTable);
            }
            analyseFuncBody(funcDef.getBlock(), funcTable);
            currentTable = currentTable.getParent();
            currentDepth--;
        }
    }

    public void analyseFuncFParam(FuncFParam fp, FuncTable funcTable) {
        String name = fp.getIdent().getSign();
        Symbol arg;
        if (funcTable.getParamTable().contains(name)) {
            errorTable.getInstance().addError(new error(error.Type.DUPLICATED_IDENT, fp.getIdent().getLine()));
        }
        if (!fp.isArray()) arg = new Symbol(name, Symbol.BasicType.INT, Symbol.SymbolType.Var, false, null);
        else {
            ArrayList<Integer> dims = new ArrayList<>();
            dims.add(0);
            ArrayList<ConstExp> exps = fp.getConstExps();
            for (ConstExp exp : exps) {
                dims.add(new CalExp(currentTable).CalculateConstExp(exp));
            }
            arg = new Symbol(name, Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims, null);
        }
        funcTable.addParam(arg);
    }

    public void analyseFuncBody(Block block, FuncTable funcTable) {
        ArrayList<Stmt> stmts = new ArrayList<>();
        for (BlockItem blockItem : block.getBlockItems()) {
            if (blockItem.getDecl() != null) {
                analyseDecl(blockItem.getDecl());
            } else {
                analyseStmt(blockItem.getStmt());
                if (!(blockItem.getStmt() instanceof BlockStmt)) stmts.add(blockItem.getStmt());
            }
        }
        if (funcTable.getReturnType().equals(FuncTable.ReturnType.intFunc) &&
                (stmts.size() == 0 || (!(stmts.get(stmts.size() - 1) instanceof ReturnStmt))
                        || (stmts.get(stmts.size() - 1) instanceof ReturnStmt &&
                        !((ReturnStmt) stmts.get(stmts.size() - 1)).hasValue()))
        )
            errorTable.getInstance().addError(new error(error.Type.MISSING_RETURN, block.getLine()));
    }

    public void analyseMainFunc(MainFuncDef mainFuncDef) {
        FuncTable main = new FuncTable(globalSymbolTable);
        Block block = mainFuncDef.getBlock();
        funcTables.put("main", main);
        currentFuncTable = main;
        analyseBlock(block);
        ArrayList<Stmt> stmts = new ArrayList<>();
        for (BlockItem blockItem : block.getBlockItems()) {
            if (blockItem.getStmt() != null) {
                stmts.add(blockItem.getStmt());
            }
        }
        if (stmts.size() == 0 || !(stmts.get(stmts.size() - 1) instanceof ReturnStmt)) {
            errorTable.getInstance().addError(new error(error.Type.MISSING_RETURN, block.getLine()));
        }
    }

    public void analyseCompUnit(CompUnit compUnit) {
        for (Decl decl : compUnit.getDecls()) {
            analyseDecl(decl);
        }
        for (FuncDef funcDef : compUnit.getFuncDefs()) {
            analyseFuncDef(funcDef);
        }
        if (compUnit.getMainFuncDef() != null) {
            analyseMainFunc(compUnit.getMainFuncDef());
        }
    }


}
