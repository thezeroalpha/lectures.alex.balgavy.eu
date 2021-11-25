+++
title = 'Defending firmware'
+++

# Defending firmware
Why is it difficult?
Lots of design constraints, so "low-hanging fruit" defenses may be omitted, and there might be unclear error handling strategies (you might not be able to rely on someone restarting the system).
Also, fragmented development process → unclear security guarantees, difficult patching process, reporting nightmare.
Finally, missing entropy sources for randomness, so security things (e.g. crypto) relying on entropy might be bypassable.

Traditional defenses:
- non-executable memory (NX):
  - standard feature in modern MMUs - but embedded systems may not have MMU
  - embedded "solution" is memory protection unit (MPU), with basic memory region protection features
- ASLR
  - implementations assume virtual address space, not possible without MMU
  - firmware often in ROM, so can't randomize for every execution, and compile-time randomization doesn't have same guarantees
  - MMIO & ROM & RAM at fixed addresses
- stack canaries
  - increases code size, stack size, run time -- direct opposition to design
  - typically static values, so simple to bypass

Adoption in practice:
- type-I firmware (based on general-purpose OS) mostly deploy standard defenses
- type-II firmware (based on custom embedded OS) rarely deploy standard defenses
- MMU/MPU not commonly available

Recent defenses:
- static binary sanitization:
  - static instrumentation to detect corruptions to enable fuzzing
  - based on static disassembly & binary rewriting
  - detects: null pointer deref, stack-based buffer overflow, heap buffer overflow, format string, double free
  - significant runtime and size increase
- return address integrity:
  - compiler-based backward-edge CFI
  - protects against overwriting return addresses, implemented on top of LLVM
  - requires MPU and exclusive general purpose register
  - table of return targets stored in RX memory, function ID stored in exclusive register, and ID is generated with call site-specific function key
  - little runtime overhead, but increase in size
- operation execution integrity
  - based on remote attestation
  - detects control-flow hijacking and critical data corruption
  - requires TrustZone for: measurement of control flow transfers and forwarding to verifier, storing copies of protected data
- HERA/hotpatching
  - not all firmware can be updated, patched firmware could have undesired side-effects
  - hotpatching means deploying patches while running
  - HERA -- uses flash patch and breakpoint unit (FPB), lets you divert control flow at specific addresses
