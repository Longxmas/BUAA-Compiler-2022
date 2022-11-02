package frontend.Parser.FuncDef.Elements;

import frontend.Lexer.Token;
import frontend.Parser.Stmt.Elements.Block;

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

    public Token getIdent() {
        return this.ident;
    }

    public FuncType getFuncType() {
        return funcType;
    }

    public FuncFParams getFuncFParams() {
        return funcFParams;
    }

    public Block getBlock() {
        return block;
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
