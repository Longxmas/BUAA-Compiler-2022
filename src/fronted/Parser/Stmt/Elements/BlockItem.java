package fronted.Parser.Stmt.Elements;

import fronted.Parser.Decl.Elements.Decl;

public class BlockItem {
    private Decl decl = null;
    private Stmt stmt = null;

    public BlockItem(Decl decl, Stmt stmt) {
        this.decl = decl;
        this.stmt = stmt;
    }

    public String toString() {
        if (decl != null) {
            return decl.toString();
        } else {
            return stmt.toString();
        }
    }
}
