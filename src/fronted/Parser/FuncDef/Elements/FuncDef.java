package fronted.Parser.FuncDef.Elements;

import fronted.Lexer.Token;
import fronted.Parser.Stmt.Elements.Block;

public class FuncDef {
    private FuncType funcType;
    private Token ident;
    private FuncFParams funcFParams = null;
    private Block block;

    public FuncDef(FuncType funcType, Token ident, FuncFParams funcFParams, Block block) {
        this.funcType = funcType;
        this.ident = ident;
        this.funcFParams = funcFParams;
        this.block = block;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(funcType.toString()).append(ident).append(Token.printSign("("));
        if (funcFParams != null) {
            sb.append(funcFParams);
        }
        sb.append(Token.printSign(")")).append(block).append("<FuncDef>\n");
        return sb.toString();
    }
}
