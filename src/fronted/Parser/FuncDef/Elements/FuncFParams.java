package fronted.Parser.FuncDef.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class FuncFParams {
    FuncFParam firstFuncFParam;
    ArrayList<FuncFParam> funcFParams = new ArrayList<>();

    public FuncFParams(FuncFParam firstFuncFParam, ArrayList<FuncFParam> funcFParams) {
        this.firstFuncFParam = firstFuncFParam;
        this.funcFParams = funcFParams;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(firstFuncFParam);
        for(FuncFParam ffp : funcFParams) {
            sb.append(Token.printSign(",")).append(ffp);
        }
        return sb + "<FuncFParams>\n";
    }
}
