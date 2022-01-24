+++
title = 'Instruction execution'
+++
# Instruction execution
LOAD (e.g. Load R5, X(R7))
1. Fetch instruction, increment PC
2. Decode instruction, read contents of R7
3. Compute effective address
4. Read memory source operand
5. Load operand into destination R5

STORE (e.g. Store R6, X(R8))
1. Fetch instruction, increment PC
2. Decode instruction, read R6 and R8
3. Compute effective address of X+[R8]
4. Store contents of R6 into memory location X+[R8]
5. No action

Arithmetic & Logic (e.g. Add R3, R4, R5)
1. Fetch instruction, increment PC
2. Decode instruction, read contents of R4, R5
3. Compute sum [R4] + [R5]
4. No action
5. Load result into destination R3
