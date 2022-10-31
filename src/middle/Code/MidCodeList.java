package middle.Code;

import fronted.Lexer.Token;
import middle.Symbol.FuncTable;
import middle.Symbol.Symbol;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;

public class MidCodeList {
    private ArrayList<MidCode> midCodes = new ArrayList<>();

    //indexCount
    public int tmpIndex;
    public int label_cnt;
    public ArrayList<String> strCons;

    //block location description (necessary ?)
    private int depth;
    private int index;
    private ArrayList<Integer> depths = new ArrayList<>();
    public HashMap<String, FuncTable> curFuncTables;


    public MidCodeList(ArrayList<Integer> depths, HashMap<String, FuncTable> funcTables) {
        this.depths = depths;
        this.depth = 0;
        this.index = 0;
        this.label_cnt = 0;
        this.tmpIndex = 0;
        this.curFuncTables = funcTables;
        this.midCodes = new ArrayList<>();
        this.strCons = new ArrayList<>();
    }

    public void add(MidCode midCode) {
        this.midCodes.add(midCode);
    }

    public void addStr(String s) {
        this.strCons.add('"' + s + '"');
        this.midCodes.add(new MidCode(MidCode.Op.PRI, "#str" + (strCons.size() - 1), null, null));
    }

    public void addTempIndex() {
        this.tmpIndex++;
    }

    public String toString() {
        System.out.println(midCodes.size());
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < strCons.size(); i++) {
            sb.append("#str" + i + ": " + strCons.get(i)).append("\n");
        }
        for (MidCode midCode : midCodes) {
            sb.append(midCode.toString()).append("\n");
        }
        return sb.toString();
    }

    public ArrayList<String> getStrCons() {
        return strCons;
    }
}
