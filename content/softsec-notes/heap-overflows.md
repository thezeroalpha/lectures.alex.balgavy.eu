+++
title = 'Heap overflows'
+++
# Heap overflows
Stack-based buffer overflow relatively easy to exploit, because return address.
Integer overflow can bypass length checks.
Heap buffer overflows and format strings can provide arbitrary write.

Use-after-free and type confusion allow corrupting specific data.

Buffer overflows:
- most common, can exploit locally and remotely, modify both data and control flow
- typical signs: fixed-length buffers, passing pointer to buffer without size, array access without size check, pointer arithmetic without size/end pointer
- vulnerable functions:
    - gets() -- replace with fgets()
    - strcpy(),strcat() -- replace with strncpy() or strncat()
    - sprintf() etc. -- replace with snprintf() etc.
    - scanf() etc. -- put bound on %s formats

Off-by-one:
- wrong comparison operator, forget about strong terminator
- can only overwrite one element above array capacity

Pointer storage:
- pointer is integer storing a memory address
- in x86_64, only 48 least significant bits of 64-bit integer are used (so every pointer contains two null bytes)
- x86_64 is little endian, so least significant byte is stored first (lowest address)

Buffer overread:
- reading out-of-bounds can be just as harmful, and can also leak pointers (compromising ASLR)

Data/BSS overflows
- data has initialized global data, BSS uninitialized
- alternative ways of hijacking control:
    - overwrite function pointer
    - overwrite saved frame pointer (fake stack, then return from it)
    - overwrite C++ object pointer (e.g. hijack virtual functions)
- data-only alternatives:
    - changing strings to e.g. bypass authorization
    - changing integers, e.g. index and size variables to allow further overflows.
    - changing pointers

Heap overflows:
- malloc(), new, etc. return memory on heap
- harder to exploit, can't reach return addresses
- so, target metadata and/or heap massaging
- heap organisation:
    - grows towards higher memory addresses
    - memory management through in-band control structures (metadata between buffers), which can be manipulated through heap overflows to execute arbitrary code
    - attacks depend on implementation of malloc
    - heap divided in chunks
        - used chunk contains metadata and buffer returned by malloc
        - free chunk not currently used, but can be reused later
        - adjacent free blocks are merged to avoid fragmentation
- exploiting dlmalloc:
    - assume we find heap buffer overflow
    - overwrite fd and bk (requires free block)
    - make program call unlink, e.g. to merge block when previous block is freed
    - unlink writes chosen data at chosen location

exploiting arbitrary write:
- heap overflow/format string write to absolute address
- alternative: global offset table (GOT)
    - used to lazily load lib functions
    - address looked up and stored on first call
    - fixed location
