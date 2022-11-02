package frontend.Parser.Stmt.Elements;

public class BlockStmt extends Stmt {
    private Block block;

    public Block getBlock() {
        return block;
    }

    public BlockStmt(Block block) {
        this.block = block;
    }

    public String toString() {
        return block.toString() + "<Stmt>\n";
    }
}
