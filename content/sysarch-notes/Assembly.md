+++
title = 'Assembly'
+++
symbolic notation for machine language, improves readability
two syntaxes — Intel and AT&T

- Intel:
    - order
        - operation destination source
        - e.g. mov rax, 5
        - just like a=5
    - no decorations
- AT&T:
    - extra decorations like % in front of registers and $ in front of literal values
    - not very readable
    - order such as: mov 5, %rax

First four arguments: %rax, %rdi, %rsi, %rdx

When you write a subroutine, push the base pointer. Then set the base pointer to the stack pointer.

At the end of the subroutine, set the stack pointer to the base pointer. Then pop the base pointer. Then ret.

Syscall 60 is exit, 1 is write, 0 is read.
1 is stdout, 0 is stdin, 2 is stderr.

Registers store addresses. Parentheses are used to access value at address.
