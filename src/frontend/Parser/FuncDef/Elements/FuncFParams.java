package frontend.Parser.FuncDef.Elements;

import frontend.Lexer.Token;

import java.util.ArrayList;

public class FuncFParams {
    ArrayList<FuncFParam> funcFParams = new ArrayList<>();

    public FuncFParams(ArrayList<FuncFParam> funcFParams) {
        this.funcFParams = funcFParams;
    }

    public ArrayList<FuncFParam> getFuncFParams() {
        return funcFParams;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(funcFParams.get(0));
        for(int i = 1;i < funcFParams.size();i ++) {
            sb.append(Token.printSign(",")).append(funcFParams.get(i));
        }
        return sb + "<FuncFParams>\n";
    }
}
