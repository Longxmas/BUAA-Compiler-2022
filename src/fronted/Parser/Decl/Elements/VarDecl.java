package fronted.Parser.Decl.Elements;

import  fronted.Lexer.Token;

import java.util.ArrayList;

public class VarDecl extends Decl {
    private ArrayList<VarDef> varDefs = new ArrayList<>();

    public VarDecl(ArrayList<VarDef> VarDefs) {
        this.varDefs = VarDefs;
    }

    public ArrayList<VarDef> getVarDefs() {
        return varDefs;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Token.printSign("int"));
        VarDef firstVarDef = varDefs.get(0);
        sb.append(firstVarDef);
        for (int i = 1; i < varDefs.size();i ++) {
            sb.append(Token.printSign(",")).append(varDefs.get(i));
        }
        sb.append(Token.printSign(";"));
        return sb + "<VarDecl>\n";
    }
}
