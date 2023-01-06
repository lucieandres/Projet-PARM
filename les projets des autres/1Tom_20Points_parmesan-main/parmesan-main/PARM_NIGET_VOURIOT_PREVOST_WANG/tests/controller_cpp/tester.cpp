#include "tester.h"

using namespace std;

Tester::Tester(string outFile, unsigned long nbTests)
{
    m_outFile.open(outFile);
    m_nbTests=nbTests;
    m_outFile << "Inst[16] Flags[4] Clk[1] Reset[1] Carry[1] DP_Shift[1] Imm32_Enable[1] Imm5[5] Imm32[32] ALU_Opcode[4] Rm[3] Rn[3] Rd[3] RAM_Addr[32] Load[1] Store[1] PC[16]" << endl << endl;
    unsigned int seed=std::chrono::system_clock::now().time_since_epoch().count();
    m_re.seed(seed);
    cout << "Check if random works: each time you should get a different number." << endl << m_distribUnsigned(m_re) << endl;
}

Tester::~Tester()
{
    m_outFile.close();
}

void Tester::generateTest(long codeOp)
{
    switch(codeOp)
    {
    case LSL:
        generateLsl();
        break;
    case LSR:
        generateLsr();
        break;
    case ASR:
        generateAsr();
        break;
    case ADD:
        generateAdd();
        break;
    case SUB:
        generateSub();
        break;
    case ADDIMM:
        generateAddImm();
        break;
    case SUBIMM:
        generateSubImm();
        break;
    case MOVIMM:
        generateMovImm();
        break;


    case STR:
        generateStr();
        break;
    case LDR:
        generateLdr();
        break;
    }
}
