package frontend.error;

import java.util.ArrayList;
import java.util.Comparator;

public class errorTable {
    private final ArrayList<error> errors = new ArrayList<>();
    public final static errorTable Instance = new errorTable();

    private errorTable() {

    }

    public static errorTable getInstance() {
        return Instance;
    }

    public void addError(error error) {
        if (!errors.contains(error)) {
            errors.add(error);
        }
    }

    public ArrayList<error> getErrors() {
        return errors;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        errors.sort(Comparator.comparing(error::getLine));
        for (error e : errors) {
            sb.append(e).append('\n');
        }
        return sb.toString();
    }

}
