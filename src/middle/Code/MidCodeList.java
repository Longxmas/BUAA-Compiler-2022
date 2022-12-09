package middle.Code;

import middle.Symbol.FuncTable;

import java.util.ArrayList;
import java.util.HashMap;

public class MidCodeList {
    private ArrayList<MidCode> midCodes = new ArrayList<>();

    //indexCount
    public int tmpIndex;
    public int andLabelCnt = 0;
    public int orLabelCnt = 0;
    public int condLabelCnt = 0;
    public int ifElseEndLabelCnt = 0;
    public int elseStartLabelCnt = 0;
    public int whileLabelCnt = 0;
    public ArrayList<String> strCons;
    public HashMap<String, String> strConMap = new HashMap<>();


    public MidCodeList() {
        this.tmpIndex = 0;
        this.midCodes = new ArrayList<>();
        this.strCons = new ArrayList<>();
    }

    public void add(MidCode midCode) {
        this.midCodes.add(midCode);
    }

    public void addStr(String s) {
        this.strCons.add('"' + s + '"');
        this.strConMap.put("#str" + (strCons.size() - 1), '"' + s + '"');
        this.midCodes.add(new MidCode(MidCode.Op.PRI, "#str" + (strCons.size() - 1), null, null));
    }

    public void addTempIndex() {
        this.tmpIndex++;
    }

    public String toString() {
        //System.out.println(midCodes.size());
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < strCons.size(); i++) {
            sb.append("#str").append(i).append(": ").append(strCons.get(i)).append("\n");
        }
        for (MidCode midCode : midCodes) {
            sb.append(midCode.toString()).append("\n");
        }
        return sb.toString();
    }

    public ArrayList<MidCode> getMidCodes() {
        return midCodes;
    }

    public ArrayList<MidCode> getGlobalVarDefines() {
        ArrayList<MidCode> globalVarDefines = new ArrayList<>();
        for (MidCode midCode : midCodes) {
            if (!midCode.getOperator().equals(MidCode.Op.FUNC)) {
                globalVarDefines.add(midCode);
                continue;
            }
            break;
        }
        return globalVarDefines;
    }

    public void setMidCodes(ArrayList<MidCode> midCodes) {
        this.midCodes = midCodes;
    }
}
