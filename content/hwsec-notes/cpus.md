+++
title = 'CPUs'
+++
# CPUs
## CPU caches
Caches: add fast-path access to memory
- shared across programs like memory
- great for performance, bad for security

Basic RELOAD attack: you can determine which function is being executed using a timing side channel -- a function that was already executed will be in the cache, so faster.

Important properties:
- size: three levels, with L1 smallest and L3 largest (shared across all cores)
- inclusivity: a line in level X also in X+1

Addressing:
- caches divided in sets, each address can only go to its own set
- cache line lookup on memory access:
  - if present, hit. if not, miss → fill it in.
  - if set full, replace
    - replacement policy: most often least recently used
    - reverse engineering the policy:
          - implement simulator for textbook replacement policies
          - run accesses through simulator & real caches
          - compare hit and misses to find best policy match
- indexing: policy to select target cache set given memory address
- tagging: how to select cache line within cache set given memory address
  - practical implementations use physical address to identify cache line in set (tag)
  - virtual address have problems: e.g. multiple virtual addresses map to single physical address, or vice versa
- L1: VIPT (virt index, phys tag), 64 sets, 8 ways. bits 6-11 decide the set, shared between virt and phys page.
- L2: PIPT, 1024 sets, 4 ways. bits 6-14 decide set
- L3: sliced PIPT, 2048 sets per core, 16 ways, bits 6-16 decide set
  - L3 is partitioned in slices, one per core, accessed via ring bus

## Timing cache attack
Threat model
- control of victim: measurement is synchronous, but assumes we can control and time when victim executes
- no control: fewer assumptions on attacker, but measurement is async

Flushing the cache: `clflush` (x86)
- flushes given memory location in entire cache hierarchy
- if attacker doesn't have access to target memory location, need more sophisticated cache eviction strategy

Observing cache activity: FLUSH+RELOAD
- threat model: victim and attacker share target code/data
- attacker can selectively flush a desired shared location from cache, then reload the target location
- measuring access times, can determine whether the victim accesses a memory address

## Cache attacks on hardware
for FLUSH+RELOAD, victim hardware unit must:
- use cache
- share memory with attacker-controlled software
- must access secrets

Rogue Data Cache Load (Meltdown): flush+reload attack
- user process accesses kernel memory location
- MMU raises exception and page fault handler kills off process
- but out-of-order execution (OoOE) read secret and filled cache line
- the reload 'sees' the filled cache line in the timing difference
- avoiding termination: transactional memory (TSX) suppresses exceptions, use that
- reducing noise: prefetcher in OoOE may fill extra cache lines, but usually doesn't operate across pages. also randomize accesses during reload state.
