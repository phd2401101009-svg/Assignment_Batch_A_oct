#!/bin/bash

# Color codes for output formatting
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "========================================"
echo " Running Automated Tests for Assignment "
echo "========================================"

FAILED=0

run_test() {
    local q_num=$1
    local src_file=$2

    echo -e "\n--- Testing Question $q_num ($src_file) ---"

    if [ ! -f "$src_file" ]; then
        echo -e "${RED}[FAIL] File $src_file not found.${NC}"
        FAILED=1
        return
    fi

    # Compile source file
    g++ -std=c++11 "$src_file" -o "q${q_num}_executable" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo -e "${RED}[FAIL] Compilation failed for $src_file.${NC}"
        FAILED=1
        return
    fi

    # Execute and check for exit status
    ./q${q_num}_executable > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[PASS] Question $q_num compiled and executed successfully!${NC}"
    else
        echo -e "${RED}[FAIL] Question $q_num encountered a runtime error.${NC}"
        FAILED=1
    fi

    rm -f "q${q_num}_executable"
}

# --- TEST QUESTION 1 ---
Q1_FILE=""
if [ -f "q1.cpp" ]; then Q1_FILE="q1.cpp"; elif [ -f "q1" ]; then Q1_FILE="q1"; fi
run_test "1" "$Q1_FILE"

# --- TEST QUESTION 2 ---
Q2_FILE=""
if [ -f "q2.cpp" ]; then Q2_FILE="q2.cpp"; elif [ -f "q2" ]; then Q2_FILE="q2"; fi
run_test "2" "$Q2_FILE"

# --- TEST QUESTION 3 ---
Q3_FILE=""
if [ -f "q3.cpp" ]; then Q3_FILE="q3.cpp"; elif [ -f "q3" ]; then Q3_FILE="q3"; fi
run_test "3" "$Q3_FILE"

echo -e "\n========================================"
if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}All checks passed successfully!${NC}"
    exit 0
else
    echo -e "${RED}Some tests failed. Please review your code.${NC}"
    exit 1
fi
