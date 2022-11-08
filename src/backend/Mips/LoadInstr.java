package backend.Mips;

public class LoadInstr implements Instr {
    public enum LI {
        lw, lb, lbu, lh, lhu;

        public String toString() {
            return this.name();
        }
    }

    LI instr;
    String target;
    String base = null;
    String offset;

    public LoadInstr(LI instr, String target, String base, String offset) {
        this.instr = instr;
        this.target = target;
        this.base = base;
        this.offset = offset;
    }

    public String toString() {
        if (base != null) {
            return instr.toString() + " " + target + ", " + offset + "(" + base + ")";
        } else {
            return instr.toString() + " " + target + ", " + offset;
        }

    }
}

