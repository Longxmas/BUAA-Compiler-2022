package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class Block {
    private ArrayList<BlockItem> blockItems;

    public Block(ArrayList<BlockItem> blockItems) {
        this.blockItems = blockItems;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Token.printSign("{"));
        for(BlockItem bi : blockItems) {
            sb.append(bi.toString());
        }
        sb.append(Token.printSign("}"));
        return sb + "<Block>\n";
    }
}
