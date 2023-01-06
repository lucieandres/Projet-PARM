#ifndef TESTER_H_INCLUDED
#define TESTER_H_INCLUDED

#include <iostream>
#include <bitset>
#include <cstdint>
#include <random>
#include <chrono>
#include <fstream>
#include <climits>

class Tester
{
public:
    Tester(std::string outFile, unsigned long nbTests=20);
    ~Tester();
    void generateTest(long codeOp);
    enum
    {
        AND=0,
        EOR,
        LSL,
        LSR,
        ASR,
        ADC,
        SBC,
        ROR,
        TST,
        RSB,
        CMP,
        CMN,
        ORR,
        MUL,
        BIC,
        MVN
    };

private:
    void generateAnd();
    void generateEor();
    void generateLsl();
    void generateLsr();
    void generateAsr();
    void generateAdc();
    void generateSbc();
    void generateRor();
    void generateTst();
    void generateRsb();
    void generateCmp();
    void generateCmn();
    void generateOrr();
    void generateMul();
    void generateBic();
    void generateMvn();

    std::ofstream m_outFile;
    unsigned long m_nbTests;
    std::default_random_engine m_re;
    std::uniform_int_distribution<int> m_distribSigned{-2147483648, 2147483647};
    std::uniform_int_distribution<unsigned int> m_distribUnsigned{0, 4294967295};
    std::uniform_int_distribution<unsigned int> m_distribShift{0, 31};
    std::uniform_int_distribution<unsigned int> m_distribCarry{0, 1};
};

#endif // TESTER_H_INCLUDED
