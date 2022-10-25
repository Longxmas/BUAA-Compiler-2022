package fronted.Parser.FuncDef.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Stmt.Elements.Block;

public class MainFuncDef {
    private Block block;

    public MainFuncDef(Block block) {
        this.block = block;
    }

    public String toString() {
        return Token.printSign("int") + Token.printSign("main")
                + Token.printSign("(") + Token.printSign(")")
                + block.toString() + "<MainFuncDef>\n";
    }
}
