package optimizer;

import backend.MipsGenerator;
import middle.Code.MidCode;
import middle.Code.MidCodeList;
import middle.Symbol.Symbol;

public class tempVarChecker {
    //检查临时变量最后一次被使用的位置
    static public int checkLastUse(MidCodeList midCodeList, Symbol temp) {
        int ans = 0;
        for (MidCode code : midCodeList.getMidCodes()) {
            if (MipsGenerator.getMidCodeSymbols(code).contains(temp)) {
                ans = midCodeList.getMidCodes().indexOf(code);
            }
        }
        return ans;
    }

    static public boolean needToStore(MidCodeList midCodeList, Symbol temp, MidCode midCode) {
        int lastUse = checkLastUse(midCodeList, temp);
        return lastUse > midCodeList.getMidCodes().indexOf(midCode);
    }
}
