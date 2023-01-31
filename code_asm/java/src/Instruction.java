import java.util.ArrayList;
import java.util.List;

public class Instruction {
    static String S010000 = "010000";
    static String INSTR_ERROR = "Erreur instr. : ";

    public static List<String> instructionList(String instr) {
        List<String> arguments = new ArrayList<String>(List.of(instr.toLowerCase().split(" ")));

        for (int i = 0; i < arguments.size(); i++) {
            arguments.set(i, arguments.get(i).replace(",", "").replace("#", "").replace("r", ""));
        }
        return arguments;
    }

    public static List<String> labelList(String instr) {
        List<String> arguments = new ArrayList<String>(List.of(instr.toLowerCase().split(" ")));

        for (int i = 0; i < arguments.size(); i++) {
            arguments.set(i, arguments.get(i).replace(":", ""));
        }
        return arguments;
    }

    public static String addZeroInLeft(String str, int size) {
        if (str.length() >= size) {
            return str;
        }
        String sb = "";
        while (sb.length() < size - str.length()) {
            sb += "0";
        }
        sb += str;

        return sb;
    }

    public static String instructionCodopRdnRm(String line, String codop) throws Exception {
        List<String> args = instructionList(line);
        //                       rdn                                                                             rm
        return S010000 + codop + addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(2))), 3) + addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(1))), 3);
    }


    public static String instructionImm5RmRd(String line, String case2) throws Exception {
        if (case2.length() != 2) {
            return INSTR_ERROR + line;
        }
        List<String> args = instructionList(line);
        String Rd = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(1))), 3);
        String Rm = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(2))), 3);
        String imm5 = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(3))), 5);

        return "000" + case2 + imm5 + Rm + Rd;
    }

    public static String instructionRdImm8(String line, String case2) throws Exception {
        if (case2.length() != 2) {
            return INSTR_ERROR + line;
        }
        List<String> args = instructionList(line);
        String Rd = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(1))), 3);
        String imm8 = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(2))), 8);

        return "000" + case2 + Rd + imm8;
    }


    public static String addSub(String line, String registerImmediate, String addSub) throws Exception {
        if (registerImmediate.length() != 1 || addSub.length() != 1) {
            return INSTR_ERROR + line;
        }
        List<String> args = instructionList(line);

        if (args.size() == 4) {
            String Rd = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(1))), 3);
            String Rn = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(2))), 3);
            String Rm = addZeroInLeft(Integer.toBinaryString(Integer.parseInt(args.get(3))), 3);
            return "000" + "11" + registerImmediate + addSub + Rm + Rn + Rd;
        } else {
            return INSTR_ERROR + "(nb d'args mauvais) : " + line;
        }
    }

}
