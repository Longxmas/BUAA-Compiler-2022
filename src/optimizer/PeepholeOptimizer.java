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
                    && (midCodes.get(i + 1).getOperator().equals(MidCode.Op.ASSIGN)
                    || midCodes.get(i + 1).getOperator().equals(MidCode.Op.VAR_DEF))) {
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
        return s.contains("#T") || Immediate.checkImmediate(s);
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


    public HashMap<String, String> setLabelMap(ArrayList<MidCode> midCodes) {
        HashMap<String,String> labelMap = new HashMap<>();
        for (int i = 0; i < midCodes.size() - 1; i++) {
            MidCode midCode = midCodes.get(i);
            MidCode nextMidCode = midCodes.get(i + 1);
            if (midCode.getOperator().equals(MidCode.Op.GEN_LABEL)
                    && nextMidCode.getOperator().equals(MidCode.Op.GEN_LABEL)) {
                labelMap.put(midCode.getOperand1().substring(0, midCode.getOperand1().length() - 1),
                        nextMidCode.getOperand1().substring(0, nextMidCode.getOperand1().length() - 1));
            }
        }
        return labelMap;
    }

    public void deleteUselessLabel(Visitor visitor) throws IOException {
        ArrayList<MidCode> midCodes = visitor.getMidCodeList().getMidCodes();
        ArrayList<MidCode> newMidCodes;
        HashMap<String, String> labelMap = setLabelMap(midCodes);

        boolean flag = true;
        while (flag) {
            flag = false;
            for (String label : labelMap.keySet()) {
                if (label.contains("ifElse_begin") || labelMap.get(label).contains("ifElse_begin")) continue;
                newMidCodes = new ArrayList<>();
                for (MidCode midCode : midCodes) {
                    if (midCode.getOperator().equals(MidCode.Op.JUMP)) {
                        if (midCode.getOperand1().equals(label)) {
                            MidCode newMidCode = new MidCode(midCode.getOperator(), labelMap.get(label), midCode.getOperand2(), midCode.getResult());
                            newMidCodes.add(newMidCode);
                            flag = true;
                            continue;
                        }
                    } else if (midCode.getOperator().equals(MidCode.Op.JUMP_IF)) {
                        if (midCode.getResult().equals(label)) {
                            MidCode newMidCode = new MidCode(midCode.getOperator(), midCode.getOperand1(), midCode.getOperand2(), labelMap.get(label));
                            newMidCodes.add(newMidCode);
                            flag = true;
                            continue;
                        }
                    } else if (midCode.getOperator().equals(MidCode.Op.GEN_LABEL)) {
                        if (midCode.getOperand1().substring(0, midCode.getOperand1().length() - 1).equals(label)) {
                            flag = true;
                            continue;
                        }
                    }
                    newMidCodes.add(midCode);
                }
                if (labelMap.containsKey(labelMap.get(label))) {
                    labelMap.put(label, labelMap.get(labelMap.get(label)));
                }
                midCodes = new ArrayList<>(newMidCodes);
            }
        }

        newMidCodes = new ArrayList<>();
        //删掉不必要的jump
        for (int i = 0; i < midCodes.size() - 1; i++) {
            MidCode midCode = midCodes.get(i);
            MidCode nextMidCode = midCodes.get(i + 1);
            if (midCode.getOperator().equals(MidCode.Op.JUMP)
                    && nextMidCode.getOperator().equals(MidCode.Op.GEN_LABEL)) {
                if (midCode.getOperand1().equals(nextMidCode.getOperand1().substring(0, nextMidCode.getOperand1().length() - 1))) {
                    continue;
                }
            } else if (midCode.getOperator().equals(MidCode.Op.JUMP_IF)
                    && nextMidCode.getOperator().equals(MidCode.Op.GEN_LABEL)) {
                if (midCode.getResult().equals(nextMidCode.getOperand1().substring(0, nextMidCode.getOperand1().length() - 1))) {
                    continue;
                }
            }
            newMidCodes.add(midCode);
        }
        newMidCodes.add(midCodes.get(midCodes.size() - 1));

        //修改连续的jump
        midCodes = new ArrayList<>(newMidCodes);
        for (int i = 0; i < midCodes.size() - 1; i++) {
            MidCode midCode = midCodes.get(i);
            if (midCode.getOperator().equals(MidCode.Op.JUMP) || midCode.getOperator().equals(MidCode.Op.JUMP_IF)) {
                String label = midCode.getOperand1().substring(0, midCode.getOperand1().length() - 1);
                int j;
                for (j = i + 1; j < midCodes.size(); j++) {
                    MidCode nextMidCode = midCodes.get(j);
                    if (midCodes.get(j).getOperator().equals(MidCode.Op.GEN_LABEL) &&
                            nextMidCode.getOperand1().substring(0, nextMidCode.getOperand1().length() - 1).equals(label)) {
                        break;
                    }
                }
                if (j == midCodes.size()) continue;
                MidCode nextMidCode = midCodes.get(j + 1);
                if (nextMidCode.getOperator().equals(MidCode.Op.JUMP)) {
                    if (midCode.getOperator().equals(MidCode.Op.JUMP)) {
                        midCode.setOperand1(nextMidCode.getOperand1());
                    } else {
                        midCode.setResult(nextMidCode.getOperand1());
                    }
                }
            }
        }

        //输出信息
        Writer writer = new FileWriter("deleteLabel.txt");
        writer.write("deleteLabel优化后的中间代码：\n");
        for (MidCode midCode : midCodes) {
            writer.write(midCode.toString() + "\n");
        }
        writer.flush();
        visitor.getMidCodeList().setMidCodes(midCodes);
    }

}
