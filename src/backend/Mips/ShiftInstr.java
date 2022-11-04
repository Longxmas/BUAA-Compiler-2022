package backend.Mips;

public class ShiftInstr implements Instr {
    public enum ShiftInstruction {
        sll, srl, sra;
        public String toString() {
            return this.name();
        }
    }

    ShiftInstruction instr;
    String target;
    String source;
    String shift;

    public ShiftInstr(ShiftInstruction instr, String target, String source, String shift) {
        this.instr = instr;
        this.target = target;
        this.source = source;
        this.shift = shift;
    }

    public String toString() {
        return instr.toString() + " " + target + ", " + source + ", " + shift;
    }

}
