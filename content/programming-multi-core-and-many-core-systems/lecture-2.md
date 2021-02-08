+++
title = "Lecture 2"
+++

Multi vs many core

CPU levels of parallelism
- Multi-core parallelism: task/data parallelism
    - 4-12 powerful cores, hardware hyperthreading
    - local caches
    - symmetrical/asymmetrical threading model
    - implemented by programmer
- Instruction-level:
- SIMD

Cores/threads:
- hardware multi-threading (SMT)
    - core manages thread context
    - interleaved: temporal multi-threading
    - simultaneous : co-located execution

GPU levels of parallelism:
- data parallelism
    - write 1 thread, instantiate a lot of them
    - SIMT (Single Instruction Multiple Thread) execution
    - many threads run concurrently: same instruction, different data elements
- task parallelism is 'emulated'
    - hardware mechanisms exist
    - specific programming constructs to run multiple tasks

usually connect GPU with host over PCI express 3, theoretical speed 8 GT/s (gigatransactions per second).

Why different design in CPU vs GPU?
- CPU must be good at everything, GPUs focus on massive parallelism
- CPU minimize latency experienced by 1 thread
- GPU maximize throughput of all threads

Locality: programs tend to use data and instructions with address near to those used recently

CPU caches:
- small fast SRAM-based memories
- hold frequently accessed blocks of main memory

Hardware performance metrics:
- clock frequency (GHz) - absolute hardware speed
- operational speed (GFLOPs) - operations per second, single and double precision
- memory bandwidth (GB/s) - memory operations per second
- power (Watt) - rate of consumption of energy

Main constraint for optimising compilers: do not cause any change in program behavior. So when in doubt, compiler must be conservative.


In-core parallelism:
- ILP: multiple instructions executed at some time, enabled by hardware (which CPU must provision)
- SIMD: single instruction on multiple data
