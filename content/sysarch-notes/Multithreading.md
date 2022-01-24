+++
title = 'Multithreading'
+++
# Multithreading
each process in the operating system has a thread

thread — thread of control whose state consists of contents of program counter and other processor registers (a specific process)

two or more threads can run on different processors, executing either same part of program on different data, or different parts of a program, or different programs

multitasking two or more programs on same processor

time slicing — OS selects process that’s not blocked and lets it run for a short period of time

context switching — OS selects a different process at the end of the time slice

timer interrupt — interrupt-service routine to switch from one process to another

hardware multithreading:

- processor has several identical sets of registers, each for a different thread
- this includes multiple program counters
- makes context switching simple & fast, just change a hardware pointer to use a different set of registers, in one clock cycle

coarse-grained multithreading: on a cache miss during Load/Store, switch to a different thread and continue fetching/executing other instructions

fine-grained/interleaved multithreading: switch threads after every instruction is fetched, increasing processor throughput
