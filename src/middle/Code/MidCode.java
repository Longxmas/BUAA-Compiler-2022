package middle.Code;

import middle.operand.Operand;

import java.util.HashMap;

public class MidCode {
    public enum Op {
        ASSIGN, GETINT, PRI,
        ADD, SUB, MUL, DIV, MOD, NOT, AND, OR,
        FUNC, END_FUNC, PRE_CALL, FUNC_CALL, PUSH_PARA, PUSH_PARA_ARR, FORM_VAR_DEF,
        RETURN,VAR_DEF,CONST_DEF,ARR_SAVE,ARR_LOAD,
        GEN_LABEL,JUMP,JUMP_IF,SET,
        NEW_BLOCK,END_BLOCK
    }

    public final HashMap<Op, String> toString = new HashMap<Op, String>() {{
        put(Op.ADD, "ADD");
        put(Op.SUB, "SUB");
        put(Op.MUL, "MUL");
        put(Op.DIV, "DIV");
        put(Op.MOD, "MOD");
        put(Op.PRI, "PRI");
        put(Op.NOT, "NOT");
        put(Op.FUNC, "FUNC");
        put(Op.END_FUNC, "END_FUNC");
        put(Op.PRE_CALL, "PRE_CALL");
        put(Op.FUNC_CALL, "FUNC_CALL");
        put(Op.RETURN, "RETURN");
        put(Op.VAR_DEF, "VAR_DEF");
        put(Op.CONST_DEF, "CONST_DEF");
        put(Op.NEW_BLOCK, "NEW_BLOCK");
        put(Op.END_BLOCK, "END_BLOCK");
        put(Op.GEN_LABEL, "GEN_LABEL");
        put(Op.JUMP, "JUMP");
        put(Op.JUMP_IF, "JUMP_IF");
        put(Op.SET, "SET");
        put(Op.ASSIGN, "ASSIGN");
        put(Op.GETINT, "GETINT");
        put(Op.ARR_SAVE, "ARR_SAVE");
        put(Op.ARR_LOAD, "ARR_LOAD");
        put(Op.PUSH_PARA, "PUSH_PARA");
        put(Op.PUSH_PARA_ARR, "PUSH_PARA_ARR");
        put(Op.FORM_VAR_DEF, "FORM_VAR_DEF");
    }};

    private Op operator = null;
    private String operand1 = null;
    private String operand2 = null;
    private String result = null;

    public MidCode(Op operator, Operand operand1, Operand operand2, Operand result) {
        this.operator = operator;
        this.operand1 = (operand1 != null) ? operand1.toString() : null;
        this.operand2 = (operand2 != null) ? operand2.toString() : null;
        this.result = (result != null) ? result.toString() : null;
    }

    public MidCode(Op operator, String operand1, String operand2, String result) {
        this.operator = operator;
        this.operand1 = operand1;
        this.operand2 = operand2;
        this.result = result;
    }


    public String toString() {
        if (operator.equals(Op.GETINT)) return operand1 + " = " + "input()";
        if (operator.equals(Op.VAR_DEF)) {
            return "var " + operand1 + (operand2 == null ? "" : " = " + operand2);
        }
        if (operator.equals(Op.CONST_DEF)) {
            return "const var " + operand1 + (operand2 == null ? "" : " = " + operand2);
        }
        if (operator.equals(Op.PRI)) return "print " + operand1;
        if (operator.equals(Op.FUNC) || operator.equals(Op.END_FUNC)) {
            return "<--------------- " + toString.get(operator) + " " + operand1 + "--------------->";
        }
        if (operator.equals(Op.ASSIGN) || operator.equals(Op.ARR_SAVE) || operator.equals(Op.ARR_LOAD)) {
            return operand1 + " = " + operand2;
        }
        if (operator.equals(Op.RETURN)) return "return " + operand1;
        if (result != null) return result + " = " + operand1 + " " + toString.get(operator) + " " + operand2;
        if (operand1 == null && operand2 == null) return toString.get(operator);
        if (operand2 == null) return toString.get(operator) + " " + operand1;
        return toString.get(operator) + " " + operand1 + " " + operand2;
    }

}
