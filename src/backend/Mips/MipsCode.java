package backend.Mips;

import middle.Code.MidCode;

public class MipsCode {
    private Instr instr = null;
    private String instrString = null;
    private String operand1 = null;
    private String operand2 = null;
    private String operand3 = null;

    public MipsCode(String instr) {
        this.instrString = instr;
    }

    public MipsCode(String instr, String operand1) {
        this.instrString = instr;
        this.operand1 = operand1;
    }


    public MipsCode(String instr, String operand1, String operand2, String operand3) {
        this.instrString = instr;
        this.operand1 = operand1;
        this.operand2 = operand2;
        this.operand3 = operand3;
    }

    public MipsCode(Instr instr) {
        this.instr = instr;
        this.instrString = instr.toString();
    }

    public String toString() {
        if (instr != null) return instr.toString();
        StringBuilder sb = new StringBuilder();
        sb.append(instrString);
        if (operand1 != null) sb.append(", ").append(operand1);
        if (operand2 != null) sb.append(", ").append(operand2);
        if (operand3 != null) sb.append(", ").append(operand3);
        return sb.toString();
    }
}
