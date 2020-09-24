+++
title = "Lecture 8: Defenses"
+++

# Lecture 8: Defenses
Some techniques available to make attacks harder.
Modern compilers and OSes implement several of them, some by default.

Stack canaries:
- value between local vars and return address, compiler adds initialization in function prologue
- check whether value is same before function returns, compiler adds check in function epilogue
- corrupting return address also corrupts canary
- attacker can:
    - jump over canary
    - overwrite canary with correct value after leaking it first

Data execution prevention
- OS marks data pages as non-executable (requires CPU feature no-execute bit, supported on all modern Intel/AMD CPUs)
- attempt to execute those pages causes segfault

W⊕X: write xor execute
- ensure no memory is both writable and executable
- prevents attacker from injecting code and executing it
- attacker can instead reuse existing code:
    - shared library functions (return to libc)
        - for example, write address of system(), ensure %rdi has pointer to shell command
        - easier in 32-bit as parameters are on stack
    - chain together parts of code into new program (Return Oriented Programming chains, where stack has addresses)

ASLR: address space layout randomization
- randomizes memory addresses of code, data, heap, stack
- prevents attacker from finding code pointer to overwrite, or knowing what to overwrite it with
- attacker can:
    - leak addresses
    - leak code and data to recover addresses
    - use side channels to recover complete address space layout
- only few bits are truly random, so try to brute force

