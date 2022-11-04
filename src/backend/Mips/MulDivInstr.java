package backend.Mips;

public class MulDivInstr implements Instr {
    public enum MDI {
        mult, multu, div, divu;

        public String toString() {
            return this.name();
        }
    }

    MDI instr;
    String rs;
    String rt;

    public MulDivInstr(MDI instr, String rs, String rt) {
        this.instr = instr;
        this.rs = rs;
        this.rt = rt;
    }

    public String toString() {
        return instr.toString() + " " + rs + ", " + rt;
    }


}
