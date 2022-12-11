import backend.MipsGenerator;
import frontend.Lexer.LexicalAnalyzer;
import frontend.Lexer.Token;
import frontend.Parser.CompUnit;
import frontend.Parser.CompUnitParser;
import frontend.error.errorTable;
import frontend.visitor.Visitor;
import middle.Code.MidCode;
import optimizer.BlockAnalyser;
import optimizer.DataFlowAnalyser;
import optimizer.PeepholeOptimizer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

public class Compiler {
    private static String read(String path) {
        File file = new File(path);
        byte[] bytes = new byte[(int) file.length()];
        try {
            new FileInputStream(file).read(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new String(bytes);
    }

    private static void write(String s, String path) {
        File file = new File(path);
        try {
            new FileOutputStream(file).write(s.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {
        String source = read("testfile.txt");
        LexicalAnalyzer lexer = new LexicalAnalyzer(source);
        ArrayList<Token> tokens = lexer.getAns();
        //System.out.println(tokens);
        CompUnit compUnit = new CompUnitParser(tokens).parseCompUnit();
        //System.out.println(compUnit);
        Visitor buildVisitor = new Visitor();
        buildVisitor.analyseCompUnit(compUnit);
        write(compUnit.toString(), "output.txt");
        write(errorTable.getInstance().toString(), "error.txt");
        write(buildVisitor.getMidCodeList().toString(), "20376208_龙泠锟_优化前中间代码.txt");

        ArrayList<MidCode> globalMidCodes = buildVisitor.getMidCodeList().getGlobalVarDefines();
        //优化中间代码
        PeepholeOptimizer peepholeOptimizer = new PeepholeOptimizer();
        DataFlowAnalyser dataFlowAnalyser = new DataFlowAnalyser();
        int i = 0;
        while(i++ < 10) {
            peepholeOptimizer.combineArithAssign(buildVisitor);
            peepholeOptimizer.deleteUselessCode(buildVisitor);
            dataFlowAnalyser.propagation(buildVisitor);
            dataFlowAnalyser.constFold(buildVisitor);
            dataFlowAnalyser.deadCodeElimination(buildVisitor);
            //dataFlowAnalyser.loopInvariant(buildVisitor);
        }
        globalMidCodes.addAll(buildVisitor.getMidCodeList().getMidCodes());
        buildVisitor.getMidCodeList().setMidCodes(globalMidCodes);
        write(buildVisitor.getMidCodeList().toString(), "20376208_龙泠锟_优化后中间代码.txt");

        MipsGenerator mipsGenerator = new MipsGenerator(buildVisitor, dataFlowAnalyser);
        mipsGenerator.calculateAddress();
        mipsGenerator.generateCode();
        write(mipsGenerator.getMipsCodes().toString(), "mips.txt");
    }

}

