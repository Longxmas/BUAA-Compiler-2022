package backend.Mips;

public class MoveInstr implements Instr {
    public enum MI {
        move, mfhi, mflo, mthi, mtlo;
        public String toString() {
            return this.name();
        }
    }

    MI instr;
    String target;
    String source;

    public MoveInstr(MI instr, String target, String source) {
        this.instr = instr;
        this.target = target;
        this.source = source;
    }

    public MoveInstr(MI instr, String target) {
        this.instr = instr;
        this.target = target;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(instr.toString()).append(" ").append(target);
        if (source != null) sb.append(", ").append(source);
        return sb.toString();
    }

}
