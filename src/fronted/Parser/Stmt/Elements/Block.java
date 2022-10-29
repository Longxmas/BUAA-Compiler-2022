package fronted.Parser.Stmt.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class Block {
    private ArrayList<BlockItem> blockItems;
    private int line;

    public Block(ArrayList<BlockItem> blockItems, Token token) {
        this.blockItems = blockItems;
        this.line = token.getLine();
    }

    public ArrayList<BlockItem> getBlockItems() {
        return blockItems;
    }

    public int getLine() {
        return line;
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
