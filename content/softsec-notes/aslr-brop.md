+++
title = 'ASLR BROP'
+++
# ASLR BROP
## Fine-grained ASLR
Randomize even relative addresses
- shuffle around (parts of) functions.
- rewrite functions: change registers, replace instructions, add random NOPs
- only possible at compile time, sharing (e.g. libraries) becomes difficult

Breaking with JIT-ROP:
- suppose attacker can leak single code pointer
- then:
    1. Recursively
        - use code pointers to read target code page (this is safe)
        - identify gadgets on that code page
        - leak code pointers on that page
    2. "Compile" ROP payload on the fly (Just In Time)

Side channel: crash/no-crash
- requirements: stack vulnerability and knowing how to trigger it, server process that respawns after crash

Blind Return-Oriented Programming (BROP):
1. Break ASLR
    - stack reading:
        - overwrite single byte with value X
        - no crash: stack had value X
        - crash: guess X was correct
    - three types of gadgets:
        - stop gadget: never crashes (always e.g. hangs)
        - crash gadgets: always crashes
        - useful gadget: crash depends on return
2. Leak binary:
    - remotely find enough gadgets to call write()
        - might be a BROP gadget: pop rbx, rbp, r12, r13, r14, r15, ret
            - at offset 0x7, yields pop rsi
            - at offset 0x9, yields pop rdi
            - finding it: a pop gadget will skip a crash gadget. so you can put 6 crash gadgets and a stop gadget on the stack, and the BROP gadget will not crash
        - `pop rdx; ret` is rare, look instead for strcmp, which sets rdx to length of string
        - find write and strcmp in PLT -- the jump table to external functions

    - write() binary from memory to network to disassemble and find more gadgets to finish the exploit
