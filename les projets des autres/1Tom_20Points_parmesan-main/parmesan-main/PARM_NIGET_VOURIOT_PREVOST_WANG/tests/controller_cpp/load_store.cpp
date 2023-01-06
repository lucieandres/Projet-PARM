#include "tester.h"

using namespace std;

void Tester::generateStr()
{
    m_outFile << "# STR" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int imm8=m_distribUnsigned(m_re), rt=m_distribUnsigned(m_re);
        m_outFile << "10010" << bitset<3>(rt) << bitset<8>(imm8) << " ";
        m_outFile << "0000 0 0 ";
        m_outFile << "0 0 0 " << "00000" << " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx xxxx ";
        m_outFile << bitset<3>(rt) << " " << "xxx" << " " << "xxx" << " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0 1 xxxxxxxxxxxxxxxx" << endl;
    }
    m_outFile << endl;
}

void Tester::generateLdr()
{
    m_outFile << "# LDR" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int imm8=m_distribUnsigned(m_re), rt=m_distribUnsigned(m_re);
        m_outFile << "10011" << bitset<3>(rt) << bitset<8>(imm8) << " ";
        m_outFile << "0000 0 0 ";
        m_outFile << "x 0 0 " << "xxxxx" << " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx xxxx ";
        m_outFile << "xxx" << " " << "xxx" << " " << bitset<3>(rt) << " xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx x x xxxxxxxxxxxxxxxx" << endl;
    }
    m_outFile << endl;
}
