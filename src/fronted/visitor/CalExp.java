package fronted.visitor;

import fronted.Lexer.Token;
import fronted.Parser.Expr.Elements.*;
import fronted.error.error;
import fronted.error.errorTable;
import middle.Symbol.SymbolTable;

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
        else {
            LVal lVal = exp.getlVal();
            String name = lVal.getIdent().getSign();
            SymbolTable temp = this.symbolTable;
            while (temp != null) {
                if (temp.getSymbolMap().containsKey(name)) {
                    return temp.getSymbolMap().get(name).getVarInit();
                } else temp = temp.getParent();
            }
            errorTable.getInstance().addError(new error(error.Type.UNDEFINED_IDENT, lVal.getIdent().getLine()));
            return 0;
        }
    }

}
