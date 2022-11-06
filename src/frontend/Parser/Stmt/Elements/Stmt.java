package frontend.Parser.Stmt.Elements;

public class Stmt {
    private Stmt parent;

    public void setParent(Stmt stmt) {
        this.parent = stmt;
    }

    public Stmt getParent() {
        return this.parent;
    }
}
