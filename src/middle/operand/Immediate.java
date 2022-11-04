package middle.operand;

public class Immediate implements Operand {
    int value;

    public Immediate(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static boolean checkImmediate(String s) {
        try {
            //把字符串强制转换为数字
            int num = Integer.parseInt(s);
            //如果是数字，返回True
            return true;
        } catch (Exception e) {
            //如果抛出异常，返回False
            return false;
        }
    }


    public String toString() {
        return String.valueOf(value);
    }
}
