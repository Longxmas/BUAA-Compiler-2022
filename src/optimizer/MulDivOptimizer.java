package optimizer;

import backend.Mips.*;
import backend.MipsGenerator;
import backend.RegAlloc;
import middle.Code.MidCode;
import middle.Symbol.Symbol;

import java.math.BigInteger;
import java.util.ArrayList;


public class MulDivOptimizer {
    //乘除优化
    //将与常数的乘除法转化为位移和加减法
    public static int max_N = 32;
    private MipsGenerator mipsGenerator;

    public MulDivOptimizer(MipsGenerator mipsGenerator) {
        this.mipsGenerator = mipsGenerator;
    }

    public class multiDiv {
        long num;
        int sh;
        int l;

        public multiDiv(long num, int sh, int l) {
            this.num = num;
            this.sh = sh;
            this.l = l;
        }
    }

    private static int clz(int i) {
        int n = 0;
        if (i == 0) return max_N;
        if ((i & 0xffff0000) == 0) {
            n += 16;
            i <<= 16;
        }
        if ((i & 0xff000000) == 0) {
            n += 8;
            i <<= 8;
        }
        if ((i & 0xf0000000) == 0) {
            n += 4;
            i <<= 4;
        }
        if ((i & 0xc0000000) == 0) {
            n += 2;
            i <<= 2;
        }
        if ((i & 0x80000000) == 0) {
            n += 1;
        }
        return n;
    }

    //判断是否为2的幂
    public static boolean isPowerOfTwo(int i) {
        if(i == 0) return true;
        return (i & (i - 1)) == 0;
    }

    //获取2的幂次
    public static int getPowerOfTwo(int i) {
        int n = 0;
        if (i == 1) return 0;
        while (i != 1) {
            i >>= 1;
            n++;
        }
        return n;
    }

    //获取绝对值
    public int abs(int x) {
        return x > 0 ? x : -x;
    }



    //将负数转化为32无符号整数
    public long getUnsigned(int x) {
        return x >= 0 ? x : (long) (x + 0x100000000L);
    }

    public multiDiv getMultiDiv(int d, int prec) {
        //要求1 <= d < 2^32
        int l = max_N - clz(d - 1);
        //low = 2 ^ (32+l) / d
        BigInteger big_low = BigInteger.valueOf(1).shiftLeft(32 + l).divide(BigInteger.valueOf(d));
        long low = big_low.longValue();
        //big_high = (2 ^ (32+l) + 2^(32+l-prec)) / d
        BigInteger big_high = BigInteger.valueOf(1).shiftLeft(32 + l).add(BigInteger.valueOf(1).shiftLeft(32 + l - prec))
                .divide(BigInteger.valueOf(d));
        long high = big_high.longValue();
        //System.out.println("d = " + d +  " low = " + low + " high = " + high + " l = " + l);
        while ((low >> 1) < (high >> 1) && l > 0) {
            low >>= 1;
            high >>= 1;
            --l;
        }
        //System.out.println("low = " + low + " high = " + high + " l = " + l);
        return new multiDiv(high, l, max_N - clz(d - 1));
    }

/*
    public ArrayList<MipsCode> generateCodeFromDiv(MidCode midCode) {
        //#<---- #T5@<1,0> = #T4@<1,0> DIV 7 ---->
        //addiu $v1, $zero, 7
        //div $a2, $v1
        //mflo $a3
        ArrayList<MipsCode> mipsCodes = new ArrayList<>();
        RegAlloc regAlloc = mipsGenerator.regAlloc;
        Symbol result = mipsGenerator.findSymbol(midCode.getResult());
        int result_reg = regAlloc.getRegOfSymbol(result, true, midCode);
        Symbol op1 = mipsGenerator.findSymbol(midCode.getOperand1());
        int op1_reg = regAlloc.getRegOfSymbol(op1, true, midCode);
        long d = getUnsigned(Integer.parseInt(midCode.getOperand2()));

        multiDiv multiDiv = getMultiDiv(d, max_N - 1);
        long m = multiDiv.num;
        int sh = multiDiv.sh;
        int l = multiDiv.l;
        if (isPowerOfTwo(d) && getPowerOfTwo(d) == l) {
            mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, regAlloc.getRegString(result_reg),
                    regAlloc.getRegString(op1_reg), l)));
        } else {
            assert m < 1 << max_N;
            //v1 = n_sign
            mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, "$v1",
                    regAlloc.getRegString(op1_reg), 31)));
            //v0 = EOR(n_sign, n);
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.or, "$v0",
                    "$v1", regAlloc.getRegString(op1_reg))));
            mipsCodes.add(new MipsCode("li $a1, " + m));
            mipsCodes.add(new MipsCode(new MulDivInstr(MulDivInstr.MDI.multu, "$v0", "$a1")));
            //a1 = q0
            mipsCodes.add(new MipsCode(new MoveInstr(MoveInstr.MI.mfhi, "$a1"))); //不考虑超过32位的情况
            //a1 = q0 >> sh
            if (sh > 0) mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.srl, "$a1", "$a1", sh)));
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.or, regAlloc.getRegString(result_reg), "$a1", "$v1")));
        }
        return mipsCodes;
    }*/

    public ArrayList<MipsCode> generateCodeFromMod(MidCode midCode) {
        //#<---- #T5@<1,0> = #T4@<1,0> DIV 7 ---->
        //addiu $v1, $zero, 7
        //div $a2, $v1
        //mflo $a3
        RegAlloc regAlloc = mipsGenerator.regAlloc;
        Symbol result = mipsGenerator.findSymbol(midCode.getResult());
        int result_reg = regAlloc.getRegOfSymbol(result, true, midCode);
        Symbol op1 = mipsGenerator.findSymbol(midCode.getOperand1());
        int op1_reg = regAlloc.getRegOfSymbol(op1, true, midCode);
        int d = Integer.parseInt(midCode.getOperand2());
        ArrayList<MipsCode> divCodes = generateCodeFromDiv(midCode);
        ArrayList<MipsCode> mipsCodes = new ArrayList<>(divCodes);
        mipsCodes.add(new MipsCode("li $v0, " + d));
        mipsCodes.add(new MipsCode(new MulDivInstr(MulDivInstr.MDI.mult, regAlloc.getRegString(result_reg), "$v0")));
        mipsCodes.add(new MipsCode(new MoveInstr(MoveInstr.MI.mflo, "$v0")));
        mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.subu, regAlloc.getRegString(result_reg), regAlloc.getRegString(op1_reg), "$v0")));
        return mipsCodes;
    }


    public ArrayList<MipsCode> generateCodeFromDiv(MidCode midCode) {
        //#<---- #T5@<1,0> = #T4@<1,0> DIV 7 ---->
        //addiu $v1, $zero, 7
        //div $a2, $v1
        //mflo $a3
        ArrayList<MipsCode> mipsCodes = new ArrayList<>();
        RegAlloc regAlloc = mipsGenerator.regAlloc;
        Symbol result = mipsGenerator.findSymbol(midCode.getResult());
        int result_reg =  regAlloc.getRegOfSymbol(result, true, midCode);
        Symbol op1 = mipsGenerator.findSymbol(midCode.getOperand1());
        int op1_reg =  regAlloc.getRegOfSymbol(op1, true, midCode);

        int d = Integer.parseInt(midCode.getOperand2());
        multiDiv multiDiv = getMultiDiv(abs(d), max_N -1);
        long m = multiDiv.num;
        int sh = multiDiv.sh;
        int l = multiDiv.l;
        if (abs(d) == 1) {
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.or, regAlloc.getRegString(result_reg),
                    regAlloc.getRegString(op1_reg), "$zero")));
        } else if (abs(d) == 1 << l) {
            //v1 = sra(n,l-1)
            mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, "$v1", regAlloc.getRegString(op1_reg),l-1 )));
            //v1 = srl(v1,N-l)
            mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.srl, "$v1", "$v1", max_N - l)));
            //v1 = n + v1
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", regAlloc.getRegString(op1_reg), "$v1")));
            //result = sra(v1, l)
            mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, regAlloc.getRegString(result_reg), "$v1", l)));
        } else if (m < (1L << (max_N - 1)) ) {
            //v1 = m
            mipsCodes.add(new MipsCode("li $v1, " + m));
            mipsCodes.add(new MipsCode(new MulDivInstr(MulDivInstr.MDI.mult, regAlloc.getRegString(op1_reg), "$v1")));
            mipsCodes.add(new MipsCode(new MoveInstr(MoveInstr.MI.mfhi, "$v1")));
            if(sh > 0) mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, "$v1", "$v1", sh)));
            //v0 = xsign(n);
            mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, "$v0",
                    regAlloc.getRegString(op1_reg), 31)));
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.subu, regAlloc.getRegString(result_reg), "$v1", "$v0")));
        } else {
            //v1 = m
            mipsCodes.add(new MipsCode("li $v1, " + (m - (1L << max_N) )));
            mipsCodes.add(new MipsCode(new MulDivInstr(MulDivInstr.MDI.mult, regAlloc.getRegString(op1_reg), "$v1")));
            mipsCodes.add(new MipsCode(new MoveInstr(MoveInstr.MI.mfhi, "$v1")));
            //v1  = n + mulsh(m - 2^N, n) >> sh
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.addu, "$v1", "$v1", regAlloc.getRegString(op1_reg))));
            if(sh > 0) mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, "$v1", "$v1", sh)));
            //v0 = xsign(n);
            mipsCodes.add(new MipsCode(new RIInstr(RIInstr.RII.sra, "$v0",
                    regAlloc.getRegString(op1_reg), 31)));
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.subu, regAlloc.getRegString(result_reg), "$v1", "$v0")));
        }
        if (d < 0) {
            mipsCodes.add(new MipsCode(new RRInstr(RRInstr.RRI.subu, regAlloc.getRegString(result_reg),
                    "$zero", regAlloc.getRegString(result_reg))));
        }
        return mipsCodes;
    }

}
