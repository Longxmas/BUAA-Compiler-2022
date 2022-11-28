package frontend.visitor;

import frontend.Lexer.Token;
import frontend.Parser.CompUnit;
import frontend.Parser.Decl.Elements.*;
import frontend.Parser.Expr.Elements.*;
import frontend.Parser.FuncDef.Elements.FuncDef;
import frontend.Parser.FuncDef.Elements.FuncFParam;
import frontend.Parser.FuncDef.Elements.FuncFParams;
import frontend.Parser.FuncDef.Elements.MainFuncDef;
import frontend.Parser.Stmt.Elements.*;
import frontend.error.error;
import frontend.error.errorTable;
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

public class visitor {
    private SymbolTable globalSymbolTable = new SymbolTable();
    private SymbolTable currentTable = globalSymbolTable;
    private int currentDepth = 0;
    private ArrayList<Integer> depths = new ArrayList<Integer>() {{
        for (int i = 0; i < 200; i++) add(0);
    }};
    private HashMap<String, FuncTable> funcMap = new HashMap<>();
    private ArrayList<FuncTable> funcTables = new ArrayList<>();
    private ArrayList<SymbolTable> symbolTables = new ArrayList<>();
    private HashMap<String, SymbolTable> depth2Table = new HashMap<String, SymbolTable>() {{
        put("<0,0>", globalSymbolTable);
    }};
    private FuncTable currentFuncTable = null;
    private int inWhile = 0;
    private boolean isGlobal = false;

    private MidCodeList midCodeList = new MidCodeList(depths, funcMap);
    public int funcCnt = 0;

    public void analyseBlock(Block block) {
        currentDepth++;
        currentTable = new SymbolTable(currentDepth, depths.get(currentDepth), currentTable);
        currentFuncTable.addSymbolTable(currentTable);
        int index = depths.get(currentDepth);
        depth2Table.put("<" + currentDepth + "," + index + ">", currentTable);
        midCodeList.add(new MidCode(MidCode.Op.NEW_BLOCK, "<" + currentDepth + "," + index + ">", null, null));
        depths.set(currentDepth, depths.get(currentDepth) + 1);
        for (BlockItem blockItem : block.getBlockItems()) {
            if (blockItem.getDecl() != null) {
                analyseDecl(blockItem.getDecl());
            } else {
                analyseStmt(blockItem.getStmt());
            }
        }
        midCodeList.add(new MidCode(MidCode.Op.END_BLOCK, "<" + currentDepth + "," + index + ">", null, null));
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
        if (lValStmt.getGetintToken() != null && symbol != null) {
            if (symbol.getOffset() != null) {
                Operand temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.GETINT, temp, null, null));
                midCodeList.add(new MidCode(MidCode.Op.ARR_SAVE, symbol, temp, null));
            } else
                midCodeList.add(new MidCode(MidCode.Op.GETINT, symbol, null, null));
        } else if (symbol != null) {
            Operand operand = analyseExp(exp);
            //只有左值为数组元素时才有save，否则一定是assign
            if (symbol.getOffset() != null) {
                midCodeList.add(new MidCode(MidCode.Op.ARR_SAVE, symbol, operand, null));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.ASSIGN, symbol, operand, null));
            }

        }
    }

    public Operand analyseLVal(LVal lVal) {
        boolean leftAssign = lVal.getLeftAssign();
        Symbol symbol = findLValSymbol(lVal.getIdent().getSign(), lVal.getIdent(), true);
        if (symbol == null) return null;
        try {
            return new Immediate(new CalExp(currentTable).calculateLVal(lVal, false));
        } catch (Exception e) {
            //   e.printStackTrace();
        }
        ArrayList<Exp> exps = lVal.getExps();
        //如果是普通变量或者数组元素
        if (symbol.getDims().size() - exps.size() == 0) {
            if (symbol.getSymbolType().equals(Symbol.SymbolType.Var)) {
                return symbol;
            } else if (symbol.getDims().size() == 1) {
                Symbol ans = new Symbol(symbol, analyseExp(exps.get(0)), Symbol.SymbolType.Var, currentTable);
                return checkLeftAssign(ans, leftAssign);
            }
            Operand offsetDim1 = analyseExp(exps.get(0));
            Operand offsetDim2 = analyseExp(exps.get(1));
            if (offsetDim1 instanceof Immediate && offsetDim2 instanceof Immediate) {
                int offset = ((Immediate) offsetDim1).getValue() * symbol.getDims().get(1) + ((Immediate) offsetDim2).getValue();
                Symbol ans = new Symbol(symbol, new Immediate(offset), Symbol.SymbolType.Var, currentTable);
                return checkLeftAssign(ans, leftAssign);
            } else {
                Operand offset2 = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.MUL, offsetDim1, new Immediate(symbol.getDims().get(1)), offset2));
                Operand offset = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.ADD, offset2, offsetDim2, offset));
                Symbol symbol1 = new Symbol(symbol, offset, Symbol.SymbolType.Var, currentTable);
                return checkLeftAssign(symbol1, leftAssign);
            }
        } else {
            // 如果是二维数组中取一部分，算出偏移量，不需要检查是否在右侧，应为不用加载，返回的应当是地址
            // 一维数组不可能存在这种情况
            if (exps.size() > 0) {
                Operand offset1 = analyseExp(exps.get(0));
                if (offset1 instanceof Immediate) {
                    int offset = ((Immediate) offset1).getValue() * symbol.getDims().get(1);
                    return new Symbol(symbol, new Immediate(offset), Symbol.SymbolType.Array, currentTable);
                } else {
                    Operand offset = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
                    midCodeList.add(new MidCode(MidCode.Op.MUL, offset1, new Immediate(symbol.getDims().get(1)), offset));
                    return new Symbol(symbol, offset, Symbol.SymbolType.Array, currentTable);
                }
            }
            //直接返回数组
            return symbol;
        }
    }

    public Symbol checkLeftAssign(Symbol symbol, boolean leftAssign) {
        if (!leftAssign) {
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
            midCodeList.add(new MidCode(MidCode.Op.ARR_LOAD, temp, symbol, null));
            return temp;
        }
        return symbol;
    }

    public void analyseBlockStmt(BlockStmt stmt) {
        for (BlockItem blockItem : stmt.getBlock().getBlockItems()) {
            if (blockItem.getStmt() != null) {
                blockItem.getStmt().setParent(stmt);
            }
        }
        analyseBlock(stmt.getBlock());
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
        ArrayList<Operand> outputs = new ArrayList<>();
        for (int i = 0; i < printStmt.getExps().size(); i++) {
            outputs.add(analyseExp(printStmt.getExps().get(i)));
        }
        for (int i = 0; i < s.length() - 1; i++) {
            if (s.charAt(i) == '%' && s.charAt(i + 1) == 'd') {
                if (i > left) midCodeList.addStr(s.substring(left, i));
                midCodeList.add(new MidCode(MidCode.Op.PRI, outputs.get(number++), null, null));
                left = i + 2;
            }
        }
        if (left < s.length()) midCodeList.addStr(s.substring(left));
        if (number != printStmt.getExps().size()) {
            errorTable.getInstance().addError(new error(error.Type.MISMATCH_PRINTF, format.getLine()));
        }
    }


    public void analyseIfElseStmt(IfElseStmt ifElseStmt) {
        ifElseStmt.getCond().getFirstSon().setParent(ifElseStmt);
        int startLabel = midCodeList.elseStartLabelCnt;
        int endLabel = midCodeList.ifElseEndLabelCnt++;
        boolean hasElse = ifElseStmt.getElseStmt() != null;
        ifElseStmt.getIfStmt().setParent(ifElseStmt);
        if (hasElse) {
            ifElseStmt.getElseStmt().setParent(ifElseStmt);
            midCodeList.elseStartLabelCnt++;
        }
        analyseCond(ifElseStmt.getCond(), hasElse ? "Else_start_label_" + startLabel : "ifElse_end_label_" + endLabel);
        analyseStmt(ifElseStmt.getIfStmt());
        if (hasElse) {
            midCodeList.add(new MidCode(MidCode.Op.JUMP,
                    "ifElse_end_label_" + endLabel, null, null));
            midCodeList.add(new MidCode(MidCode.Op.GEN_LABEL, "Else_start_label_" + startLabel + ":", null, null));
            analyseStmt(ifElseStmt.getElseStmt());
        }
        midCodeList.add(new MidCode(MidCode.Op.GEN_LABEL,
                "ifElse_end_label_" + endLabel + ":", null, null));

    }

    public void analyseWhileStmt(WhileStmt stmt) {
        stmt.getStmt().setParent(stmt);
        stmt.setLabel(midCodeList.whileLabelCnt++);
        inWhile++;
        int whileCnt = stmt.getLabel();
        midCodeList.add(new MidCode(MidCode.Op.GEN_LABEL, "while_judge_label_" + whileCnt + ":", null, null));
        analyseCond(stmt.getCond(), "while_end_label_" + whileCnt);
        analyseStmt(stmt.getStmt());
        midCodeList.add(new MidCode(MidCode.Op.JUMP, "while_judge_label_" + whileCnt, null, null));
        midCodeList.add(new MidCode(MidCode.Op.GEN_LABEL, "while_end_label_" + whileCnt + ":", null, null));
        inWhile--;
    }

    public void analyseBreakStmt(BreakStmt stmt) {
        if (inWhile == 0)
            errorTable.getInstance().addError(new error(error.Type.CONTROL_OUTSIDE_LOOP, stmt.getLine()));
        midCodeList.add(new MidCode(MidCode.Op.JUMP, "while_end_label_" + getWhileLabel(stmt), null, null));
    }

    public void analyseContinueStmt(ContinueStmt stmt) {
        if (inWhile == 0)
            errorTable.getInstance().addError(new error(error.Type.CONTROL_OUTSIDE_LOOP, stmt.getLine()));
        midCodeList.add(new MidCode(MidCode.Op.JUMP, "while_judge_label_" + getWhileLabel(stmt), null, null));
    }

    public int getWhileLabel(Stmt stmt) {
        Stmt parent = stmt.getParent();
        while (!(parent instanceof WhileStmt)) {
            parent = parent.getParent();
        }
        return ((WhileStmt) parent).getLabel();
    }

    public Operand analyseCond(Cond cond, String label) {
        return analyseLOrExp(cond.getFirstSon(), label);
    }

    public Operand analyseLOrExp(LOrExp exp, String label) {
        try {
            Immediate temp = new Immediate(new CalExp(currentTable).calculateLOrExp(exp));
            if (temp.getValue() == 0) {
                midCodeList.add(new MidCode(MidCode.Op.JUMP,
                        label, null, null));
            }
            return temp;
        } catch (Exception ignored) {

        }
        exp.getFirstSon().setParent(exp);
        exp.getFirstSon().setIndex(0);
        for (int i = 0; i < exp.getSons().size(); i++) {
            exp.getSons().get(i).setParent(exp);
            exp.getSons().get(i).setIndex(i + 1);
        }

        Operand operand = analyseLAndExp(exp.getFirstSon(), label);
        if (exp.getSons().size() == 0) {
            //midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, operand.toString(), "== 0", label));
            //midCodeList.add(new MidCode(MidCode.Op.GEN_LABEL, "or_label_" + midCodeList.orLabelCnt++ + ":", null, null));
            return operand;
        }
        //midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, operand.toString(), "== 1", "or_label_" + midCodeList.orLabelCnt));
        Operand ans = null;
        for (int i = 0; i < exp.getSons().size(); i++) {
            Operand land;
            land = analyseLAndExp(exp.getSons().get(i), label);
            ans = land;
        }
        //midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, ans.toString(), "== 0", label));
        midCodeList.add(new MidCode(MidCode.Op.GEN_LABEL, "or_label_" + midCodeList.orLabelCnt++ + ":", null, null));
        return ans;
    }

    public Operand analyseLAndExp(LAndExp exp, String label) {
        LOrExp parent = exp.getParent();
        boolean needToJump = exp.getIndex() < parent.getSons().size() && parent.getSons().size() > 0;
        try {
            Immediate temp = new Immediate(new CalExp(currentTable).calculateLAndExp(exp));
            if (temp.getValue() == 1 && needToJump) {
                midCodeList.add(new MidCode(MidCode.Op.JUMP, "or_label_" + midCodeList.orLabelCnt, null, null));
            } else if (temp.getValue() == 0 && !needToJump) {
                midCodeList.add(new MidCode(MidCode.Op.JUMP, label, null, null));
            }
            return temp;
        } catch (Exception ignored) {

        }
        exp.getFirstSon().setParent(exp);
        exp.getFirstSon().setIndex(0);
        for (int i = 0; i < exp.getSons().size(); i++) {
            exp.getSons().get(i).setParent(exp);
            exp.getSons().get(i).setIndex(i + 1);
        }

        //如果landExp是最后一个
        String landLabel = exp.getIndex() == parent.getSons().size() ? label : "and_label_" + midCodeList.andLabelCnt;
        Operand operand = analyseEqExp(exp.getFirstSon(), label);
        if (exp.getSons().size() == 0) {
            if (needToJump) {
                midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, operand.toString(), "== 1", "or_label_" + midCodeList.orLabelCnt));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, operand.toString(), "== 0", label));
            }
            return operand;
        }

        midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, operand.toString(), "== 0", landLabel));
        Operand ret = null;
        for (int i = 0; i < exp.getSons().size(); i++) {
            Operand eq = analyseEqExp(exp.getSons().get(i), label);
            if (i != exp.getSons().size() - 1) {
                midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, eq.toString(), "== 0", landLabel));
            } else {
                if (needToJump) {
                    midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, eq.toString(), "== 1", "or_label_" + midCodeList.orLabelCnt));
                } else {
                    midCodeList.add(new MidCode(MidCode.Op.JUMP_IF, eq.toString(), "== 0", label));
                }
            }
            ret = eq;
        }
        System.out.println(exp + "needToJump = " + needToJump + "\n");
        if (needToJump)
            midCodeList.add(new MidCode(MidCode.Op.GEN_LABEL, "and_label_" + midCodeList.andLabelCnt++ + ":", null, null));
        //如果不止一个，就返回最后一个
        return ret;
    }

    public Operand analyseEqExp(EqExp exp, String label) {
        try {
            Immediate temp = new Immediate(new CalExp(currentTable).calculateEqExp(exp));
            if (temp.getValue() == 0) {
                String eqLabel;
                LAndExp parent = exp.getParent();
                LOrExp grand = parent.getParent();
                if (parent.getIndex() == grand.getSons().size()) {
                    eqLabel = label;
                } else {
                    eqLabel = "and_label_" + midCodeList.andLabelCnt;
                }
                midCodeList.add(new MidCode(MidCode.Op.JUMP, eqLabel, null, null));
            }
            return temp;
        } catch (Exception ignored) {

        }
        Operand operand = analyseRelExp(exp.getFirstSon());
        if (exp.getSons().size() == 0) return operand;
        Operand eq = null;
        for (int i = 0; i < exp.getSons().size(); i++) {
            Operand rel = analyseRelExp(exp.getSons().get(i));
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
            Token op = exp.getOperators().get(i);
            if (op.getSign().equals("==")) {
                midCodeList.add(new MidCode(MidCode.Op.SET, (i == 0 ? operand : eq), rel, temp, "=="));
            } else if (op.getSign().equals("!=")) {
                midCodeList.add(new MidCode(MidCode.Op.SET, (i == 0 ? operand : eq), rel, temp, "!="));
            }
            eq = temp;
        }
        return eq;
    }

    public Operand analyseRelExp(RelExp exp) {
        try {
            return new Immediate(new CalExp(currentTable).calculateRelExp(exp));
        } catch (Exception ignored) {

        }
        Operand operand = analyseAddExp(exp.getFirstSon());
        if (exp.getSons().size() == 0) return operand;
        Operand rel = null;
        for (int i = 0; i < exp.getSons().size(); i++) {
            Operand add = analyseAddExp(exp.getSons().get(i));
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
            Token op = exp.getOperators().get(i);
            if (op.getSign().equals(">")) {
                midCodeList.add(new MidCode(MidCode.Op.SET, add, (i == 0 ? operand : rel), temp, "<"));
            } else if (op.getSign().equals(">=")) {
                midCodeList.add(new MidCode(MidCode.Op.SET, add, (i == 0 ? operand : rel), temp, "<="));
            } else if (op.getSign().equals("<")) {
                midCodeList.add(new MidCode(MidCode.Op.SET, (i == 0 ? operand : rel), add, temp, "<"));
            } else if (op.getSign().equals("<=")) {
                midCodeList.add(new MidCode(MidCode.Op.SET, (i == 0 ? operand : rel), add, temp, "<="));
            }
            rel = temp;
        }
        return rel;
    }

    public void analyseExpStmt(ExpStmt expStmt) {
        if (expStmt.getExp() != null) analyseExp(expStmt.getExp());
    }

    //Expression
    public Operand analyseExp(Exp exp) {
        CalExp calculate = new CalExp(currentTable);
        if (calculate.calculateExp(exp, false) != null) {
            return calculate.calculateExp(exp, false);
        }
        return analyseAddExp(exp.getFirstSon());
    }

    public Operand analyseConstExp(ConstExp exp) {
        int i = new CalExp(currentTable).CalculateConstExp(exp);
        return new Immediate(i);
    }

    public Operand analyseAddExp(AddExp exp) {
        try {
            return new Immediate(new CalExp(currentTable).calculateAddExp(exp, false));
        } catch (Exception e) {
            //   e.printStackTrace();
        }
        Operand operand = analyseMulExp(exp.getFirstSon());
        if (exp.getSons().isEmpty()) {
            return operand;
        }
        Symbol add = null;
        for (int i = 0; i < exp.getSons().size(); i++) {
            Operand mul = analyseMulExp(exp.getSons().get(i));
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
            Token op = exp.getOperators().get(i);
            if (op.getSign().equals("+")) {
                midCodeList.add(new MidCode(MidCode.Op.ADD, (i == 0 ? operand : add), mul, temp));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.SUB, (i == 0 ? operand : add), mul, temp));
            }
            add = temp;
        }
        return add;
    }

    public Operand analyseMulExp(MulExp exp) {
        try {
            return new Immediate(new CalExp(currentTable).calculateMulExp(exp, false));
        } catch (Exception e) {
            //   e.printStackTrace();
        }
        Operand operand = analyseUnaryExp(exp.getFirstSon());
        if (exp.getSons().isEmpty()) {
            return operand;
        }
        Symbol mul = null;
        for (int i = 0; i < exp.getSons().size(); i++) {
            Operand unary = analyseUnaryExp(exp.getSons().get(i));
            Symbol temp = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
            Token op = exp.getOperators().get(i);
            if (op.getSign().equals("*")) {
                midCodeList.add(new MidCode(MidCode.Op.MUL, i == 0 ? operand : mul, unary, temp));
            } else if (op.getSign().equals("/")) {
                midCodeList.add(new MidCode(MidCode.Op.DIV, i == 0 ? operand : mul, unary, temp));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.MOD, i == 0 ? operand : mul, unary, temp));
            }
            mul = temp;
        }
        return mul;
    }

    public Operand analyseUnaryExp(UnaryExp exp) {
        try {
            return new Immediate(new CalExp(currentTable).calculateUnaryExp(exp, false));
        } catch (Exception e) {
            //   e.printStackTrace();
        }
        Symbol unary = null;
        //注意需要处理unaryOp
        int sign = 1;
        int not = 0;
        for (Token unaryOp : exp.getUnaryOps()) {
            if (unaryOp.getSign().equals("-")) sign *= -1;
            if (unaryOp.getSign().equals("!")) not = 1;
        }
        //如果是primaryExp

        if (exp.getPrimaryExp() != null) {
            Operand primary = analysePrimaryExp(exp.getPrimaryExp());
            Operand primaryAns = primary;
            if (sign == -1) {
                unary = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.SUB, new Immediate(0), primary, unary));
                primaryAns = unary;
            }
            if (not == 1) {
                unary = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.SET, primaryAns, new Immediate(0), unary, "==")); // unary = !ans
                return unary;
            }
            return primaryAns;
        }
        //如果是函数调用
        Token ident = exp.getIdent(); //函数名
        if (ident == null) return null;
        FuncTable funcTable = funcMap.get(ident.getSign());
        if (funcTable == null) {
            errorTable.getInstance().addError(new error(error.Type.UNDEFINED_IDENT, ident.getLine()));
            return null;
        }
        int cnt = funcCnt++;
        //Prepare For the Call
        midCodeList.add(new MidCode(MidCode.Op.PRE_CALL, funcTable + "@" + cnt, null, null));
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
        for (int i = params.size() - 1; i >= 0; i--) {
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
                midCodeList.add(new MidCode(MidCode.Op.PUSH_PARA, paramOperand.toString(), funcTable.getName() + "@" + cnt, arg.getName()));
            } else {
                midCodeList.add(new MidCode(MidCode.Op.PUSH_PARA_ARR, paramOperand.toString(), funcTable.getName() + "@" + cnt, arg.getName()));
            }
        }

        midCodeList.add(new MidCode(MidCode.Op.FUNC_CALL, funcTable + "@" + cnt, null, null));
        Symbol returnValue = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
        midCodeList.add(new MidCode(MidCode.Op.ASSIGN, returnValue.toString(), "%RTX", null));
        Symbol ans;
        if (sign == 1) ans = returnValue;
        else {
            unary = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
            midCodeList.add(new MidCode(MidCode.Op.SUB, new Immediate(0), returnValue, unary));
            ans = unary;
        }
        if (not == 0) return ans;
        else {
            unary = Symbol.tempVar(midCodeList, Symbol.BasicType.INT, currentTable);
            midCodeList.add(new MidCode(MidCode.Op.SET, ans, new Immediate(0), unary, "==")); // unary = !ans
            return unary;
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
            FuncTable funcTable = funcMap.get(ident.getSign());
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
                    true, new Immediate(initValue), currentTable);
            currentTable.addSymbol(symbol);
            midCodeList.add(new MidCode(MidCode.Op.CONST_DEF, symbol, new Immediate(initValue), null));
            if (isGlobal) symbol.setGlobal(true);
        } else if (initExp == null && !hasError) {
            //ConstArray
            ArrayList<Integer> dims = getDims(exps);
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
                    true, dims, initArray, currentTable);
            if (isGlobal) symbol.setGlobal(true);
            currentTable.addSymbol(symbol);
            for (int i = 0; i < initArray.size(); i++) {
                midCodeList.add(new MidCode(MidCode.Op.CONST_DEF, symbol + "[" + i + "]", initArray.get(i).toString(), null));
            }
        }
    }

    public void analyseVarDecl(VarDecl decl) {
        for (int i = 0; i < decl.getVarDefs().size(); i++) {
            analyseVarDef(decl, decl.getVarDefs().get(i));
        }
    }

    public void partOfAnalyseArrayDef(InitVal initVal, ArrayList<Operand> initArray, int dim) {
        int num = initVal == null ? 0 : initVal.getInitVals().size();
        if (initVal != null) {
            for (InitVal init : initVal.getInitVals()) {
                if (init.getExp() == null) continue;
                if (isGlobal) initArray.add(new CalExp(currentTable).calculateExp(init.getExp(), true));
                else initArray.add(analyseExp(init.getExp()));
            }
        }
        for (int i = num; i < dim; i++) initArray.add(new Immediate(0));
    }

    private void analyseVarDef(VarDecl decl, VarDef def) {
        boolean hasError = false;
        Token ident = def.getIdent();
        ArrayList<ConstExp> exps = def.getConstExps();
        ArrayList<Integer> dims = getDims(exps);
        Symbol symbol;
        if (currentTable.contains(ident.getSign())) {
            errorTable.getInstance().addError(new error(error.Type.DUPLICATED_IDENT, ident.getLine()));
            hasError = true;
        }
        InitVal initVal = def.getInitVal();
        //注意全局变量初始化
        if (initVal == null && !hasError) {
            if (exps.size() == 0) {
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var,
                        false, isGlobal ? new Immediate(0) : null, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.VAR_DEF, symbol, isGlobal ? new Immediate(0) : null, null));
            } else {
                ArrayList<Operand> arrayInit = new ArrayList<>();
                int length = 1;
                for (ConstExp exp : exps) {
                    length *= new CalExp(currentTable).CalculateConstExp(exp);
                }
                for (int i = 0; i < length; i++) {
                    arrayInit.add(new Immediate(0));
                }
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array,
                        false, dims, arrayInit, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.VAR_DEF, symbol, null, null));
            }
            if (isGlobal) symbol.setGlobal(true);
            currentTable.addSymbol(symbol);
        } else if (initVal != null && !hasError) {
            Exp exp = initVal.getExp();
            if (exp != null) {
                Operand varInit = analyseVarInit(initVal);
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Var, false,
                        varInit, currentTable);
                midCodeList.add(new MidCode(MidCode.Op.VAR_DEF, symbol, varInit, null));
            } else {
                //Array
                ArrayList<Operand> initArray = analyseArrayInit(def);
                symbol = new Symbol(ident.getSign(), Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims,
                        initArray, currentTable);
                for (int i = 0; i < initArray.size(); i++) {
                    midCodeList.add(new MidCode(MidCode.Op.VAR_DEF, symbol + "[" + i + "]", initArray.get(i).toString(), null));
                }
            }
            if (isGlobal) symbol.setGlobal(true);
            currentTable.addSymbol(symbol);
        }
    }

    public Operand analyseVarInit(InitVal initVal) {
        Exp exp = initVal.getExp();
        return isGlobal ? new CalExp(currentTable).calculateExp(exp, true) : analyseExp(exp);
    }

    /*public Operand getNextVarInit(VarDecl decl, VarDef varDef) {
        ArrayList<VarDef> varDefs = decl.getVarDefs();
        int index = varDefs.indexOf(varDef);
        if (index == varDefs.size() - 1) return isGlobal ? new Immediate(0) : null;
        else {
            VarDef nextVarDef = varDefs.get(index + 1);
            Operand nextInit = currentTable.getSymbolMap().get(nextVarDef.getIdent().getSign()).getVarInit();
            if (nextInit != null) return nextInit;
            else return getNextVarInit(decl, nextVarDef);
        }
    }*/

    public ArrayList<Integer> getDims(ArrayList<ConstExp> exps) {
        ArrayList<Integer> dims = new ArrayList<>();
        for (ConstExp exp : exps) {
            dims.add(new CalExp(currentTable).CalculateConstExp(exp));
        }
        return dims;
    }

    public ArrayList<Operand> analyseArrayInit(VarDef varDef) {
        ArrayList<ConstExp> exps = varDef.getConstExps();
        InitVal initVal = varDef.getInitVal();
        ArrayList<Integer> dims = getDims(exps);
        ArrayList<Operand> initArray = new ArrayList<>();
        int dimCount = exps.size();
        if (dimCount == 1) {
            //1维数组
            partOfAnalyseArrayDef(initVal, initArray, dims.get(0));
        } else if (dimCount == 2) {
            //2维数组
            int dim1 = dims.get(0); //第一个维度
            int dim2 = dims.get(1); //第二个维度
            if (initVal.getInitVals().get(0).getExp() != null) {
                partOfAnalyseArrayDef(initVal, initArray, dim1 * dim2);
            } else {
                //System.out.println(ident.getSign() + " " + initVal.getInitVals().size());
                for (int i = 0; i < Math.min(dim1, initVal.getInitVals().size()); i++) {
                    partOfAnalyseArrayDef(initVal.getInitVals().get(i), initArray, dim2);
                }
                for (int i = Math.min(dim1, initVal.getInitVals().size()); i < dim1; i++) {
                    partOfAnalyseArrayDef(null, initArray, dim2);
                }
            }
        }
        return initArray;
    }

    /*public ArrayList<Operand> getNextArrayInit(VarDecl decl, VarDef varDef) {
        ArrayList<VarDef> varDefs = decl.getVarDefs();
        ArrayList<Operand> arrayInit = new ArrayList<>();
        ArrayList<ConstExp> exps = varDef.getConstExps();
        int length = 1;
        for (ConstExp exp : exps) {
            length *= new CalExp(currentTable).CalculateConstExp(exp);
        }
        for (int i = 0; i < length; i++) {
            arrayInit.add(new Immediate(0));
        }
        int index = varDefs.indexOf(varDef);
        if (index == varDefs.size() - 1) return isGlobal ? arrayInit : null;
        else {
            VarDef nextVarDef = varDefs.get(index + 1);
            if (!getDims(exps).equals(getDims(nextVarDef.getConstExps()))) {
                return arrayInit;
            }
            ArrayList<Operand> nextInit = currentTable.getSymbolMap().get(nextVarDef.getIdent().getSign()).getArrayInit();
            if (nextInit != null) return nextInit;
            else return getNextArrayInit(decl, nextVarDef);
        }
    }*/

    //Def
    public void analyseFuncDef(FuncDef funcDef) {
        String name = funcDef.getIdent().getSign();
        FuncFParams funcFParams = funcDef.getFuncFParams();
        ArrayList<FuncFParam> funcFParamsList = funcFParams != null ? funcDef.getFuncFParams().getFuncFParams() : new ArrayList<>();
        FuncTable.ReturnType returnType = funcDef.getFuncType().getType().getSign().equals("void") ?
                FuncTable.ReturnType.voidFunc : FuncTable.ReturnType.intFunc;
        if (funcMap.containsKey(name) || currentTable.contains(name)) {
            errorTable.getInstance().addError(new error(error.Type.DUPLICATED_IDENT, funcDef.getIdent().getLine()));
        } else {
            currentDepth++;
            currentTable = new SymbolTable(currentDepth, depths.get(currentDepth), currentTable);
            depth2Table.put("<" + currentDepth + "," + depths.get(currentDepth) + ">", currentTable);

            FuncTable funcTable = new FuncTable(name, returnType, currentTable);
            funcMap.put(name, funcTable);
            funcTables.add(funcTable);
            currentFuncTable = funcTable; //设置当前函数表

            midCodeList.add(new MidCode(MidCode.Op.FUNC, name, null, null));
            for (FuncFParam funcFParam : funcFParamsList) {
                analyseFuncFParam(funcFParam, funcTable);
            }
            analyseFuncBody(funcDef.getBlock(), funcTable);
            midCodeList.add(new MidCode(MidCode.Op.RETURN));
            midCodeList.add(new MidCode(MidCode.Op.END_FUNC, name, null, null));

            depths.set(currentDepth, depths.get(currentDepth) + 1);
            currentTable = currentTable.getParent();
            currentDepth--;
        }
    }

    public void analyseFuncFParam(FuncFParam fp, FuncTable funcTable) {
        String name = fp.getIdent().getSign();
        Symbol arg;
        if (funcTable.getParamsNames().contains(name)) {
            errorTable.getInstance().addError(new error(error.Type.DUPLICATED_IDENT, fp.getIdent().getLine()));
        }
        if (!fp.isArray())
            arg = new Symbol(name, Symbol.BasicType.INT, Symbol.SymbolType.Var, false, null, currentTable);
        else {
            ArrayList<Integer> dims = new ArrayList<>();
            dims.add(0);
            ArrayList<ConstExp> exps = fp.getConstExps();
            for (ConstExp exp : exps) {
                dims.add(new CalExp(currentTable).CalculateConstExp(exp));
            }
            arg = new Symbol(name, Symbol.BasicType.INT, Symbol.SymbolType.Array, false, dims, null, currentTable);
        }
        arg.setParam();
        funcTable.addParam(arg);
        currentTable.addSymbol(arg); //添加参数到当前的符号表
        midCodeList.add(new MidCode(MidCode.Op.FORM_VAR_DEF, arg, funcTable, null));
    }

    public void analyseFuncBody(Block block, FuncTable funcTable) {
        midCodeList.add(new MidCode(MidCode.Op.NEW_BLOCK, "<" + currentDepth + "," + depths.get(currentDepth) + ">", null, null));
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
        midCodeList.add(new MidCode(MidCode.Op.END_BLOCK, "<" + currentDepth + "," + depths.get(currentDepth) + ">", null, null));
    }

    public void analyseMainFunc(MainFuncDef mainFuncDef) {
        FuncTable main = new FuncTable(globalSymbolTable);
        Block block = mainFuncDef.getBlock();
        funcMap.put("main", main);
        funcTables.add(main);
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
        isGlobal = true;
        for (Decl decl : compUnit.getDecls()) {
            analyseDecl(decl);
        }
        isGlobal = false;
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


    public SymbolTable getGlobalTable() {
        return this.globalSymbolTable;
    }


    public HashMap<String, FuncTable> getFuncMap() {
        return this.funcMap;
    }

    public ArrayList<FuncTable> getFuncTables() {
        return funcTables;
    }

    public HashMap<String, SymbolTable> getDepth2Table() {
        return this.depth2Table;
    }
}
