package optimizer;

import frontend.visitor.Visitor;
import middle.Code.MidCode;
import middle.Symbol.Symbol;
import middle.operand.Immediate;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class PeepholeOptimizer {

    public PeepholeOptimizer() {

    }

    public void combineArithAssign(Visitor visitor) throws IOException {
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        ArrayList<MidCode> newMidCodes = new ArrayList<>();
        for (int i = 0; i < midCodes.size(); i++) {
            MidCode midCode = midCodes.get(i);
            if (i + 1 < midCodes.size() && MidCode.arithOp.containsKey(midCode.getOperator())
                    && isTempOrImmediate(midCode.getResult())
                    && midCodes.get(i + 1).getOperator().equals(MidCode.Op.ASSIGN)) {
                MidCode nextMidCode = midCodes.get(i + 1);
                if (midCode.getResult().equals(nextMidCode.getOperand2())) {
                    MidCode newMidCode = new MidCode(midCode.getOperator(), midCode.getOperand1(), midCode.getOperand2(), nextMidCode.getOperand1());
                    newMidCodes.add(newMidCode);
                    i++;
                } else {
                    newMidCodes.add(midCode);
                }
            } else {
                newMidCodes.add(midCode);
            }
        }
        //输出信息
        Writer writer = new FileWriter("PeepholeOptimizer.txt");
        writer.write("combineArithAssign优化后的中间代码：\n");
        for (MidCode midCode : newMidCodes) {
            writer.write(midCode.toString() + "\n");
        }
        writer.flush();
        visitor.getMidCodeList().setMidCodes(newMidCodes);
    }

    public boolean isTempOrImmediate(String s) {
        return s.contains("#T")|| Immediate.checkImmediate(s);
    }


    // 优化算术运算的中间代码
    // 如果是乘以1或者除以1，直接删除
    // 如果是乘以0， 结果置位0
    // 如果是加上0或者减去0，直接删除
    public void deleteUselessCode(Visitor visitor) {
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        ArrayList<MidCode> newMidCodes = new ArrayList<>();
        for (MidCode midCode : midCodes) {
            if (ableToskip(midCode)) {
                continue;
            }
            newMidCodes.add(midCode);
        }
        visitor.getMidCodeList().setMidCodes(newMidCodes);
    }

    public boolean ableToskip(MidCode midCode) {
        if (midCode.getOperator().equals(MidCode.Op.ADD)) {
            return (midCode.getOperand2().equals("0") && midCode.getResult().equals(midCode.getOperand1()))
                    || (midCode.getOperand1().equals("0") && midCode.getResult().equals(midCode.getOperand2()));
        } else if (midCode.getOperator().equals(MidCode.Op.MUL)) {
            return (midCode.getOperand2().equals("1") && midCode.getResult().equals(midCode.getOperand1()))
                    || (midCode.getOperand1().equals("1") && midCode.getResult().equals(midCode.getOperand2()));
        } else if (midCode.getOperator().equals(MidCode.Op.DIV)) {
            return midCode.getOperand2().equals("1") && midCode.getResult().equals(midCode.getOperand1());
        } else if (midCode.getOperator().equals(MidCode.Op.SUB)) {
            return midCode.getOperand2().equals("0") && midCode.getResult().equals(midCode.getOperand1());
        }
        return false;
    }


}
