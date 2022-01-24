+++
title = 'Memory operations & instructions'
+++
# Memory operations & instructions
## Memory operations

to execute an instruction, processor control circuits have to cause word/words containing instruction to be transferred from memory to processor (with operands and results)

basic operations

- read — transfers copy of contents of memory location to processor
- write — transfers item of info from processor to a memory location

## RISC vs CISC instruction sets
(most processors have a compromise)

RISC (Reduced Instruction Set Computers)

- simple addressing modes
- each instruction fits in one word
- fewer instructions in set
- arithmetic/logic only on operands in processor registers
- load/store architecture: no direct transfer between memory locations, must be through processor register
- programs tend to be larger in size (more, simpler instructions)

CISC (Complex Instruction Set Computers)

- more complex addressing modes, e.g.:
    - autoincrement— access operand through effective address in passed register, then increment contents of said register
    - autodecrement — contents of passed register are decremented and then used as effective address of operand
    - relative — effective address is determined using index mode with PC instead of register
- instructions don’t have to fit into a single word
- more complex instructions
- arithmetic/logic also on both memory locations and registers
- not constrained to load/store architecture

## Instruction Execution

the processor has a program counter (PC) register, holds address of next instruction

processor circuits use info in PC to fetch and execute instructions in order of increasing address (straight-line sequencing)

executing an instruction

1. Instruction fetch — instruction fetched from mem location stored in PC and put in instruction register

2. Instruction execute — instruction is examined and the operation is performed, PC is incremented by 4.

branch instructions load new address into PC, allow conditional jumping (jump if greater/less than)
