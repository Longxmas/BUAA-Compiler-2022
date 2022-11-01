package fronted.visitor;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.*;
import fronted.error.error;
import fronted.error.errorTable;
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
        return CalculateConstAddExp(exp.getFirstSon());
    }

    public int CalculateConstAddExp(AddExp exp) {
        int ans = CalculateConstMulExp(exp.getFirstSon());
        ArrayList<Token> operators = exp.getOperators();
        for (int i = 0; i < exp.getSons().size(); i++) {
            if (operators.get(i).getSign().equals("+")) ans += CalculateConstMulExp(exp.getSons().get(i));
            else if (operators.get(i).getSign().equals("-")) ans -= CalculateConstMulExp(exp.getSons().get(i));
        }
        return ans;
    }

    public int CalculateConstMulExp(MulExp exp) {
        int ans = CalculateConstUnaryExp(exp.getFirstSon());
        ArrayList<Token> operators = exp.getOperators();
        for (int i = 0; i < exp.getSons().size(); i++) {
            if (operators.get(i).getSign().equals("*")) ans *= CalculateConstUnaryExp(exp.getSons().get(i));
            else if (operators.get(i).getSign().equals("/")) ans /= CalculateConstUnaryExp(exp.getSons().get(i));
            else if (operators.get(i).getSign().equals("%")) ans %= CalculateConstUnaryExp(exp.getSons().get(i));
        }
        return ans;
    }


    public int CalculateConstUnaryExp(UnaryExp exp) {
        int sign = 1;
        for (Token token : exp.getUnaryOps()) {
            if (token.getSign().equals("-")) sign *= -1;
        }
        if (exp.getPrimaryExp() == null) return 0;
        else return sign * CalculateConstPrimaryExp(exp.getPrimaryExp());
    }

    public int CalculateConstPrimaryExp(PrimaryExp exp) {
        if (exp.getNumber() != null) return exp.getNumber().getValue();
        else if (exp.getExp() != null) return CalculateConstAddExp(exp.getExp().getFirstSon());
        else if (exp.getlVal() != null) return CalConstLVal(exp.getlVal());
        else return 0;
    }

    public int CalConstLVal(LVal lVal) {
        String name = lVal.getIdent().getSign();
        SymbolTable temp = this.symbolTable;
        while (temp != null) {
            if (temp.getSymbolMap().containsKey(name)) {
                Symbol symbol = temp.getSymbolMap().get(name);
                if (lVal.getExps().size() == 0) {
                    return ((Immediate) symbol.getVarInit()).getValue();
                } else if (lVal.getExps().size() == 1) {
                    int index = CalculateConstAddExp(lVal.getExps().get(0).getFirstSon());
                    return ((Immediate) symbol.getArrayInit().get(index)).getValue();
                } else if (lVal.getExps().size() == 2) {
                    int index1 = CalculateConstAddExp(lVal.getExps().get(0).getFirstSon());
                    int index2 = CalculateConstAddExp(lVal.getExps().get(1).getFirstSon());
                    int col = symbol.getDims().get(1);
                    return ((Immediate) symbol.getArrayInit().get(index1 * col + index2)).getValue();
                }
            } else temp = temp.getParent();
        }
        errorTable.getInstance().addError(new error(error.Type.UNDEFINED_IDENT, lVal.getIdent().getLine()));
        return 0;
    }

}
