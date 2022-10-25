package fronted.Parser.Decl.Elements;

import  fronted.Lexer.Token;

import java.util.ArrayList;

public class VarDecl extends Decl {
    private VarDef firstVarDef;
    private ArrayList<VarDef> varDefs = new ArrayList<>();

    public VarDecl(VarDef firstVarDef,ArrayList<VarDef> VarDefs) {
        this.firstVarDef = firstVarDef;
        this.varDefs = VarDefs;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Token.printSign("int"));
        sb.append(firstVarDef);
        for (VarDef cd : varDefs) {
            sb.append(Token.printSign(",")).append(cd);
        }
        sb.append(Token.printSign(";"));
        return sb + "<VarDecl>\n";
    }
}
