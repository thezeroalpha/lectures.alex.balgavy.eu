+++
title = 'Interrupt Handling & Scheduling'
+++
# Interrupt Handling & Scheduling

interrupt handling:
- deallocate CPU and give it to the scheduler. we rely on hardware-provided interrupt handling support (like a notification).
- allows scheduler to periodically get control whenever hardware generates an interrupt
- interrupt vector:
    - associated with each IO device and interrupt line
    - part of Interrupt descriptor table (IDT)
    - contains start address of OS-provided internal procedure
- interrupt handler continues execution
- interrupt types:
    - software: synchronous e.g. interrupt (int \$0x80)
    - hardware device: asynchronous, e.g. exceptions

The scheduler gets control every time an interrupt occurs. It acts as a mediator.

What happens?
1. Hardware puts program counter etc. on the stack
2. Hardware loads new program counter from interrupt vector
3. Assembly language procedure saves registers
4. Assembly language procedure sets up new stack
5. C interrupt service runs (e.g. reads and buffers input)
6. Scheduler decides which process is to run next.
7. C procedure returns to assembly code.
8. Assembly language procedure starts up new current process

A process can't give the CPU to another process (i.e. do a context switch) without going through the scheduler.
