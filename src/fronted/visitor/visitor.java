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
import middle.Code.MidCode;
import middle.Code.MidCodeList;
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

    private MidCodeList midCodeList = new MidCodeList(depths, funcTables);

    public void analyseBlock(Block block) {
        currentDepth++;
        currentTable = new SymbolTable(currentDepth, depths.get(currentDepth), currentTable);
        depth2Table.put(currentDepth + " " + depths.get(currentDepth), currentTable);
        midCodeList.add(new MidCode(MidCode.Op.NEW_BLOCK, "[" + currentDepth + ", " + depths.get(currentDepth) + "]", null, null));
        depths.set(currentDepth, depths.get(currentDepth) + 1);
        for (BlockItem blockItem : block.getBlockItems()) {
            if (blockItem.getDecl() != null) {
                analyseDecl(blockItem.getDecl());
            } else {
                analyseStmt(blockItem.getStmt());
            }
        }
        midCodeList.add(new MidCode(MidCode.Op.END_BLOCK, (Operand) null, null, null));
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
        lval.setLeftAssign(true);
        Symbol symbol = (Symbol) analyseLVal(lval);
        Exp exp = lValStmt.getExp();
        if (symbol != null && symbol.isConst())
            errorTable.getInstance().addError(new error(error.Type.MODIFY_CONST, lval.getIdent().getLine()));
        if (lValStmt.getGetintToken() != null) {
            midCodeList.add(new MidCode(MidCode.Op.GETINT, symbol, null, null));
        } else {
            Operand operand = analyseExp(exp);
            if (symbol.getOffset() != null) {
                Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
                midCodeList.add(new MidCode(MidCode.Op.ASSIGN, temp, operand, null));
                midCodeList.add(new MidCode(MidCode.Op.ASSIGN, symbol, temp, null));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.ASSIGN, symbol, operand, null));
            }

        }
    }

    public Operand analyseLVal(LVal lVal) {
        boolean leftAssign = lVal.getLeftAssign();
        Symbol symbol = findLValSymbol(lVal.getIdent().getSign(), lVal.getIdent(), true);
        if (symbol == null) return null;
        ArrayList<Exp> exps = lVal.getExps();
        //如果是普通变量或者数组元素
        if (symbol.getDims().size() - exps.size() == 0) {
            if (symbol.getSymbolType().equals(Symbol.SymbolType.Var)) {
                return symbol;
            } else if (symbol.getDims().size() == 1) {
                Symbol ans = new Symbol(symbol, analyseExp(exps.get(0)), Symbol.SymbolType.Var);
                return checkLeftAssign(ans, leftAssign);
            }
            Operand offset1 = analyseExp(exps.get(0));
            Operand offset2 = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            midCodeList.add(new MidCode(MidCode.Op.MUL, offset1, new Immediate(symbol.getDims().get(1)), offset2));
            Operand offset = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            midCodeList.add(new MidCode(MidCode.Op.ADD, offset2, analyseExp(exps.get(1)), offset));
            Symbol symbol1 = new Symbol(symbol, offset, Symbol.SymbolType.Var);
            return checkLeftAssign(symbol1, leftAssign);
        } else {
            //如果是数组
            if (symbol.getDims().size() == 1) return symbol;
            //二维数组中取一部分，算出偏移量
            if (exps.size() > 0) {
                Operand offset1 = analyseExp(exps.get(0));
                Operand offset = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
                midCodeList.add(new MidCode(MidCode.Op.MUL, offset1, new Immediate(symbol.getDims().get(1)), offset));
                return new Symbol(symbol, offset, Symbol.SymbolType.Array);
            }
        }
        return null;
    }

    public Symbol checkLeftAssign(Symbol symbol, boolean leftAssign) {
        if (!leftAssign) {
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            midCodeList.add(new MidCode(MidCode.Op.ASSIGN, temp, symbol, null));
            return temp;
        }
        return symbol;
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
        Operand returnValue = null;
        if (stmt.getExp() != null) {
            returnValue = analyseExp(stmt.getExp());
        }
        if (stmt.hasValue() && currentFuncTable.getReturnType().equals(FuncTable.ReturnType.voidFunc))
            errorTable.getInstance().addError(new error(error.Type.RETURN_VALUE_VOID, stmt.getLine()));
        midCodeList.add(new MidCode(MidCode.Op.RETURN, returnValue, null, null));
    }

    public void analysePrintStmt(PrintStmt printStmt) {
        Token format = printStmt.getFormatString();
        String s = format.getSign().substring(1, format.getSign().length() - 1);
        int number = 0;
        int left = 0;
        for (int i = 0; i < s.length() - 1; i++) {
            if (s.charAt(i) == '%' && s.charAt(i + 1) == 'd') {
                if (i > left) midCodeList.addStr(s.substring(left, i));
                Operand output = analyseExp(printStmt.getExps().get(number));
                midCodeList.add(new MidCode(MidCode.Op.PRI, output, null, null));
                number++;
                left = i + 2;
            }
        }
        if (left < s.length()) midCodeList.addStr(s.substring(left));
        if (number != printStmt.getExps().size()) {
            errorTable.getInstance().addError(new error(error.Type.MISMATCH_PRINTF, format.getLine()));
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
    public Operand analyseExp(Exp exp) {
        return analyseAddExp(exp.getFirstSon());
    }

    public Operand analyseConstExp(ConstExp exp) {
        int i = new CalExp(currentTable).CalculateConstExp(exp);
        return new Immediate(i);
    }

    public Operand analyseCond(Cond cond) {
        return analyseLOrExp(cond.getFirstSon());
    }

    public Operand analyseLOrExp(LOrExp exp) {
        Operand firstAnd = analyseLAndExp(exp.getFirstSon());
        for (LAndExp exp1 : exp.getSons()) {
            analyseLAndExp(exp1);
        }
        return null;
    }

    public Operand analyseLAndExp(LAndExp exp) {
        analyseEqExp(exp.getFirstSon());
        for (EqExp exp1 : exp.getSons()) {
            analyseEqExp(exp1);
        }
        return null;
    }

    public Operand analyseEqExp(EqExp exp) {
        analyseRelExp(exp.getFirstSon());
        for (RelExp exp1 : exp.getSons()) {
            analyseRelExp(exp1);
        }
        return null;
    }

    public Operand analyseRelExp(RelExp exp) {
        Operand firstAdd = analyseAddExp(exp.getFirstSon());
        for (AddExp exp1 : exp.getSons()) {
            analyseAddExp(exp1);
        }
        return null;
    }

    public Operand analyseAddExp(AddExp exp) {
        Operand operand = analyseMulExp(exp.getFirstSon());
        int isArrayEle = 0;
        if (exp.getSons().isEmpty()) {
            return operand;
        }
        Symbol add;
        if (operand instanceof Symbol && ((Symbol) operand).getOffset() != null) {
            isArrayEle = 1;
            add = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            midCodeList.add(new MidCode(MidCode.Op.ASSIGN, add, operand, null));
        } else {
            Operand secondMul = analyseMulExp(exp.getSons().get(0));
            add = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            if (exp.getOperators().get(0).getSign().equals("+")) {
                midCodeList.add(new MidCode(MidCode.Op.ADD, operand, secondMul, add));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.SUB, operand, secondMul, add));
            }
        }
        for (int i = 1 - isArrayEle; i < exp.getSons().size(); i++) {
            Operand mul = analyseMulExp(exp.getSons().get(i));
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            Token op = exp.getOperators().get(i);
            if (op.getSign().equals("+")) {
                midCodeList.add(new MidCode(MidCode.Op.ADD, add, mul, temp));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.SUB, add, mul, temp));
            }
            add = temp;
        }
        return add;
    }

    public Operand analyseMulExp(MulExp exp) {
        Operand operand = analyseUnaryExp(exp.getFirstSon());
        int isArrayEle = 0;
        if (exp.getSons().isEmpty()) {
            return operand;
        }
        Symbol mul;
        if (operand instanceof Symbol && ((Symbol) operand).getOffset() != null) {
            isArrayEle = 1;
            mul = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            midCodeList.add(new MidCode(MidCode.Op.ASSIGN, mul, operand, null));
        } else {
            Operand secondUnary = analyseUnaryExp(exp.getSons().get(0));
            mul = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            if (exp.getOperators().get(0).getSign().equals("*")) {
                midCodeList.add(new MidCode(MidCode.Op.MUL, operand, secondUnary, mul));
            } else if (exp.getOperators().get(0).getSign().equals("/")) {
                midCodeList.add(new MidCode(MidCode.Op.DIV, operand, secondUnary, mul));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.MOD, operand, secondUnary, mul));
            }
        }

        for (int i = 1 - isArrayEle; i < exp.getSons().size(); i++) {
            Operand unary = analyseUnaryExp(exp.getSons().get(i));
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
            Token op = exp.getOperators().get(i);
            if (op.getSign().equals("*")) {
                midCodeList.add(new MidCode(MidCode.Op.MUL, mul, unary, temp));
            } else if (op.getSign().equals("/")) {
                midCodeList.add(new MidCode(MidCode.Op.DIV, mul, unary, temp));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.MOD, mul, unary, temp));
            }
            mul = temp;
        }
        return mul;
    }

    public Operand analyseUnaryExp(UnaryExp exp) {
        Symbol unary = null;
        //注意需要处理unaryOp
        int sign = 1;
        for (Token unaryOp : exp.getUnaryOps()) {
            if (unaryOp.getSign().equals("-")) sign *= -1;
        }
        //如果是primaryExp
        if (exp.getPrimaryExp() != null) {
            Operand primary = analysePrimaryExp(exp.getPrimaryExp());
            if (sign == -1) {
                unary = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
                midCodeList.add(new MidCode(MidCode.Op.SUB, new Immediate(0), primary, unary));
                return unary;
            }
            return primary;
        }
        //如果是函数调用
        Token ident = exp.getIdent(); //函数名
        if (ident == null) return null;
        FuncTable funcTable = funcTables.get(ident.getSign());
        if (funcTable == null) {
            errorTable.getInstance().addError(new error(error.Type.UNDEFINED_IDENT, ident.getLine()));
            return null;
        }
        //Prepare For the Call
        midCodeList.add(new MidCode(MidCode.Op.PRE_CALL, funcTable, null, null));
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
            return null;
        }
        for (int i = 0; i < params.size(); i++) {
            Symbol arg = args.get(i);
            Exp param = params.get(i);
            Operand paramOperand = analyseExp(param); //实参
            Symbol.SymbolType type = checkExp(param); //实参类型
            //类型不匹配
            // <错误处理的垃圾代码，暂时不想改>
            if (type == null || type != arg.getSymbolType()) {
                errorTable.getInstance().addError(new error(error.Type.MISMATCH_PARAM_TYPE, ident.getLine()));
                return null;
            }
            if (type.equals(Symbol.SymbolType.Array) && arg.getSymbolType().equals(Symbol.SymbolType.Array)) {
                LVal arrayLVal = getArrayLVal(param); // 数组左值表达式
                ArrayList<Exp> exps = arrayLVal.getExps();
                Symbol array = findLValSymbol(arrayLVal.getIdent().getSign(), arrayLVal.getIdent(), true); //实际的声明数组b[2][3]
                //arg: int c[][3]
                if (array == null) return null;
                if (arg.getDims().size() != array.getDims().size() - exps.size()) {
                    errorTable.getInstance().addError(new error(error.Type.MISMATCH_PARAM_TYPE, ident.getLine()));
                    return null;
                } else if (arg.getDims().size() == array.getDims().size() - exps.size() &&
                        arg.getDims().size() == 2 && !Objects.equals(array.getDims().get(1), arg.getDims().get(1))) {
                    errorTable.getInstance().addError(new error(error.Type.MISMATCH_PARAM_TYPE, ident.getLine()));
                    return null;
                }
            }
            //  <错误处理的垃圾代码，暂时不想改>
            if (type.equals(Symbol.SymbolType.Var)) {
                midCodeList.add(new MidCode(MidCode.Op.PUSH_PARA, paramOperand, funcTable, null));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.PUSH_PARA_ARR, paramOperand, funcTable, null));
            }
        }
        midCodeList.add(new MidCode(MidCode.Op.FUNC_CALL, funcTable, null, null));
        Symbol returnValue = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
        midCodeList.add(new MidCode(MidCode.Op.ADD, "0", "%RTX", returnValue.toString()));
        unary = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable.getLoc());
        if (sign == -1) {
            midCodeList.add(new MidCode(MidCode.Op.SUB, new Immediate(0), returnValue, unary));
        }
        return returnValue;
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

    public Operand analysePrimaryExp(PrimaryExp exp) {
        if (exp.getExp() != null) {
            return analyseExp(exp.getExp());
        } else if (exp.getlVal() != null) {
            return analyseLVal(exp.getlVal());
        }
        if (exp.getNumber() != null) return new Immediate(exp.getNumber().getValue());
        return null;
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

    public void partOfAnalyseConstDef(ConstInitVal constInitVal, ArrayList<Operand> initArray, int dim) {
        for (ConstInitVal init : constInitVal.getConstInitVals()) {
            initArray.add(new Immediate(new CalExp(currentTable).CalculateConstExp(init.getConstExp())));
        }
        if (constInitVal.getConstInitVals().size() == 0) {
            for (int i = 0; i < dim; i++) initArray.add(new Immediate(0));
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
            Symbol symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var,
                    true, new Immediate(initValue), currentTable.getLoc());
            currentTable.addSymbol(symbol);
            midCodeList.add(new MidCode(MidCode.Op.CONST_DEF, symbol, new Immediate(initValue), null));
        } else if (initExp == null && !hasError) {
            //ConstArray
            ArrayList<Integer> dims = new ArrayList<>();
            for (ConstExp exp : exps) {
                dims.add(new CalExp(currentTable).CalculateConstExp(exp));
            }
            ArrayList<Operand> initArray = new ArrayList<>();
            int dimCount = exps.size();
            if (dimCount == 1) {
                //1维数组
                partOfAnalyseConstDef(constInitVal, initArray, dims.get(0));
            } else if (dimCount == 2) {
                //2维数组
                int dim1 = dims.get(0); //第一个维度
                int dim2 = dims.get(1); //第二个维度
                for (int i = 0; i < dim1; i++) {
                    partOfAnalyseConstDef(constInitVal.getConstInitVals().get(i), initArray, dim2);
                }
            }
            Symbol symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array,
                    true, dims, initArray, currentTable.getLoc());
            currentTable.addSymbol(symbol);
            for (int i = 0; i < initArray.size(); i++) {
                midCodeList.add(new MidCode(MidCode.Op.CONST_DEF, symbol + "[" + i + "]", initArray.get(i).toString(), null));
            }
        }
    }

    public void analyseVarDecl(VarDecl decl) {
        for (VarDef def : decl.getVarDefs()) {
            analyseVarDef(def);
        }
    }

    public void partOfAnalyseArrayDef(InitVal initVal, ArrayList<Operand> initArray, int dim) {
        for (InitVal init : initVal.getInitVals()) {
            initArray.add(analyseExp(init.getExp()));
        }
        if (initVal.getInitVals().size() == 0) {
            for (int i = 0; i < dim; i++) initArray.add(new Immediate(0));
        }
    }

    private void analyseVarDef(VarDef def) {
        boolean hasError = false;
        Token ident = def.getIdent();
        ArrayList<ConstExp> exps = def.getConstExps();
        ArrayList<Integer> dims = new ArrayList<>();
        Symbol symbol;
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
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var, false, null, currentTable.getLoc());
            } else {
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims, new ArrayList<>(), currentTable.getLoc());
            }
            midCodeList.add(new MidCode(MidCode.Op.VAR_DEF, symbol, null, null));
            currentTable.addSymbol(symbol);
        } else if (initVal != null && !hasError) {
            Exp exp = initVal.getExp();
            if (exp != null) {
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var, false, null, currentTable.getLoc());
                midCodeList.add(new MidCode(MidCode.Op.VAR_DEF, symbol, analyseExp(exp), null));
            } else {
                //Array
                ArrayList<Operand> initArray = new ArrayList<>();
                int dimCount = exps.size();
                if (dimCount == 1) {
                    //1维数组
                    partOfAnalyseArrayDef(initVal, initArray, dims.get(0));
                } else if (dimCount == 2) {
                    //2维数组
                    int dim1 = dims.get(0); //第一个维度
                    int dim2 = dims.get(1); //第二个维度
                    for (int i = 0; i < dim1; i++) {
                        partOfAnalyseArrayDef(initVal.getInitVals().get(i), initArray, dim2);
                    }
                }
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims, null, currentTable.getLoc());
                for (int i = 0; i < initArray.size(); i++) {
                    midCodeList.add(new MidCode(MidCode.Op.VAR_DEF, symbol + "[" + i + "]", initArray.get(i).toString(), null));
                }
            }
            currentTable.addSymbol(symbol);
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
            FuncTable funcTable = new FuncTable(name, returnType, currentTable);
            funcTables.put(name, funcTable);
            currentFuncTable = funcTable;
            midCodeList.add(new MidCode(MidCode.Op.FUNC, name, null, null));
            for (FuncFParam funcFParam : funcFParamsList) {
                analyseFuncFParam(funcFParam, funcTable);
            }
            analyseFuncBody(funcDef.getBlock(), funcTable);
            depths.set(currentDepth, depths.get(currentDepth) + 1);
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
        if (!fp.isArray())
            arg = new Symbol(name, Symbol.BasicType.INT, Symbol.SymbolType.Var, false, null, currentTable.getLoc());
        else {
            ArrayList<Integer> dims = new ArrayList<>();
            dims.add(0);
            ArrayList<ConstExp> exps = fp.getConstExps();
            for (ConstExp exp : exps) {
                dims.add(new CalExp(currentTable).CalculateConstExp(exp));
            }
            arg = new Symbol(name, Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims, null, currentTable.getLoc());
        }
        funcTable.addParam(arg);
        midCodeList.add(new MidCode(MidCode.Op.FORM_VAR_DEF, arg, funcTable, null));
    }

    public void analyseFuncBody(Block block, FuncTable funcTable) {
        midCodeList.add(new MidCode(MidCode.Op.NEW_BLOCK, "[" + currentDepth + ", " + depths.get(currentDepth) + "]", null, null));
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
        midCodeList.add(new MidCode(MidCode.Op.END_BLOCK, (Operand) null, null, null));
    }

    public void analyseMainFunc(MainFuncDef mainFuncDef) {
        FuncTable main = new FuncTable(globalSymbolTable);
        Block block = mainFuncDef.getBlock();
        funcTables.put("main", main);
        currentFuncTable = main;
        midCodeList.add(new MidCode(MidCode.Op.FUNC, "main", null, null));
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
        midCodeList.add(new MidCode(MidCode.Op.END_FUNC, "main", null, null));
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

    public MidCodeList getMidCodeList() {
        return midCodeList;
    }
}
