+++
title = 'Buffer Overflow'
+++

# Buffer overflow
A basic example of a buffer overflow:

```c
#include <stdio.h>
#include <string.h>
void hello(char *name) {
    char buf[16];
    strcpy(buf, name);
    printf("hello %s\n", buf);
}
int main(int argc, char **argv) {
    hello(argv[1]);
    return 0;
}
```

`buf` is limited to 16, but `strcpy` does not include that limit.
So writing more characters (length > 15) will overwrite the lower parts of the stack -- frame pointer, return address.

Three types of memory:
- stack: local (non-static) variables, grows downwards (i.e. push decrements stack pointer)
- heap: stores memory allocated by programmer via malloc, new, etc.
- global: stores global and static variables

In the code example, `buf` lives on the stack.

Stack frames:
- functions reserve part of stack for own use ("stack frame")
- contains:
    - return address: where to continue after return
    - frame pointer: where is caller's stack frame
    - local variables
    - other temp storage needed by compiler

So via this buffer overflow, the attacker can inject and run code, or run code already in the program.

Without optimisations, return address is always `%ebp+8`.
But we need to determine stack layout to see by how much we need to overflow buffer.

E.g.:
- target (return address): `%rbp+8`
- overflowable buffer: `%rbp-16`
- how many bytes before hitting the target: `(%rbp+8)-(%rbp-16) = 8 - -16 = 24`
