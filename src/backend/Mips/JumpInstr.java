package backend.Mips;

public class JumpInstr implements Instr {
    public enum JI {
        j, jal, jr, jalr;

        public String toString() {
            return this.name();
        }
    }

    JI instr;
    String target;

    public JumpInstr(JI instr, String target) {
        this.instr = instr;
        this.target = target;
    }

    public String toString() {
        return instr.toString() + " " + target;
    }

}
