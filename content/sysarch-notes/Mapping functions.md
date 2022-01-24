+++
title = 'Mapping functions'
+++
# Mapping functions
consider (with 16-bit addressable memory):
cache — 128 blocks of 16 words each = 2048 words (2K)
main memory — 4096 blocks of 16 words each = 64K words

valid bit — 0 when power first turned on. set to 1 when a memory block is loaded into a location. the processor only fetches data from a cache block if the valid bit is 1.

cache flushing — forcing all dirty blocks to be written back to memory

Direct mapping:

- block *j* of main memory is block *j* modulo 128 of cache
    - e.g. block 0, 128, 256… of memory is stored in cache block 0
    - e.g. block 1, 129, 257… of memory is stored in cache block 1
    - etc.
- replacement algorithm is trivial — placement of block is determined by its memory address (three fields tag, block, word)

Associative mapping:

- a main memory block can be placed into any cache block position
- 12 tag bits identify a memory block in the cache
- new block replaces an existing block only if cache is full
- more efficient use of space, but higher complexity because of need for parallel tag search (associative search)

Set-associative mapping

- blocks of cache are grouped into sets, mapping allows block of main memory to be in any block of a specific set
- gets rid of problem of contention because of a few choices for block placement
- hardware cost reduced because smaller associative search

## Replacement algorithms
LRU replacement algorithm

- overwrite least recently used block (the one that’s gone the longest without being referenced)
- cache controller must track references to all blocks

Random algorithm — quite effective in practice
