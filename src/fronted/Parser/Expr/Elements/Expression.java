package fronted.Parser.Expr.Elements;

import fronted.Lexer.Token;

import java.util.ArrayList;

public class Expression<V> {
    private String name;
    private V firstSon;
    private ArrayList<V> sons = new ArrayList<>(); // 后面的子语法结构
    private ArrayList<Token> operators = new ArrayList<>();

    public Expression(String name, V firstSon, ArrayList<V> sons, ArrayList<Token> operators) {
        this.name = name;
        this.firstSon = firstSon;
        this.sons = sons;
        this.operators = operators;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(firstSon.toString());
        for (int i = 0; i < sons.size(); i++) {
            sb.append(this.name).append("\n"); // 输出自身的名字
            sb.append(operators.get(i).toString()); // 输出操作符
            sb.append(sons.get(i).toString());
        }
        sb.append(this.name).append("\n");
        return sb.toString();
    }

}
