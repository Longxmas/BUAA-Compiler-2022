package optimizer;

import middle.Code.MidCode;
import middle.Symbol.Symbol;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class BasicBlock {
    ArrayList<MidCode> midCodes = new ArrayList<>();
    ArrayList<BasicBlock> befores = new ArrayList<>();
    ArrayList<BasicBlock> afters = new ArrayList<>();
    HashSet<String> labels = new HashSet<>();
    HashSet<String> jumpToLabels = new HashSet<>();
    HashSet<Integer> genDefines = new HashSet<>();
    HashSet<Integer> killDefines = new HashSet<>();
    HashSet<Integer> inDefines = new HashSet<>();
    HashSet<Integer> outDefines = new HashSet<>();

    HashSet<Symbol> varDefines = new HashSet<>();
    HashSet<Symbol> varUses = new HashSet<>();
    HashSet<Symbol> activeIn = new HashSet<>();
    HashSet<Symbol> activeOut = new HashSet<>();
    int index;


    public BasicBlock(int index) {
        this.index = index;
    }

    public void addMidCode(MidCode midCode) {
        midCodes.add(midCode);
    }

    public ArrayList<MidCode> getMidCodes() {
        return midCodes;
    }

    public void addBefore(BasicBlock block) {
        if(!befores.contains(block)) befores.add(block);
    }

    public void addAfter(BasicBlock block) {
        if(!afters.contains(block)) afters.add(block);
    }

    public ArrayList<BasicBlock> getBefores() {
        return befores;
    }

    public ArrayList<BasicBlock> getAfters() {
        return afters;
    }

    public void addLabel(String label) {
        labels.add(label);
    }

    public HashSet<String> getLabels() {
        return labels;
    }

    public void addJumpToLabels(HashSet<String> jumpTo) {
        jumpToLabels.addAll(jumpTo);
    }

    public void addJumpToLabel(String jumpToLabel) {
        jumpToLabels.add(jumpToLabel);
    }

    public HashSet<String> getJumpToLabels() {
        return jumpToLabels;
    }

    public int getIndex() {
        return index;
    }

    public void addGenDefines(HashSet<Integer> genDefines) {
        this.genDefines.addAll(genDefines);
    }

    public void addKillDefines(HashSet<Integer> killDefines) {
        this.killDefines.addAll(killDefines);
    }

    public HashSet<Integer> getGenDefines() {
        return genDefines;
    }

    public HashSet<Integer> getKillDefines() {
        return killDefines;
    }

    public void setInDefines(HashSet<Integer> inDefines) {
        this.inDefines = inDefines;
    }

    public void setOutDefines(HashSet<Integer> outDefines) {
        this.outDefines = outDefines;
    }

    public HashSet<Integer> getInDefines() {
        return inDefines;
    }

    public HashSet<Integer> getOutDefines() {
        return outDefines;
    }

    public HashSet<Symbol> getVarDefines() {
        return varDefines;
    }

    public HashSet<Symbol> getVarUses() {
        return varUses;
    }

    public void setVarDef(HashSet<Symbol> symbols) {
        varDefines = symbols;
    }

    public void setVarUse(HashSet<Symbol> symbols) {
        varUses = symbols;
    }

    public void setActiveIn(HashSet<Symbol> activeIn) {
        this.activeIn = activeIn;
    }

    public void setActiveOut(HashSet<Symbol> activeOut) {
        this.activeOut = activeOut;
    }

    public HashSet<Symbol> getActiveIn() {
        return activeIn;
    }

    public HashSet<Symbol> getActiveOut() {
        return activeOut;
    }

}
