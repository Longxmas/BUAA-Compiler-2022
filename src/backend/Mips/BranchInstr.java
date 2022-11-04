package backend.Mips;

public class BranchInstr implements Instr {
    public enum BI {
        beq, bne, blt, bgt, ble, bge;

        public String toString() {
            return this.name();
        }
    }

    BI instr;
    String rs;
    String rt;
    String label;

    public BranchInstr(BI instr, String rt, String rs, String label) {
        this.instr = instr;
        this.rt = rt;
        this.rs = rs;
        this.label = label;
    }

    public String toString() {
        return instr.toString() + " " + rs + ", " + rt + "(" + label + ")";
    }

}
