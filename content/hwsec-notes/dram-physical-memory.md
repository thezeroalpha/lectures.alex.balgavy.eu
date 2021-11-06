+++
title = 'DRAM (physical memory)'
+++

# DRAM (physical memory)
Memory requests:
1. Translate virtual address to physical address (MMU)
2. Check caches to see if location has been cached
3. If not, access DRAM via memory controller

DRAM = dynamic random access memory:
- last parallel bus: 64 bits bus for data, 72 with ECC
- organised in memory cells, 1-bit data
- each cell has 1 capacitor + 1 access transistor
- charge/discharge capacitor to store 1/0 bit value
- capacitors slowly discharge, so need periodic refresh (unlike SRAM)
    - refreshed typically every 8ms-64ms

Memory controller uses channels to talk to DRAM, each channel has a memory bus of 64 bits of data (set of pins to transfer info).
Multiple channels for bus-level parallelism

DIMMs are memory modules, 1 or more per channel.

Ranks are collection of on-DIMM chips, each works independently but only can use data bus at any given time. Memory operations are rank-level in nature.

Chips are in a rank, all are active during a memory request, providing different data (so data bus is partitioned across chips). They can be 2x, 4x, 8x (for the number of bits they provide).

Each chip has multiple banks, commonly 16 (DDR4).

Each bank has multiple rows, for example 64k rows. Access one row at a time in bank to serve memory request.

Each row has a number of columns, e.g. 1k columns with 1 byte per column. See row as logically spanning across all chips on given rank.

## Reading from and writing to DRAM
Row buffer of given bank logically spans across all chips in a rank. To read/write a row, need to first load it into row buffer ('activate' it). After activating a row, the original data is gone, only preserved in the row buffer.

1. Activate the row, placing it in the row buffer.
2. Read from all chips 1 byte at a time, takes 8 requests to get full cache line.
3. Precharge or row close to 'save' the data back to the row (maybe, depends on policy)
    - Open row policy
        - row kept open after access, optimizing for access locality
        - misses are more costly, need precharge
    - Closed row policy:
        - precharge after access
        - expect misses, eliminate precharge latency
    - Memory controllers also use proprietary policies

## DRAM address mapping
Physical address space != DRAM address space.

Memory controller decides mapping from physical to DRAM addresses, and the mapping has an impact on performance (and security).

## Side channel attacks on DRAM
Proprietary in DRAM subsystem:
- memory controller policies: precharge, refresh, scheduling
- physical to DRAM mapping
- data encoding on bus

Side channels need shared resource between different parties.

Timing side channel: "something" leaks depending on how fast the operation is
- operations on activated rows are fast
- operations on non-activated rows are slower, they need to be activated first (and others must be precharged)
- detecting import bits for bank selection: accessing alternating rows causes bank conflicts because of row buffer miss, must precharge + activate -- can find out which bits select bank
- can be done remotely, software-only. but cannot look at data bits, cannot easily reconstruct address selection functions.

You can also probe the bus directly using an oscilloscope, and send requests for very different physical addresses.
## Rowhammer
Works because of DRAM defect on memory modules.

Under certain conditions, the capacitors quickly leak charge, causing bits to flip.
All the attacker has to do from software is activate the same rows numerous times within a refresh interval.

If you repeatedly access row 0 and 2 in the same bank (aggressor rows), the capacitors in the middle row (row 1, victim row) leak charge and the data is corrupted.

Can be useful for e.g. privilege escalation, flipping bits in page tables.

Mitigations:
- hardware:
  - ECC memory: automatically correct bit flips
  - target row refresh: refresh neighboring rows of rows being hammered
- software:
  - disable features: pagemap for unprivileged users, disable DMA allocators, memory deduplication
  - other mitigations (ZebRAM, Drammer, Hammertime)

ECC memory:
- data bus has 72 bits instead of 64
- ECC bits have info for error correction
- ECC function is secret, part of memory controller
- figuring it out:
  - probe the pins -- possible, but expensive
  - inject errors on bus, monitor behavior of ECC implementation (choose pins to make sure that short-circuiting flips a bit)
  - using data patterns, recover full ECC function

## Cold boot attack
Threat model: stolen laptop, DRAM holds secrets

DRAM cells keep charge for a while even if not refreshed, especially if cold.

Steps:
1. Cool down DIMMs with a spray
2. Shut down laptop
3. USB-boot into malicious OS, or move DIMM
4. Read any sensitive data

Mitigation: data scrambling -- memory controller randomizes data encoding when writing data to DRAM.
## Address translation
MMU: multiple address spaces
- virtualize physical memory
- flexible memory management
- isolation and protection

Program the MMU using page tables.
Modern architectures use four-level page tables (PML4).
