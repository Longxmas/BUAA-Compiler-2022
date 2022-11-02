package backend.Mips;

public class Instr {
    public enum LoadInstr {
        lw, lb, lbu, lh, lhu;
        public String toString() {
            return this.name();
        }
    }

    public enum StoreInstr {
        sw, sb, sh;
        public String toString() {
            return this.name();
        }
    }

    public enum RRInstr {
        add, addu, sub, subu, mul, mulu, div, divu, rem, remu, neg, negu, seq, sne, slt, sgt, sle, sge;
        public String toString() {
            return this.name();
        }
    }

    public enum RIInstr {
        addi, addiu, subi, subiu, muli, muliu, divi, diviu, remi, remiu, seqi, snei, slti, sgti, slei, sgei;
        public String toString() {
            return this.name();
        }
    }

    public enum BranchInstr {
        beq, bne, blt, bgt, ble, bge;
        public String toString() {
            return this.name();
        }
    }

    public enum JumpInstr {
        j, jal, jr, jalr;
        public String toString() {
            return this.name();
        }
    }

    public enum SyscallInstr {
        syscall;
        public String toString() {
            return this.name();
        }
    }

    public enum MoveInstr {
        move, mfhi, mflo, mthi, mtlo;
        public String toString() {
            return this.name();
        }
    }

    public enum ShiftInstr {
        sll, srl, sra;
        public String toString() {
            return this.name();
        }
    }




}
