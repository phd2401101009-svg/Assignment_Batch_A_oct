// IC151 — Lab A2, question 1: over-current protection
//
// Read one measurement and report the protection state.
// See README.md for the rules and the exact output.

#include <iostream>

int main() {
    double current = 0.0;
    double safeLimit = 0.0;
    int stopFlag = 0;
    std::cin >> current >> safeLimit >> stopFlag;

    // 1. Invalid data check (negative readings/limits or invalid flags)
    if (current < 0.0 || safeLimit <= 0.0 || (stopFlag != 0 && stopFlag != 1)) {
        std::cout << "INVALID\n";
    }
    // 2. Trip condition (emergency stop activated or current exceeds limit)
    else if (stopFlag == 1 || current > safeLimit) {
        std::cout << "TRIP\n";
    }
    // 3. Warning condition (current is within 90% to 100% of safe limit)
    else if (current >= 0.9 * safeLimit) {
        std::cout << "WARNING\n";
    }
    // 4. Normal operating state
    else {
        std::cout << "NORMAL\n";
    }

    return 0;
}
