package frontend.Parser.Decl.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class ConstDecl extends Decl {
    private ArrayList<ConstDef> constDefs = new ArrayList<>();

    public ConstDecl(ArrayList<ConstDef> constDefs) {
        this.constDefs = constDefs;
    }

    public ArrayList<ConstDef> getConstDefs() {
        return constDefs;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Token.printSign("const")).append(Token.printSign("int"));
        ConstDef firstConstDef = constDefs.get(0);
        sb.append(firstConstDef);
        for (int i = 1; i < constDefs.size();i ++) {
            sb.append(Token.printSign(",")).append(constDefs.get(i));
        }
        sb.append(Token.printSign(";"));
        return sb + "<ConstDecl>\n";
    }

}
