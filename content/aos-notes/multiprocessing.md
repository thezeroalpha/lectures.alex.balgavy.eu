+++
title = 'Multiprocessing'
+++
# Multiprocessing
## Process creation
### Fork
fork: creates new child process by duplicating calling process

Simple part:
- duplicate task: copy most info, with exceptions (e.g. PID)
- allocate and initialize new kernel stack: setup `thread_info`, copy trap frame and update
- and copy some other stuff

`copy_mm`:
- duplicate descriptor of address space of parent (`mm` descriptor): copy basic info, initialize empty address space (new page directory)
- duplicate address space: copy VMA info, page tables, and fix up page table entries
    - `MAP_SHARED`: share page frames
    - `MAP_PRIVATE (R)`: share page frames
    - `MAP_PRIVATE (R/W)`: copy-on-write page frames
    - shared memory: permissions of VMA are identical to permissions of PTE
    - COW: permissions of VMA are RW, permissions of PTE are read-only
        - duplicate page frme and remap new private copy into faulting PTE on demand

COW: copy on write, share the same resource until one copy is written to, at which point you duplicate the resource.
- `MAP_PRIVATE` file pages - dedupes binary pages
- `MAP_PRIVATE` anonymous forked pages - dedupes pages in process hierarchy
- `MAP_PRIVATE` anonymous forked pages - dedupes zero pages for unrelated processes

### Exec
Executes program pointed by filename.

implementation:
- input and permission checking
- load binary headers in memory
- find binary format
- flush old resources:
    - reinit `task_struct` and empty `mm`
    - flush VMAs, page tables, page frames
- load binary (binary-format specific)
    - parse headers and sections
    - create corresponding VMAs (data, text, stack, etc.)
    - update `%rsp` and `%rip` in trap frame
        - `%rsp` is top of user stack
        - `%rip`: program entry point for statically linked, dynamic linker's entry point for dynamically linked
    - page tables initially empty
        - even binary files are demand paged
        - PF handler maps them from cache using COW-based strategy

## Scheduling
easy version:
- hardware raises periodic timer interrupts
- timer interrupt handler invokes simple scheduler
- simple scheduler
    - FIFO scheduling queue
    - enqueue interrupted process at tail
    - dequeue process at heat and run on CPU

Time management:
- hardware offers clock and timer circuits
- clock circuits: expose counters incd at given frequency, can be used for time measurements and tracking time of day
- timer circuits: issue periodic interrupts at given frequency, can be used for scheduling and to implement timers

Linux clock sources:
- tsc: timestamp counter
- hpet: high-precision event timer
- acpi_pm: ACPI power management timer
- real time clock (RTC): persistent (battery-powered), low-precision (seconds)

Linux clock event devices:
- abstraction of timer circuit
- clock event device programmed to issue interrupts at `CONFIG_HZ` frequency
- both user and kernel preemption possible

Scheduling per-task building blocks:
- state: running, runnable, sleeping
- quantum or time slice: max number of jiffies a task can run on CPU
- priority
- scheduling policy: fair, real-time, etc.

Linux O(1) scheduler:
- preemptive round-robin priority scheduler
    - preemptive: uses timer interrupts to preempt execution of user processes and maybe reschedule before a process is done (when it runs out of its time-slice/quantum)
    - round-robin: goes around all processes
    - priority: some processes are more important
- maintains N run queues (1 per priority level)
- strategy:
    - find highest priority queue with runnable task
    - find first task on that queue and dequeue it
    - calculate its time slice size based on priority
    - run it
    - when time's up, enqueue
    - repeat
- improving fairness:
    - priorities adjusted based on sleep time
    - bonuses for IO vs CPU bound processes
- all operations are O(1)

Linux CFS scheduler:
- CFS: tasks get a completely fair CPU share
- with N tasks:
    - record how much CPU time each task has
    - schedule task with biggest delta to `tot_CPU_time/N`
        - always schedule the task that has spent least CPU time
    - virtualise time to deal with priorities
    - increase virtual runtime faster for lower-priority tasks
- no heuristics to distinguish tasks
- uses red-black tree instead of run queues

## IPC
communications, sync, signals

Shared mem:
- System V: get/create shmem segment by key, attach/detach

semaphores:
- counter shared across processes
- atomic wait (decrement), release (increment) if val >= -sem\_op

message queue:
- mailbox with senders and receivers
- get/create queue by key & permission
- block if queue full (on send) or empty (on receive)

POSIX: uses names instead of keys, thread safety, ref counting, shmem is file oriented
