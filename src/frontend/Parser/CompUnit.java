package frontend.Parser;

import frontend.Parser.Decl.Elements.Decl;
import frontend.Parser.FuncDef.Elements.FuncDef;
import frontend.Parser.FuncDef.Elements.MainFuncDef;

import java.util.ArrayList;

public class CompUnit {
    private ArrayList<Decl> decls = new ArrayList<>();
    private ArrayList<FuncDef> funcDefs = new ArrayList<>();
    private final MainFuncDef mainFuncDef;

    public CompUnit(ArrayList<Decl> decls,ArrayList<FuncDef> funcDefs,MainFuncDef mainFuncDef) {
        this.decls = decls;
        this.funcDefs = funcDefs;
        this.mainFuncDef = mainFuncDef;
    }

    public ArrayList<Decl> getDecls() {
        return decls;
    }

    public ArrayList<FuncDef> getFuncDefs() {
        return funcDefs;
    }

    public MainFuncDef getMainFuncDef() {
        return mainFuncDef;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for(Decl decl: decls) {
            sb.append(decl);
        }
        for(FuncDef funcDef : funcDefs) {
            sb.append(funcDef);
        }
        sb.append(mainFuncDef);
        return sb + "<CompUnit>\n";
    }

}
