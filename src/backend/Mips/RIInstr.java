package backend.Mips;

public class RIInstr implements Instr {
    public enum RII {
        addi, addiu, andi, ori, xori, slti, sltiu, lui;

        public String toString() {
            return this.name();
        }
    }

    RII instr;
    String target;
    String source;
    int immediate;

    public RIInstr(RII instr, String target, String source, int immediate) {
        this.instr = instr;
        this.target = target;
        this.source = source;
        this.immediate = immediate;
    }

    public String toString() {
        return instr.toString() + " " + target + ", " + source + ", " + immediate;
    }

}
