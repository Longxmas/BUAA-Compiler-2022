package optimizer;

import backend.MipsGenerator;
import frontend.visitor.Visitor;
import middle.Code.MidCode;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;

public class BlockAnalyser {
    private final Visitor visitor;
    private final ArrayList<MidCode> midCodes;
    private final ArrayList<FuncBlock> funcBlocks = new ArrayList<>();

    public HashMap<String, BasicBlock> label2Block = new HashMap<>();
    int midCodeIndex = 0;

    public BlockAnalyser(Visitor visitor) throws IOException {
        this.midCodes = visitor.getMidCodeList().getMidCodes();
        this.visitor = visitor;
        blockVisitor();
        printMessage();
    }

    public ArrayList<FuncBlock> getFuncBlocks() {
        return funcBlocks;
    }

    public void blockVisitor() {
        while (midCodeIndex < midCodes.size()) {
            while (midCodeIndex < midCodes.size() &&
                    !midCodes.get(midCodeIndex).getOperator().equals(MidCode.Op.FUNC)) {
                midCodeIndex++;
            }
            if (midCodeIndex >= midCodes.size()) {
                break;
            }
            FuncBlock funcBlock = new FuncBlock(midCodes.get(midCodeIndex).getOperand1());
            while (midCodeIndex < midCodes.size() &&
                    !midCodes.get(midCodeIndex).getOperator().equals(MidCode.Op.END_FUNC)) {
                funcBlock.addBasicBlock(parseBasicBlock(0, funcBlock));
            }
            funcBlocks.add(funcBlock);
        }
        setBeforeAfter();
    }

    public void setBeforeAfter() {
        for (FuncBlock funcBlock : funcBlocks) {
            for (BasicBlock basicBlock : funcBlock.getBasicBlocks().values()) {
                for (String label : basicBlock.getJumpToLabels()) {
                    basicBlock.addAfter(label2Block.get(label));
                }
            }
            for (BasicBlock basicBlock : funcBlock.getBasicBlocks().values()) {
                if (basicBlock.getAfters() == null || basicBlock.getAfters().size() == 0) {
                    continue;
                }
                for (BasicBlock after : basicBlock.getAfters()) {
                    after.addBefore(basicBlock);
                }
            }
        }

    }

    public BasicBlock parseBasicBlock(int blockIndex, FuncBlock funcBlock) {
        BasicBlock block = new BasicBlock(blockIndex);
        MidCode midCode = midCodes.get(midCodeIndex);

        if (midCode.getOperator().equals(MidCode.Op.GEN_LABEL)) {
            while (midCode.getOperator().equals(MidCode.Op.GEN_LABEL)) {
                String label = midCode.getOperand1().substring(0, midCode.getOperand1().length() - 1);
                block.addLabel(label);
                block.addMidCode(midCode);
                label2Block.put(label, block);
                midCode = midCodes.get(++midCodeIndex);
            }
        }

        while (midCodeIndex < midCodes.size()
                && midCode.getOperator() != MidCode.Op.GEN_LABEL
                && midCode.getOperator() != MidCode.Op.JUMP
                && midCode.getOperator() != MidCode.Op.JUMP_IF
                && midCode.getOperator() != MidCode.Op.RETURN
                && midCode.getOperator() != MidCode.Op.END_FUNC) {
            block.addMidCode(midCode);
            midCode = midCodes.get(++midCodeIndex);
        }

        //跳转之后的第一句是新的基本块的第一句
        if (midCode.getOperator().equals(MidCode.Op.JUMP)) {
            block.addMidCode(midCode);
            block.addJumpToLabel(midCode.getOperand1());
            midCodeIndex++;
            BasicBlock nextBlock = parseBasicBlock(blockIndex + 1, funcBlock);
            funcBlock.addBasicBlock(nextBlock);
            block.addAfter(nextBlock);
        } else if (midCode.getOperator().equals(MidCode.Op.JUMP_IF)) {
            block.addMidCode(midCode);
            block.addJumpToLabel(midCode.getResult());
            midCodeIndex++;
            BasicBlock nextBlock = parseBasicBlock(blockIndex + 1, funcBlock);
            funcBlock.addBasicBlock(nextBlock);
            block.addAfter(nextBlock);
        } else if  (midCodes.get(midCodeIndex).getOperator().equals(MidCode.Op.GEN_LABEL)) {
            BasicBlock nextBlock = parseBasicBlock(blockIndex + 1, funcBlock);
            funcBlock.addBasicBlock(nextBlock);
            block.addAfter(nextBlock);
            block.addJumpToLabels(nextBlock.getLabels());
        } else if (midCode.getOperator().equals(MidCode.Op.END_FUNC)) {
            block.addMidCode(midCode);
        } else if (midCode.getOperator().equals(MidCode.Op.RETURN)) {
            block.addMidCode(midCode);
            midCode = midCodes.get(++midCodeIndex);
            if (midCode.getOperator().equals(MidCode.Op.END_BLOCK)) {
                block.addMidCode(midCode);
                midCode = midCodes.get(++midCodeIndex);
                if (midCode.getOperator().equals(MidCode.Op.END_FUNC)) {
                    block.addMidCode(midCode);
                    return block;
                }
            } else if (midCode.getOperator().equals(MidCode.Op.END_FUNC)) {
                block.addMidCode(midCode);
                return block;
            }
            BasicBlock nextBlock = parseBasicBlock(blockIndex + 1, funcBlock);
            funcBlock.addBasicBlock(nextBlock);
        }
        return block;
    }

    public void printMessage() throws IOException {
        Writer writer = new FileWriter("blockAnalyse.txt", false);
        for (FuncBlock funcBlock : funcBlocks) {
            writer.write("funcBlock: " + funcBlock.getFuncName() + "\n");
            for (int i  = 0; i < funcBlock.getBasicBlocks().size(); i++) {
                BasicBlock basicBlock = funcBlock.getBasicBlocks().get(i);
                writer.write("\n" + "basicBlockIndex: " + basicBlock.getIndex() + "\n");
                for (String label : basicBlock.getLabels()) {
                    writer.write("labels =  " + label + "\n");
                }
                writer.write("midCodes:\n");
                for (MidCode midCode : basicBlock.getMidCodes()) {
                    writer.write(midCode.toString() + "\n");
                }
                writer.write("\n");
                for (String jump : basicBlock.getJumpToLabels()) {
                    writer.write("jumpToLabel =  " + jump + "\n");
                }
                for (BasicBlock after : basicBlock.getAfters()) {
                    writer.write("after: " + after.getIndex() + "\n");
                }
            }
        }
        writer.flush();
    }


}
