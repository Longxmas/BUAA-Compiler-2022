import fronted.Lexer.LexicalAnalyzer;
import fronted.Lexer.Token;
import fronted.Parser.CompUnit;
import fronted.Parser.CompUnitParser;
import fronted.error.errorTable;
import fronted.visitor.visitor;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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

    public static void main(String[] args) {
        String source = read("testfile.txt");
        LexicalAnalyzer lexer = new LexicalAnalyzer(source);
        ArrayList<Token> tokens = lexer.getAns();
        //System.out.println(tokens);
        CompUnit compUnit = new CompUnitParser(tokens).parseCompUnit();
        //System.out.println(compUnit);
        visitor buildVisitor = new visitor();
        buildVisitor.analyseCompUnit(compUnit);
        write(compUnit.toString(), "output.txt");
        write(errorTable.getInstance().toString(), "error.txt");
        write(buildVisitor.getMidCodeList().toString(), "20376208_龙泠锟_优化前中间代码.txt");
    }

}

