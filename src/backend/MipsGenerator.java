package backend;

import backend.Mips.MipsCode;
import backend.Mips.MipsCodes;
import frontend.visitor.visitor;
import middle.Code.MidCode;
import middle.Code.MidCodeList;
import middle.Symbol.FuncTable;
import middle.Symbol.Symbol;
import middle.Symbol.SymbolTable;
import middle.operand.Immediate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

public class MipsGenerator {
    private RegAlloc regAlloc = new RegAlloc();
    private MipsCodes mipsCodes = new MipsCodes();
    private MidCodeList midCodeList;
    private HashMap<String, Integer> globalArrayMap = new HashMap<>();
    private int globalSize = 0;
    public SymbolTable globalTable;
    private ArrayList<String> strCons;
    private HashMap<String, FuncTable> funcMap;
    private ArrayList<FuncTable> funcTables;
    public HashMap<String, SymbolTable> depth2SymbolTable;

    public MipsGenerator(visitor visitor) {
        this.midCodeList = visitor.getMidCodeList();
        this.globalTable = visitor.getGlobalTable();
        this.strCons = visitor.getMidCodeList().strCons;
        this.funcMap = visitor.getFuncMap();
        this.funcTables = visitor.getFuncTables();
        this.depth2SymbolTable = visitor.getDepth2Table();
    }

    public void calculateAddress() {
        for (FuncTable funcTable : funcTables) {
            funcTable.setStackSize();
            //System.out.println(funcTable.getName() + "  "+ funcTable.getStackSize());
        }
    }

    public MipsCodes getMipsCodes() {
        return mipsCodes;
    }

    public void generateCode() {
        globalArrayInit();
        globalVarInit();
    }

    private void globalArrayInit() {
        mipsCodes.addCode(new MipsCode(".data"));
        int addr = 0;
        for (Symbol symbol : globalTable.getSymbols()) {
            symbol.setAddress(addr);
            if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
                mipsCodes.addCode(new MipsCode("array_" + symbol.getName() + ": .space " + symbol.getArraySize() * 4));
                globalArrayMap.put(symbol.getName(), addr);
                addr += symbol.getArraySize() * 4;
            } else {
                addr += 4;
            }
            if (symbol.getName().indexOf('#') == -1) {
                globalSize += symbol.getSymbolType().equals(Symbol.SymbolType.Array) ? symbol.getArraySize() * 4 : 4;
            }
        }
        for (int i = 0; i < strCons.size(); i++) {
            mipsCodes.addCode(new MipsCode("str" + i + ": .asciiz " + strCons.get(i)));
        }
    }

    private void globalVarInit() {
        mipsCodes.addCode(new MipsCode(".text"));
        mipsCodes.addCode(new MipsCode("addi $gp, $gp, " + globalSize));
        ArrayList<Symbol> globalSymbols = globalTable.getSymbols();
        HashMap<String, Symbol> globalSymbolMap = new HashMap<>();
        for (Symbol symbol : globalSymbols) {
            globalSymbolMap.put(symbol.getName(), symbol);
        }
        for (MidCode midCode : midCodeList.getMidCodes()) {
            if (midCode.getOperator().equals(MidCode.Op.VAR_DEF) ||
                    midCode.getOperator().equals(MidCode.Op.CONST_DEF)) {
                //System.out.println(midCode);
                Symbol symbol = globalSymbolMap.get(midCode.getOperand1Name());
                mipsCodes.addCode(new MipsCode("<------- " + midCode + " ------->"));
                if (symbol.getSymbolType().equals(Symbol.SymbolType.Array)) {
                    System.out.println(symbol);
                    Integer offset = midCode.getOperand1Index();
                    if (offset != null && !Objects.equals(midCode.getOperand2(), "0")) {
                        mipsCodes.addCode(new MipsCode("li $t0, " + ((Immediate) symbol.getArrayInit().get(offset)).getValue()));
                        mipsCodes.addCode(new MipsCode("sw $t0, array_" +symbol.getName() + "+"+ offset * 4 + "($zero)"));
                    }
                } else if (symbol.getSymbolType().equals(Symbol.SymbolType.Var) &&((Immediate) symbol.getVarInit()).getValue() != 0) {
                    mipsCodes.addCode(new MipsCode("li $t0, " + ((Immediate) symbol.getVarInit()).getValue()));
                    mipsCodes.addCode(new MipsCode("sw $t0, " + (symbol.getAddress() - globalSize) + "($gp)"));
                }
            } else {
                break;
            }
        }
    }


}
