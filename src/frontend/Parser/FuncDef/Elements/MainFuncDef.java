package frontend.Parser.FuncDef.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Stmt.Elements.Block;

public class MainFuncDef {
    private Block block;

    public MainFuncDef(Block block) {
        this.block = block;
    }

    public Block getBlock() {
        return block;
    }

    public String toString() {
        return Token.printSign("int") + Token.printSign("main")
                + Token.printSign("(") + Token.printSign(")")
                + block.toString() + "<MainFuncDef>\n";
    }
}
