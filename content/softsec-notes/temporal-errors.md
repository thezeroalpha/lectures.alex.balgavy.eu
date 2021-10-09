+++
title = 'Temporal errors'
+++
# Temporal errors
Main types:
- use after free
- uninitialized variables

## Use after free
Sometimes, program retains pointer to freed memory location ("dangling pointer")
- e.g. malloc buffer that was freed, or local variable buffer after function return

Future allocation/function call can re-use memory.

Sometimes, attacker can craft input to overwrite memory with own data:
1. Program allocs buffer or variable X
2. Program uses X to store some data
3. Program frees X
4. Program allocates buffer/variable Y overlapping with X
5. Data written to Y also overwrites relevant part of X
6. Program uses X, causing incorrect result

Useful to:
- bypass length restrictions for later buffer overflow
- overwrite fields that shouldn't be attacker-controlled
- overwrite validated data with incorrect data that will not be validated
- leak sensitive data from new buffer

## Double free
Free can't efficiently check block validity
- detects only some cases of double free
- undetected cases might corrupt metadata, useful for arbitrary write
- might free reused memory

## Uninitialized variables
Local variables and buffers not automatically initialized to zero.
Instead, contain whatever data happened to be on stack/heap before they were allocated.

Sometimes, attacker can craft input to initialize variable;
1. program allocates buffer/variable X
2. program uses X to store some data under attacker control
3. program frees X
4. program allocs buffer/variable Y overlapping X
5. program does not initialize (part of) Y, causing attacker's data from X to remain there
6. program uses Y causing incorrect result
