#ifndef TESTER_H_INCLUDED
#define TESTER_H_INCLUDED

#include <iostream>
#include <string>
#include <bitset>
#include <cstdint>
#include <random>
#include <chrono>
#include <fstream>
#include <climits>

class Tester
{
public:
    Tester(std::string outFile, unsigned long nbTests=100);
    ~Tester();
    void generateTest(long codeOp);
    enum
    {
        LSL,
        LSR,
        ASR,
        ADD,
        SUB,
        ADDIMM,
        SUBIMM,
        MOVIMM,

        STR,
        LDR
    };

private:
    /// Shift_Add_Sub_Mov
    void generateLsl();
    void generateLsr();
    void generateAsr();
    void generateAdd();
    void generateSub();
    void generateAddImm();
    void generateSubImm();
    void generateMovImm();

    /// Load_Store
    void generateStr();
    void generateLdr();

    std::ofstream m_outFile;
    unsigned long m_nbTests;
    std::default_random_engine m_re;
    std::uniform_int_distribution<unsigned int> m_distribUnsigned{0, 4294967295};
};

#endif // TESTER_H_INCLUDED
