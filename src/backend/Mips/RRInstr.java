package backend.Mips;

public class RRInstr implements Instr {
    public enum RRI {
        add, addu, sub, subu, and, or, xor, nor, slt, sltu;

        public String toString() {
            return this.name();
        }
    }

    RRI instr;
    String rd;
    String rs;
    String rt;

    public RRInstr(RRI instr, String rd, String rs, String rt) {
        this.instr = instr;
        this.rd = rd;
        this.rs = rs;
        this.rt = rt;
    }

    public String toString() {
        return instr.toString() + " " + rd + ", " + rs + ", " + rt;
    }

}
