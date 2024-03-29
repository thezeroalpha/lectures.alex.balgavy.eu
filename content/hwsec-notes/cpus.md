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

## Cache attacks on hardware - out-of-order execution
for FLUSH+RELOAD, victim hardware unit must:
- use cache
- share memory with attacker-controlled software
- must access secrets

covert channel: both parties controlled by attacker

Rogue Data Cache Load (Meltdown): flush+reload attack
- user process accesses kernel memory location
- MMU raises exception and page fault handler kills off process
- but out-of-order execution (OoOE) read secret and filled cache line
- the reload 'sees' the filled cache line in the timing difference
- avoiding termination: transactional memory (TSX) suppresses exceptions, use that
- reducing noise: prefetcher in OoOE may fill extra cache lines, but usually doesn't operate across pages. also randomize accesses during reload state.

Mitigating Meltdown:
- KPTI: kernel page table isolation. don't map the kernel into user space, only some small part to switch to kernel space.
  - but very expensive -- better to fix in silicon

## Transient execution attacks
Branch prediction unit: avoids pipeline stalls using speculative execution
- pipeline stalls normally slow down execution
- speculative execution runs some instructions in a branch, which may be rolled back
- branch target buffer stores source addresses and history of the branch
- speculative execution can have many levels of nesting

After branch prediction:
- correct → retire after branch instruction
- misprediction → discard speculatively executed instructions
  - but does not revert microarchitectural state

Spectre v1: bounds check bypass
- train branch predictor at given program location to go to a specific branch
- flush data that controls the branch
- give the target branch an input that makes it go the other way
- you need a gadget that accesses data out of bounds and transfers it to a variable
- can generalize Meltdown -- leak from any array offset
- can suppress exception with branch misprediction

Mitigations for Spectre v1:
- `lfence` stops speculation
  - but: serializes all loads in pipeline, so costly up to 2x overhead (though there are optimizations)
  - other instructions stop speculation, e.g. instructions to toggle SMAP
- pointer/index masking on array access, so index can't go out of bounds
  - requires manual annotations in Linux kernel
- low-resolution timers (but attackers can find other timer, or amplify signal by repeating)
- process-based site isolation (different websites are in their own process)
  - assumes process isolation can't be breached

Spectre v2: branch target injection
- branch target buffer stores call target predictions (in another partition)
- train branch prediction for a certain path
- call in some context, the trained branch will be speculatively executed
- attacker can train predictor in their address space
- victim then mispredicts in their address space, calls into attacker-controlled address → ROP in speculative execution
- when e.g. address spaces don't overlap, can't easily train for specific virtual address. can still abuse collisions in branch target buffer
  - BTB uses a few bits in the virtual address to select an entry

Mitigations for Spectre v2:
- Intel initially released microcode update with instructions to partially flush BTB
  - OS vendors did not adopt it
- Retpoline: compiler-based, turns indirect calls into returns, predicted with Return Stack Buffer
  - goal: redirect speculation to safe landing pad
  - `ret` predictor assumes we are returning to first instruction after last call, which contains an infinite loop with an `lfence`
  - problems:
    - indirect calls don't actually speculate, which is slow
    - on recent microarchitectures, if RSB is empty, predictor uses BTB, enabling attacks
      - options: "stuff" RSB with special entries, or use eIBRS (BTB partitioned across privilege levels & hyperthreads)

Other applications of transient/speculative execution
- ExSpectre: craft shadow `memcpy` -- one that transfers memory between addresses, but its data flows are hidden in speculative execution
- BlindSide: BROP attack against kernel, buffer overflow without exceptions (suppressed by speculative execution)

## Advanced cache attacks
Limitations of flush+reload:
- need `clflush` instruction access (not in JavaScript or ARM)
- need shared memory, not in e.g. in-kernel Spectre
- relies on timing, not in e.g. sandbox forbidding access to timers
- causes cache misses on victim execution

Eviction-based attacks:
- goal: no `clflush` and shared memory
- monitor cache sets instead of cache lines, use 1 eviction set to monitor 1 victim cache set
  - eviction set: given a target cache set, it's a set of memory addresses that, if accessed, will evict any other entry in the set

Building eviction set for L1:
- 1 eviction set for each cache set in L1
- build eviction sets for all cache sets → can monitor L1 for victim accesses
- L1: 64 sets (within 4KB page, we have 64 cache lines, each belonging to different color (cache set)).
- 8 ways (we need 8 4KB pages, need to access first cache line of these pages to fill entire red cache set).

Building an eviction set for L2:
1. Allocate large pool of pages (large enough to cover all cache sets and ways of target cache)
2. Pick page P from pool
3. Check that accessing first cache line of all other pages evicts first cache line of P
4. Pick page Q from pool and remove it. See if pool without Q still evicts P. If yes, remove Q from pool.
5. Keep removing pages until pool has exactly 4 members. This is eviction set for P (64 sets).
6. Try this again with page that eviction set for P doesn't does not evict to find another eviction set.

In L1 and L2, cache sets will be striped throughout memory.
But because L3 is sliced, the distribution will be chaotic.
However, the same eviction set algorithm also works for L3, because no assumptions are made on physical addresses.

Prime+probe attack:
- attacker does not control victim, code/data not shared
- steps:
  1. Prime: Build L3 eviction sets for victim locations. Walk all eviction sets corresponding to cache sets the attacker wants to monitor. This puts the cache in a known state.
  2. Victim accesses cache set
  3. Probe: walk eviction set, check for speed. If slow, the attacker knows the cache set was accessed.

Evict+time:
- attacker controls victim, code/data not shared
- less noisy -- we can control execution of victim
- steps:
  1. Build L3 eviction sets for victim locations. Walk all eviction sets corresponding to cache sets the attacker wants to monitor.
  2. Craft input to interface (e.g. RPC) to talk to victim and create execution of victim that performs secret-dependent computation
  3. Time execution of victim under its control, and if slow, the victim accessed the cache set
- as an attack against the MMU, trigger page table walk of MMU and time the accesses
  - MMU accesses CPU caches because address translation is frequent and costly
  - AnC needs to trigger victim page table walks, at least flush TLB (evict entries in TLB with eviction sets)
