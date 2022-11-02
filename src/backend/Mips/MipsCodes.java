package backend.Mips;

import java.util.ArrayList;

public class MipsCodes {
    private final ArrayList<MipsCode> mipsCodes = new ArrayList<>();

    public void addCode(MipsCode mipsCode) {
        mipsCodes.add(mipsCode);
    }

    public ArrayList<MipsCode> getMipsCodes() {
        return mipsCodes;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (MipsCode mipsCode : mipsCodes) {
            sb.append(mipsCode).append("\n");
        }
        return sb.toString();
    }
}
