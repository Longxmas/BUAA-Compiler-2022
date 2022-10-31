package middle.operand;

public class Immediate implements Operand{
    int value;

    public Immediate(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public String toString() {
        return String.valueOf(value);
    }
}
