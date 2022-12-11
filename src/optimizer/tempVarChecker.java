package optimizer;

import backend.MipsGenerator;
import middle.Code.MidCode;
import middle.Code.MidCodeList;
import middle.Symbol.Symbol;

import java.util.ArrayList;

public class tempVarChecker {
    //检查临时变量最后一次被使用的位置
    static public int checkLastUse(ArrayList<MidCode> midCodes, Symbol temp) {
        int ans = 0;
        for (MidCode code : midCodes) {
            if (MipsGenerator.getMidCodeSymbols(code).contains(temp)) {
                ans = midCodes.indexOf(code);
            }
        }
        return ans;
    }

    static public boolean needToStore(ArrayList<MidCode> midCodes, Symbol temp, MidCode midCode) {
        int lastUse = checkLastUse(midCodes, temp);
        return lastUse > midCodes.indexOf(midCode);
    }
}
