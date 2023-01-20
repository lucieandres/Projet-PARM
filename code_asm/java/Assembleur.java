import java.io.File;

public class Assembleur {
    File file;
    public static void main(String[] args) {

    }

    public String decoder(String line, Map<String, Integer> dicoLabelline, int numeroline, int numeroInstruction) throws Exception {
        line = line.replace("\t", " ");
        List<String> arguments = new ArrayList<>(List.of(line.split(" ")));

        String instruction = arguments.get(0).toLowerCase(Locale.ROOT);

        switch (instruction) {
            case "lsls":
                return Instruction.lsls(line);
            case "lsrs":
                return Instruction.lsrs(line);
            case "asrs":
                return Instruction.asrs(line);
            case "adds":
                return Instruction.adds(line);
            case "subs":
                return Instruction.subs(line);
            case "cmp":
                return Instruction.cmp(line);
            case "movs":
                return Instruction.movs(line);
            case "ands":
                return Instruction.ands(line);
            case "eors":
                return Instruction.eors(line);
            case "adcs":
                return Instruction.adcRegister(line);
            case "sbcs":
                return Instruction.sbcRegister(line);
            case "rors":
                return Instruction.rorRegister(line);
            case "tst":
                return Instruction.tstRegister(line);
            case "rsbs":
                return Instruction.rsbs(line);
            case "cmn":
                return Instruction.cmn(line);
            case "orrs":
                return Instruction.orrs(line);
            case "muls":
                return Instruction.muls(line);
            case "bics":
                return Instruction.bics(line);
            case "mvns":
                return Instruction.mvns(line);
            case "str":
                return Instruction.str(line);
            case "ldr":
                return Instruction.ldr(line);
            case "add":
                return Instruction.add(line);
            case "sub":
                return Instruction.sub(line);
            case "b":
                return Instruction.unconditionalBranch(line, dicoLabelline, numeroInstruction);
            case "beq":
                return Instruction.beq(line, dicoLabelline, numeroInstruction);
            case "bne":
                return Instruction.bne(line, dicoLabelline, numeroInstruction);
            case "bcs":
                return Instruction.bcs(line, dicoLabelline, numeroInstruction);
            case "bhs":
                return Instruction.bhs(line, dicoLabelline, numeroInstruction);
            case "bcc":
                return Instruction.bcc(line, dicoLabelline, numeroInstruction);
            case "blo":
                return Instruction.blo(line, dicoLabelline, numeroInstruction);
            case "bmi":
                return Instruction.bmi(line, dicoLabelline, numeroInstruction);
            case "bpl":
                return Instruction.bpl(line, dicoLabelline, numeroInstruction);
            case "bvs":
                return Instruction.bvs(line, dicoLabelline, numeroInstruction);
            case "bvc":
                return Instruction.bvc(line, dicoLabelline, numeroInstruction);
            case "bhi":
                return Instruction.bhi(line, dicoLabelline, numeroInstruction);
            case "bls":
                return Instruction.bls(line, dicoLabelline, numeroInstruction);
            case "bge":
                return Instruction.bge(line, dicoLabelline, numeroInstruction);
            case "blt":
                return Instruction.blt(line, dicoLabelline, numeroInstruction);
            case "bgt":
                return Instruction.bgt(line, dicoLabelline, numeroInstruction);
            case "ble":
                return Instruction.ble(line, dicoLabelline, numeroInstruction);
            case "bal":
                return Instruction.bal(line, dicoLabelline, numeroInstruction);
            default:
                String message = "\ninstruction a besoin d'etre implémenté  : '" + line + "'";
                System.out.println(message);
                return message;
        }
    }
}

public static class Instruction {

    public String lsls(String line) {
        return null;
    }

    

}