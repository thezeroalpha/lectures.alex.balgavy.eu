+++
title = 'Lecture 5'
+++
## Finishing OpenMP
Controlling thread affinity

OpenMP thread binding:
- bind thread to place (core)
- once bound, thread does not migrate

OpenMP parallel proc_bind clause:
- `#pragma omp parallel proc_bind(master)`: whole team runs on same place as master
- `#pragma omp parallell proc_bind(close)`: whole team runs on place close to parent (`spread` is the opposite)

places:
- basic computing resource, usually hardware thread
- describe hierarchic system architecture to OpenMP
- env variable `OMP_PLACES`: "{0,1,2,3},{4,5,6,7},{8:4},{12:4}"
    - sets 4 places with 4 execution units
- the actual effect is implementation-dependent

busy-wait vs suspension:
- problem: threads wait all the time, at synchronisation barriers and critical sections
- busy wait: threads actively poll for some memory address, advantage is threads can quickly proceed when possible, but they waste resources while waiting
- suspension: threads de-schedule to waiting queue, so they don't occupy resources, but they have to wake up to be used
- use variable `OMP_WAIT_POLICY`, `ACTIVE` for mostly busy wait, `PASSIVE` for mostly suspension (but not every compiler might know)

Atomic operations:
- atomic operations can be mapped to hardware features, but can also be mapped to critical sections
- no guarantee on operational behaviour
- can still be expensive due to data transfer

So, OpenMP:
- simpler to use that system-facing approaches
- responsible for most organisational aspects
- facilitates experimentation with alternatives
- false directives can lead to wrong or nondeterministic behaviour
    - easy to write, hard to find
- insight into impact is reduced


---

## POSIX Threads
POSIX threads are low-level, system-facing.
Library-based (`pthread.h`), don't need a compiler that understands special directives.

Thread creation:
- only one thread at program startup
- all threads created dynamically
- threads may terminate before process
- process terminates when all threads terminate
- any thread can wait for termination of any other thread ("joining")
    - terminated threads are zombies until joined
- functions: `pthread_create`, `pthread_join`
- joinable can be joined, detached cannot be joined

Two classes of threads:
- library threads: OS unaware, whole process blocked when waiting for OS service, implementation can be more efficient
 OS/kernel threads: scheduled by OS together with other processes, pre-emptive multithreading, allows overlapping computation and waiting
