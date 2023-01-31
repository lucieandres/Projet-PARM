import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class Main {
    static Finder finder = new Finder();
    static Instruction instruction = new Instruction();

    static File file;
    static BufferedWriter bw;
    static Map<String, Integer> labelToLine;
    static int cptline = 0;
    static int cptInstruct = 0;

    static String filePath = "C:\\Users\\bneuv\\Documents\\GitHub\\PARM\\PARM\\code_asm\\test_integration\\shift_add_sub_mov\\1-4_instructions.s";


    public static void main(String[] args) {
        file = new File(filePath);
        FileReader fr = null;
        int cptlineLTL = 0;
        int cptInstructLTL = 0;
        labelToLine = new HashMap<>();

        try {
            fr = new FileReader(file);
            BufferedReader br = new BufferedReader(fr);
            StringBuffer sb = new StringBuffer();

            String line;

            String filePathOut = filePath.substring(0, filePath.length() - 2) + ".bin";
            bw = new BufferedWriter(new FileWriter(filePathOut));

            System.out.println("Write in -> "+filePathOut);
            System.out.println("v2.0 raw");
            bw.write("v2.0 raw\n");

            while((line = br.readLine()) != null) {

                line = line.trim();
                line = line.replace("\t", " ");
                if (isLabel(line)) {
                    labelToLine.put(line.substring(0, line.length() - 1).toLowerCase(), cptInstructLTL);
                }
                cptlineLTL++;
                if (isLine(line)){
                    cptInstructLTL++;
                }
            }


            br = new BufferedReader(new FileReader(file));
            while ((line = br.readLine()) != null) {
                processLine(line);
                cptline++;
                if (isLine(line)){
                    cptInstruct++;
                }

            }
            fr.close();
            br.close();
            bw.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }


    private static boolean isLine(String line) throws Exception {
        if (line.isEmpty()) return false;
        line = line.trim();
        if (line.startsWith("@") || line.charAt(0) == '.' || line.startsWith("add r7") || line.startsWith("push") || line.startsWith("run:")) return false;
        return true;
    }

    private static boolean isLabel(String line) {
        if (line.isEmpty()) return false;
        if (line.charAt(0) == '.' && line.charAt(line.length() - 1) == ':') {
            return true;
        }
        return false;
    }

    private static void processLine(String line) throws Exception {
        line = line.trim();
        line = line.replace("\t", " ");
        if (isLine(line)) {
            String binaryString = Finder.decoder(line, labelToLine, cptline, cptInstruct);
            if (binaryString.length() != 16) {
                binaryString = "instruction de mauvaise longueur ("
                        + binaryString.length() + "): " + line + " ==> "
                        + binaryString + "\n";
            } else {
//                if (outputHex) {
                    int decimal = Integer.parseInt(binaryString, 2);
                    binaryString = Integer.toString(decimal, 16);
//                }
            }
            System.out.print(Instruction.addZeroInLeft(binaryString, 4) + " ");
            bw.write(Instruction.addZeroInLeft(binaryString, 4) + " ");
        }
    }
}

