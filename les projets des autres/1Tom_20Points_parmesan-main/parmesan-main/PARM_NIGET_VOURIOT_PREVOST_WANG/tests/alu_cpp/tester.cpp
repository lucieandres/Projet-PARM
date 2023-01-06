#include "tester.h"

using namespace std;

Tester::Tester(string outFile, unsigned long nbTests)
{
    m_outFile.open(outFile);
    m_nbTests=nbTests;
    m_outFile << "A[32] B[32] Shift[5] CarryIn[1] Codop[4] S[32] Flags[4]" << endl << endl;
    m_outFile << "# A B Shift CarryIn Codop S Flags" << endl;
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
    case AND:
        generateAnd();
        break;
    case EOR:
        generateEor();
        break;
    case LSL:
        generateLsl();
        break;
    case LSR:
        generateLsr();
        break;
    case ASR:
        generateAsr();
        break;
    case ADC:
        generateAdc();
        break;
    case SBC:
        generateSbc();
        break;
    case ROR:
        generateRor();
        break;
    case TST:
        generateTst();
        break;
    case RSB:
        generateRsb();
        break;
    case CMP:
        generateCmp();
        break;
    case CMN:
        generateCmn();
        break;
    case ORR:
        generateOrr();
        break;
    case MUL:
        generateMul();
        break;
    case BIC:
        generateBic();
        break;
    case MVN:
        generateMvn();
        break;
    }
}

void Tester::generateAnd()
{
    m_outFile << "# AND" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int s=a&b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " 00000 " << "0 " << bitset<4>(AND) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "0" << "0" << endl;
    }
    m_outFile << endl;
}

void Tester::generateEor()
{
    m_outFile << "# EOR" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int s=a^b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " 00000 " << "0 " << bitset<4>(EOR) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "0" << "0" << endl;
    }
    m_outFile << endl;
}

void Tester::generateLsl()
{
    m_outFile << "# LSL" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re), shift=m_distribShift(m_re);
        unsigned int s=b<<shift;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << bitset<5>(shift) << " " << "0 " << bitset<4>(LSL) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateLsr()
{
    m_outFile << "# LSR" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re), shift=m_distribShift(m_re);
        unsigned int s=b>>shift;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << bitset<5>(shift) << " " << "0 " << bitset<4>(LSR) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateAsr()
{
    m_outFile << "# ASR" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int shift=m_distribShift(m_re);
        int s=b>>shift;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << bitset<5>(shift) << " " << "0 " << bitset<4>(ASR) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateAdc()
{
    m_outFile << "# ADC" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned short carry=m_distribCarry(m_re);
        int s=a+b+carry;
        unsigned long long sTest=(unsigned long long)((unsigned int)a) + (unsigned int)b + (unsigned int)carry;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << "00000" << " " << bitset<1>(carry) << " " << bitset<4>(ADC) << " " << bitset<32>(s) << " " << ((int)s < 0) << (s==0) << (sTest > ULONG_MAX) << /*((a >= 0 && b >= 0 && s < 0) || (a < 0 && b < 0 && s >= 0))*/ "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateSbc()
{
    m_outFile << "# SBC" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned short carry=m_distribCarry(m_re);
        int s=b-a+carry-1;
        unsigned long long sTest=(unsigned long long)((unsigned int)a) - (unsigned int)b + (unsigned int)carry - 1;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << "00000" << " " << bitset<1>(carry) << " " << bitset<4>(SBC) << " " << bitset<32>(s) << " " << ((int)s < 0) << (s==0) << /*(sTest > ULONG_MAX) << ((a >= 0 && b >= 0 && s < 0) || (a < 0 && b < 0 && s >= 0))*/ "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateRor()
{
    m_outFile << "# ROR" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int shift=m_distribShift(m_re);
        int s=_rotr(b, shift);
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << bitset<5>(shift) << " " << "0" << " " << bitset<4>(ROR) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateTst()
{
    m_outFile << "# TST" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int s=a&b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " 00000 " << "0 " << bitset<4>(TST) << " " << "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" << " " << ((int)s < 0) <<(s==0) << "0" << "0" << endl;
    }
    m_outFile << endl;
}

void Tester::generateRsb()
{
    m_outFile << "# RSB" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        int s=-a;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << "00000" << " " << "0" << " " << bitset<4>(RSB) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "0" << "0" << endl;
    }
    m_outFile << endl;
}

void Tester::generateCmp()
{
    m_outFile << "# CMP" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned short carry=m_distribCarry(m_re);
        int s=b-a;
        unsigned long long sTest=(unsigned long long)((unsigned int)a) - (unsigned int)b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << "00000" << " " << bitset<1>(carry) << " " << bitset<4>(CMP) << " " << bitset<32>(b) << " " << ((int)s < 0) << (s==0) << /*(sTest > ULONG_MAX) << ((a >= 0 && b >= 0 && s < 0) || (a < 0 && b < 0 && s >= 0))*/ "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateCmn()
{
    m_outFile << "# CMN" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned short carry=m_distribCarry(m_re);
        int s=a+b;
        unsigned long long sTest=(unsigned long long)((unsigned int)a) + (unsigned int)b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << "00000" << " " << bitset<1>(carry) << " " << bitset<4>(CMN) << " " << bitset<32>(b) << " " << ((int)s < 0) <<(s==0) << /*(sTest > ULONG_MAX) << ((a >= 0 && b >= 0 && s < 0) || (a < 0 && b < 0 && s >= 0))*/ "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateOrr()
{
    m_outFile << "# ORR" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int s=a|b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " 00000 " << "0 " << bitset<4>(ORR) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "0" << "0" << endl;
    }
    m_outFile << endl;
}

void Tester::generateMul()
{
    m_outFile << "# MUL" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        int s=a*b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " " << "00000" << " " << "0" << " " << bitset<4>(MUL) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "x" << "x" << endl;
    }
    m_outFile << endl;
}

void Tester::generateBic()
{
    m_outFile << "# BIC" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int s=b&(~a);
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " 00000 " << "0 " << bitset<4>(BIC) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "0" << "0" << endl;
    }
    m_outFile << endl;
}

void Tester::generateMvn()
{
    m_outFile << "# MVN" << endl;
    for(unsigned int i=0; i<m_nbTests; i++)
    {
        unsigned int a=m_distribUnsigned(m_re), b=m_distribUnsigned(m_re);
        unsigned int s=~b;
        m_outFile << bitset<32>(a) << " " << bitset<32>(b) << " 00000 " << "0 " << bitset<4>(MVN) << " " << bitset<32>(s) << " " << ((int)s < 0) <<(s==0) << "0" << "0" << endl;
    }
    m_outFile << endl;
}
