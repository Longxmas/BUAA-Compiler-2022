package fronted.Parser.Decl.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class ConstDecl extends Decl {
    private final ConstDef firstConstDef;
    private ArrayList<ConstDef> constDefs = new ArrayList<>();

    public ConstDecl(ConstDef firstConstDef, ArrayList<ConstDef> constDefs) {
        this.firstConstDef = firstConstDef;
        this.constDefs = constDefs;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Token.printSign("const")).append(Token.printSign("int"));
        sb.append(firstConstDef);
        for (ConstDef cd : constDefs) {
            sb.append(Token.printSign(",")).append(cd);
        }
        sb.append(Token.printSign(";"));
        return sb + "<ConstDecl>\n";
    }

}
