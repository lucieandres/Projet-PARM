import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Finder {


    static final String INSTR_ERROR = "Erreur instr. : ";
    static final String S010000 = "010000";
    static Instruction instruction = new Instruction();

    public static String decoder(String line, Map<String, Integer> dicoLabelline, int numberL, int numeroInstruction) throws Exception {
        line = line.replace("\t", " ");
        List<String> arguments = new ArrayList<String>(List.of(line.split(" ")));

        String instruction = arguments.get(0).toLowerCase();

        switch (instruction) {
            case "lsls":
                return lsls(line);
            case "lsrs":
                return lsrs(line);
            case "asrs":
                return asrs(line);
            case "adds":
                return adds(line);
            case "subs":
                return subs(line);
            case "cmp":
                return cmp(line);
            case "movs":
                return movs(line);
            case "ands":
                return ands(line);
            case "eors":
                return eors(line);
            case "adcs":
                return adcRegister(line);
            case "sbcs":
                return sbcRegister(line);
            case "rors":
                return rorRegister(line);
            case "tst":
                return tstRegister(line);
            case "rsbs":
                return rsbs(line);
            case "cmn":
                return cmn(line);
            case "orrs":
                return orrs(line);
            case "muls":
                return muls(line);
            case "bics":
                return bics(line);
            case "mvns":
                return mvns(line);
            case "str":
                return str(line);
            case "ldr":
                return ldr(line);
            case "add":
                return add(line);
            case "sub":
                return sub(line);
            case "b":
                return unconditionalBranch(line, dicoLabelline, numeroInstruction);
            case "beq":
                return beq(line, dicoLabelline, numeroInstruction);
            case "bne":
                return bne(line, dicoLabelline, numeroInstruction);
            case "bcs":
                return bcs(line, dicoLabelline, numeroInstruction);
            case "bhs":
                return bhs(line, dicoLabelline, numeroInstruction);
            case "bcc":
                return bcc(line, dicoLabelline, numeroInstruction);
            case "blo":
                return blo(line, dicoLabelline, numeroInstruction);
            case "bmi":
                return bmi(line, dicoLabelline, numeroInstruction);
            case "bpl":
                return bpl(line, dicoLabelline, numeroInstruction);
            case "bvs":
                return bvs(line, dicoLabelline, numeroInstruction);
            case "bvc":
                return bvc(line, dicoLabelline, numeroInstruction);
            case "bhi":
                return bhi(line, dicoLabelline, numeroInstruction);
            case "bls":
                return bls(line, dicoLabelline, numeroInstruction);
            case "bge":
                return bge(line, dicoLabelline, numeroInstruction);
            case "blt":
                return blt(line, dicoLabelline, numeroInstruction);
            case "bgt":
                return bgt(line, dicoLabelline, numeroInstruction);
            case "ble":
                return ble(line, dicoLabelline, numeroInstruction);
            case "bal":
                return bal(line, dicoLabelline, numeroInstruction);
            default:
                String message = "\ninstruction a besoin d'etre implémenté  : '" + line + "'";
                System.out.println(message);
                return message;
        }
    }

    public static String lsls(String line) throws Exception {
        if (line.contains("#")) {
            return lslImmediate(line);
        } else {
            return lslRegister(line);
        }
    }

    public static String lsrs(String line) throws Exception {
        if (line.contains("#")) {
            return lsrImmediate(line);
        } else {
            return lsrRegister(line);
        }
    }

    public static String asrs(String line) throws Exception {
        if (line.contains("#")) {
            return asrImmediate(line);
        } else {
            return asrRegister(line);
        }
    }

    public static String adds(String line) throws Exception {
        if (line.contains("#")) {
            List<String> args = instruction.instructionList(line);
            if (args.size() == 4) {
                return addImmediate3bits(line);
            } else if (args.size() == 3) {
                return addImmediate8bits(line);
            }
        } else {
            return addRegister(line);
        }
        return INSTR_ERROR + line;
    }

    public static String subs(String line) throws Exception {
        if (line.contains("#")) {
            List<String> args = instruction.instructionList(line);
            if (args.size() == 4) {
                return subImmediate3bits(line);
            } else if (args.size() == 3) {
                return subImmediate8bits(line);
            }
        } else {
            return subRegister(line);
        }
        return INSTR_ERROR + line;
    }

    public static String cmp(String line) throws Exception {
        if (line.contains("#")) {
            return cmpImmediate(line);
        } else {
            return cmpRegister(line);
        }
    }

    public static String add(String line) throws Exception {
        if (instruction.instructionList(line).size() == 4) {
            return addImmediate4args(line);
        }
        return addImmediate(line);
    }


    public static String beq(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0000", labeltoLine, numberL);
    }
    public static String bne(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0001", labeltoLine, numberL);
    }
    public static String bcs(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0010", labeltoLine, numberL);
    }
    public static String bhs(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0010", labeltoLine, numberL);
    }
    public static String bcc(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0011", labeltoLine, numberL);
    }
    public static String blo(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0011", labeltoLine, numberL);
    }
    public static String bmi(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0100", labeltoLine, numberL);
    }
    public static String bpl(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0101", labeltoLine, numberL);
    }
    public static String bvs(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0110", labeltoLine, numberL);
    }
    public static String bvc(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "0111", labeltoLine, numberL);
    }
    public static String bhi(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "1000", labeltoLine, numberL);
    }
    public static String bls(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "1001", labeltoLine, numberL);
    }
    public static String bge(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "1010", labeltoLine, numberL);
    }
    public static String blt(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "1011", labeltoLine, numberL);
    }
    public static String bgt(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "1100", labeltoLine, numberL);
    }
    public static String ble(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "1101", labeltoLine, numberL);
    }
    public static String bal(String line, Map<String, Integer> labeltoLine, int numberL) {
        return conditionalBranch(line, "1110", labeltoLine, numberL);
    }

    private static String lslImmediate(String line) throws Exception {
        return instruction.instructionImm5RmRd(line, "00");
    }

    private static String lsrImmediate(String line) throws Exception {
        return instruction.instructionImm5RmRd(line, "01");
    }

    private static String asrImmediate(String line) throws Exception {
        return instruction.instructionImm5RmRd(line, "10");
    }

    private static String addRegister(String line) throws Exception {
        return instruction.addSub(line, "0", "0");
    }

    private static String subRegister(String line) throws Exception {
        return instruction.addSub(line, "0", "1");
    }

    private static String addImmediate3bits(String line) throws Exception {
        return instruction.addSub(line, "1", "0");
    }

    private static String subImmediate3bits(String line) throws Exception {
        return instruction.addSub(line, "1", "1");
    }

    public static String movs(String line) throws Exception {
        if (line.contains("#")){
            return instruction.instructionRdImm8(line, "00");
        } else {
            line += ", #0";
            return instruction.instructionImm5RmRd(line, "00");
        }
    }

    private static String cmpImmediate(String line) throws Exception {
        return instruction.instructionRdImm8(line, "01");
    }

    private static String addImmediate8bits(String line) throws Exception {
        return instruction.instructionRdImm8(line, "10");
    }

    private static String subImmediate8bits(String line) throws Exception {
        return instruction.instructionRdImm8(line, "11");
    }


    public static String ands(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0000");
    }

    public static String eors(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0001");
    }

    private static String lslRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0010");
    }

    private static String lsrRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0011");
    }

    private static String asrRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0100");
    }

    public static String adcRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0101");
    }

    public static String sbcRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0110");
    }

    public static String rorRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "0111");
    }

    public static String tstRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1000");
    }

    public static String rsbs(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1001");
    }

    private static String cmpRegister(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1010");
    }

    public static String cmn(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1011");
    }

    public static String orrs(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1100");
    }

    public static String muls(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1101");
    }

    public static String bics(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1110");
    }

    public static String mvns(String line) throws Exception {
        return instruction.instructionCodopRdnRm(line, "1111");
    }

    public static String str(String line) throws Exception {
        List<String> args = instruction.instructionList(line);
        String rt = instruction.addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(1))), 3);
        String imm8ToParse;
        if (args.size() == 4) {
            imm8ToParse = args.get(3).replace("]", "");
        } else {
            imm8ToParse = "0";
        }
        String imm8 = instruction.addZeroInLeft(Integer.toBinaryString(Integer.parseInt(imm8ToParse) / 4), 8);
        return "1001" + "0" + rt + imm8;
    }

    public static String ldr(String line) {
        List<String> args = instruction.instructionList(line);
        String rt = instruction.addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(1))), 3);
        String imm8="";
        if (args.size() == 4) {
            imm8 = instruction.addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(3).replace("]", "")) / 4), 8);
        } else if (args.size() == 3) {
            imm8 = instruction.addZeroInLeft("", 8);
        }
        else return INSTR_ERROR + line;
        return "1001" + "1" + rt + imm8;
    }

    public static String sub(String line) throws Exception {
        List<String> args = instruction.instructionList(line);
        String imm7 = instruction.addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(2)) / 4), 7);
        return "1011" + "0000" + "1" + imm7;
    }

    private static String addImmediate(String line) {
        List<String> args = instruction.instructionList(line);
        String imm7 = instruction.addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(2)) / 4), 7);
        return "1011" + "0000" + "0" + imm7;
    }

    private static String addImmediate4args(String line) throws Exception {
        List<String> args = instruction.instructionList(line);
        String imm7 = instruction.addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(3)) / 4), 7);
        return "1011" + "0000" + "0" + imm7;
    }


    public static String conditionalBranch(String line, String cond, Map<String, Integer> labeltoLine, int numberL) {
        List<String> args = instruction.instructionList(line);
        if (args.size() != 2){
            return INSTR_ERROR + line;
        }

        String label = args.get(1);
        int lineLa = labeltoLine.get(label);

        int nCible = lineLa;
        int nSource = numberL;

        int calcul = nCible - nSource -3 ;
        String imm8;
        if (calcul < 0) {
            imm8 = instruction.addZeroInLeft(Integer.toBinaryString(calcul).substring(24), 8);
        } else {
            imm8 = instruction.addZeroInLeft(Integer.toBinaryString(calcul), 8);
        }
        return "1101" + cond + imm8;
    }

    public static String unconditionalBranch(String line, Map<String, Integer> labeltoLine, int numberL) {
        List<String> args = instruction.instructionList(line);
        if (args.size() != 2){
            return INSTR_ERROR + line;
        }

        String label = args.get(1);
        int lineLa = labeltoLine.get(label);

        int nCible = lineLa;
        int nSource = numberL;

        int calcul = nCible - nSource -3 ;
        String imm11;
        if (calcul < 0) {
            imm11 = instruction.addZeroInLeft(Integer.toBinaryString(calcul).substring(21), 11);
        } else {
            imm11 = instruction.addZeroInLeft(Integer.toBinaryString(calcul), 11);
        }
        return "11100" + imm11;
    }
}