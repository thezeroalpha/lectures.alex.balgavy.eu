+++
title = "Parallelisation & OpenMP"
+++
# Parallelisation & OpenMP
architecture model from programmer perspective:
- share memory
- multiple processing units

program with multithreading.
one code, one data heap, multiple program counters, multiple register sets, multiple runtime stacks.
threads are provided by OS.

OpenMP:
- compiler directives, library functions, env variables
- ideal: automatic parallelisation of seq code
- but data dependencies are hard to assess, and compilers must be conservative
- so add annotations to sequential program for parallelisation
  - `#pragma omp name [clause]*`
  - `#pragma omp parallel { ... }`: parallelize code block
- for gcc, add `-fopenmp`
- control num threads with env variable `OMP_NUM_THREADS` or lib function `omp_set_num_threads(int)`

Loop parallelisation:
- have each thread compute some disjoint part of the vectors
- no data dependence between any two iterations. has to be true.
- pragma omp parallel divides the data among threads and synchronizes them
- directive must directly precede for-loop, for loop must match constrained pattern, trip-count of for-loop must be known in advance (when you reach the loop, not necessarily at compile time)
- private variables: one private instance for each thread, no comms between threads within parallel section or between parallel/sequential sections
- shared variables: one shared instance for all threads, comms betwe threads in parallel section and between parallel/sequential sections. concurrent access to this is problematic.
- can decide private/shared with clause: `#pragma omp parallel for private(i) shared(c, a, b, len)`
- loop-carried dependence: if you compute based on some updated values.

concurrent access is like a fridge in a shared apartment, your beers can disappear at any time for any reason.

race condition/data race: if behaviour of program depends on execution order of program parts whose temporal behaviour is beyond control
- a critical section is used to restrict thread interleaving, only one thread executes in critical section
- `#pragma omp critical { ... } `
- disadvantage: critical sections are synchronized. named critical sections (`#pragma omp critical {...}`) execute synced with other same name critical sections
- can use `reduction(+; sum)` clause in pragma instead
