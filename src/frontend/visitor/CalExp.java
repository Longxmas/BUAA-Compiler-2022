package frontend.visitor;

import frontend.Lexer.Token;
import frontend.Parser.Expr.Elements.*;
import frontend.error.error;
import frontend.error.errorTable;
import middle.Symbol.Symbol;
import middle.Symbol.SymbolTable;
import middle.operand.Immediate;

import java.util.ArrayList;

public class CalExp {
    private SymbolTable symbolTable;

    public CalExp(SymbolTable symbolTable) {
        this.symbolTable = symbolTable;
    }

    public int CalculateConstExp(ConstExp exp) {
        try {
            return calculateAddExp(exp.getFirstSon(), false);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }

    public Immediate calculateExp(Exp exp, boolean isGlobal) {
        try {
            return new Immediate(calculateAddExp(exp.getFirstSon(), isGlobal));
        } catch (Exception e) {
            return null;
        }
    }

    public int calculateAddExp(AddExp addExp, boolean isGlobal) throws Exception {
        int ans = calculateMulExp(addExp.getFirstSon(), isGlobal);
        ArrayList<Token> operators = addExp.getOperators();
        for (int i = 0; i < addExp.getSons().size(); i++) {
            if (operators.get(i).getSign().equals("+")) ans += calculateMulExp(addExp.getSons().get(i), isGlobal);
            else if (operators.get(i).getSign().equals("-")) ans -= calculateMulExp(addExp.getSons().get(i), isGlobal);
        }
        return ans;
    }

    public int calculateMulExp(MulExp mulexp, boolean isGlobal) throws Exception {
        int ans = calculateUnaryExp(mulexp.getFirstSon(), isGlobal);
        ArrayList<Token> operators = mulexp.getOperators();
        for (int i = 0; i < mulexp.getSons().size(); i++) {
            if (operators.get(i).getSign().equals("*")) ans *= calculateUnaryExp(mulexp.getSons().get(i), isGlobal);
            else if (operators.get(i).getSign().equals("/"))
                ans /= calculateUnaryExp(mulexp.getSons().get(i), isGlobal);
            else if (operators.get(i).getSign().equals("%"))
                ans %= calculateUnaryExp(mulexp.getSons().get(i), isGlobal);
        }
        return ans;
    }

    public int calculateUnaryExp(UnaryExp unaryExp, boolean isGlobal) throws Exception {
        int sign = 1;
        for (Token token : unaryExp.getUnaryOps()) {
            if (token.getSign().equals("-")) sign *= -1;
        }
        if (unaryExp.getPrimaryExp() == null) throw new Exception();
        else return sign * calculatePrimaryExp(unaryExp.getPrimaryExp(), isGlobal);
    }

    public int calculatePrimaryExp(PrimaryExp primaryExp, boolean isGlobal) throws Exception {
        if (primaryExp.getNumber() != null) return primaryExp.getNumber().getValue();
        else if (primaryExp.getExp() != null) return calculateAddExp(primaryExp.getExp().getFirstSon(), isGlobal);
        else if (primaryExp.getlVal() != null) return calculateLVal(primaryExp.getlVal(), isGlobal);
        else throw new Exception();
    }

    public int calculateLVal(LVal getlVal, boolean isGlobal) throws Exception {
        String name = getlVal.getIdent().getSign();
        SymbolTable temp = this.symbolTable;
        while (temp != null) {
            if (temp.getSymbolMap().containsKey(name)) {
                Symbol symbol = temp.getSymbolMap().get(name);
                if (isGlobal) {
                    if (!symbol.isGlobal()) throw new RuntimeException("Symbol not Global");
                } else {
                    if (!symbol.isConst()) throw new RuntimeException("Can't calculate non-const value");
                }
                if (getlVal.getExps().size() == 0) {
                    return ((Immediate) symbol.getVarInit()).getValue();
                } else if (getlVal.getExps().size() == 1) {
                    int index = calculateAddExp(getlVal.getExps().get(0).getFirstSon(), isGlobal);
                    return ((Immediate) symbol.getArrayInit().get(index)).getValue();
                } else if (getlVal.getExps().size() == 2) {
                    int index1 = calculateAddExp(getlVal.getExps().get(0).getFirstSon(), isGlobal);
                    int index2 = calculateAddExp(getlVal.getExps().get(1).getFirstSon(), isGlobal);
                    int col = symbol.getDims().get(1);
                    return ((Immediate) symbol.getArrayInit().get(index1 * col + index2)).getValue();
                }
            } else temp = temp.getParent();
        }
        errorTable.getInstance().addError(new error(error.Type.UNDEFINED_IDENT, getlVal.getIdent().getLine()));
        return 0;
    }

}
