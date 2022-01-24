+++
title = 'Cache memory'
+++
# Cache memory
very small, very fast

between processor and main memory, its there to be a wingman and make the main memory look good in front of the processor

locality of reference — many instructions in localised areas of the program are executed repeatedly during some time period

- temporal — recently executed is likely to be executed again soon
- spatial — instructions close to a recently executed instruction are likely to be executed again soon

basically, whenever some info is needed, it should be brought into the cache. and might as well grab data at adjacent addresses too.

cache block/line — set of contiguous address locations of some size

the mapping function specifies correspondence between main memory blocks and those in cache

replacement algorithm decides which blocks to remove to make space for a newly referenced word

cache hits

- processor issues read/write requests
- cache control circuitry determines if the requested word is in cache
- if read hit, data is read from cache & main memory is not involved
- if write hit, two options:
    - write-through — both cache and main memory are updated
    - write-back — update only cache location and mark block with an associated flag bit (dirty/modified bit), main memory is updated later

cache misses:

- read miss — the block containing the requested word is copied from main memory into cache, then the word is forwarded to the processor
    - load-through — alternative approach where word is sent to processor as soon as it’s read from memory. less waiting time for processor, more complex circuitry.
- write miss — info is written directly into main memory
