package optimizer;

import java.util.ArrayList;
import java.util.HashMap;

public class FuncBlock {
    private final String funcName;
    private final HashMap<Integer, BasicBlock> basicBlocks = new HashMap<>();

    public FuncBlock(String funcName) {
        this.funcName = funcName;
    }

    public void addBasicBlock(BasicBlock basicBlock) {
        basicBlocks.put(basicBlock.getIndex(), basicBlock);
    }

    public HashMap<Integer, BasicBlock> getBasicBlocks() {
        return basicBlocks;
    }

    public String getFuncName() {
        return funcName;
    }
}
