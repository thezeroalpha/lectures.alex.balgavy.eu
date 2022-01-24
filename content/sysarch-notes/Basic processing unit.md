+++
title = 'Basic processing unit'
+++
# Basic processing unit
## Organisation and basic processing cycle
Execution of complete instruction:
1. Fetch instruction

    - fetch instruction pointed to by PC, put it into IR (instruction register)
    - increment PC by number of bytes
    - decode IR and execute instruction specified in IR

2. Fetch operand
3. Perform operation

    - use memory operand / NOP

4. Store result

Components:

- CPU bus in the middle — means of communication between different components
    - connects every pair of components
    - bus width is based on the size of the word (bits), e.g. 32 or 64 depending on the ISA
    - bus can only transport that many bits max
    - every component can read at the same time
    - only one component can write at a certain time
- PC (program counter) — counts instructions, notes which is next
- Processor-memory interface — registers
    - Y register — internal, cannot be accessed
    - MAR (memory address register) — stores location of various data in memory
    - MDR (memory data register) — stores values (data) to be stored
    - IR (instruction register) — stores the next instruction
- Decoder — changes (decodes) an instruction into signals
- Register file (R0, R1, R2,…)
    - package multiple registers together
    - add single gates for input and output -> lower energy requirements
    - but with this, only one register can read/write the bus at a time.
    - so add another bus `¯\_(ツ)_/¯` energy requirement is the limit
- ALU — computes stuff

Register gating:

- controls who can access the bus
- Put gates before each component to control input/output

Register transfer (e.g. R1 to R3 — all happens at once):
1. Addr_out = R1
2. R_out
3. Addr_in=R3
4. R_in

Load from memory:
1. Ri_out, MAR_in, read
2. MDR_inE, WMFC
3. MDR_out, Ri_in

Store to memory:
1. Ri_out, MAR_in
2. Rj_out, MDR_in, write
3. MDR_outE, WMFC
