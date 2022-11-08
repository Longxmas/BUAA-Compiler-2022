package backend.Mips;

public class StoreInstr implements Instr {
    public enum SI {
        sw, sb, sh;

        public String toString() {
            return this.name();
        }
    }

    SI instr;
    String target;
    String base = null;
    String offset;

    public StoreInstr(SI instr, String target, String base, String offset) {
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
