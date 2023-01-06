#include "tester.h"

using namespace std;

void Tester::generateAndRegister()
{
    m_outFile << "# AND (Register)" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int flags=m_distribUnsigned(m_re), rm=m_distribUnsigned(m_re), rdn=m_distribUnsigned(m_re);
        m_outFile << "010000" << "0000" << bitset<3>(rm) << bitset<3>(rdn) << " "; //Instruction
        m_outFile << bitset<4>(flags); //Flags
        m_outFile << " x x 0 0 x "; //Clk, reset, carry, dp_shif, imm32_enable
        m_outFile << "xxxxx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0000 "; //imm5, ALU_code
        m_outFile << bitset<3>(rm) << " " << bitset<3>(rdn) << " " << bitset<3>(rdn) ; //Rm, Rn, Rd
        m_outFile << " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0 0 xxxxxxxxxxxxxxxx" << endl; //RAM_Addr, load, store, pc
    }
    m_outFile << endl;
}

void Tester::generateEorRegister()
{
    m_outFile << "# AND (Register)" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int flags=m_distribUnsigned(m_re), rm=m_distribUnsigned(m_re), rdn=m_distribUnsigned(m_re);
        m_outFile << "010000" << "0001" << bitset<3>(rm) << bitset<3>(rdn) << " "; //Instruction
        m_outFile << bitset<4>(flags); //Flags
        m_outFile << " x x 0 0 x "; //Clk, reset, carry, dp_shif, imm32_enable
        m_outFile << "xxxxx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0001 "; //imm5, ALU_code
        m_outFile << bitset<3>(rm) << " " << bitset<3>(rdn) << " " << bitset<3>(rdn) ; //Rm, Rn, Rd
        m_outFile << " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0 0 xxxxxxxxxxxxxxxx" << endl; //RAM_Addr, load, store, pc
    }
    m_outFile << endl;
}

void Tester::generateLslRegister()
{
    m_outFile << "# AND (Register)" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int flags=m_distribUnsigned(m_re), rm=m_distribUnsigned(m_re), rdn=m_distribUnsigned(m_re);
        m_outFile << "010000" << "0010" << bitset<3>(rm) << bitset<3>(rdn) << " "; //Instruction
        m_outFile << bitset<4>(flags); //Flags
        m_outFile << " x x 0 0 x "; //Clk, reset, carry, dp_shif, imm32_enable
        m_outFile << "xxxxx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0010 "; //imm5, ALU_code
        m_outFile << bitset<3>(rm) << " " << bitset<3>(rdn) << " " << bitset<3>(rdn) ; //Rm, Rn, Rd
        m_outFile << " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0 0 xxxxxxxxxxxxxxxx" << endl; //RAM_Addr, load, store, pc
    }
    m_outFile << endl;
}