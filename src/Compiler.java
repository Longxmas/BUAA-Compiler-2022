import Lexer.LexicalAnalyzer;
import Lexer.Token;
import Parser.CompUnit;
import Parser.CompUnitParser;

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
        CompUnit compUnit = new CompUnitParser(tokens).parseCompUnit();
        //System.out.println(tokens);
        System.out.println(compUnit);
        write(compUnit.toString(), "output.txt");
    }

}

