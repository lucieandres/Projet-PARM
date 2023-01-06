#include <iostream>
#include "tester.h"

using namespace std;

default_random_engine re;
uniform_int_distribution<int> distrib{-2147483648, 2147483647};

int main()
{
    Tester tester("C:\\Users\\thoma\\Documents\\travail\\polytech\\SI3\\archi\\tests\\test_alu.txt", 100);
    tester.generateTest(Tester::AND);
    tester.generateTest(Tester::EOR);
    tester.generateTest(Tester::LSL);
    tester.generateTest(Tester::LSR);
    tester.generateTest(Tester::ASR);
    tester.generateTest(Tester::ADC);
    tester.generateTest(Tester::SBC);
    tester.generateTest(Tester::ROR);
    tester.generateTest(Tester::TST);
    tester.generateTest(Tester::RSB);
    tester.generateTest(Tester::CMP);
    tester.generateTest(Tester::CMN);
    tester.generateTest(Tester::ORR);
    tester.generateTest(Tester::MUL);
    tester.generateTest(Tester::BIC);
    tester.generateTest(Tester::MVN);
    return 0;
}
