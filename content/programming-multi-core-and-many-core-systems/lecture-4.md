+++
title = 'Lecture 4'
+++

<!-- TODO: finish -->
problem: parallel execution incurs overhead (creation of worker threads, scheduling, waiting at sync barrier). so overhead must be outweighed by sufficient workload, i.e. loop body and trip count.

conditional parallelisation uses if clause: `#pragma omp parallel for if (len >= 1000)`. so you parallelise only at some threshold.

loop scheduling determines which iterations execute on which thread, aim is to distribute workload equally
- can use `#pragma omp parallel for schedule(<type> [, <chunk>])`, which selects out of set of scheduling techniques
- static/block scheduling: loop subdivided into as many chunks as threads with `#pragma omp parallel for schedule(static)`
- static scheduling with chunk size 1 (cyclic): iterations assigned to threads in round-robin fashion with `#pragma omp parallel for schedule(static, 1)`
- static scheduling with chunk size n
- dynamic scheduling: loop divided into chunks of n iterations, chunks dynamically assigned to threads on demand with `#pragma omp parallel for schedule(dynamic, n)`
    - requires additional synchronisation, more overhead
    - allows for dynamic load distribution


chunk size selection:
- small means good load balancing, high sync overhead
- large reduce overhead, but poor load balancing

guided scheduling:
- at start, large chunks so overhead is small (initial chunk size implementation dependant)
- when approaching final barrier, small chunks to balance workload (decreases exponentially with every assignment)
- chunks dynamically assigned to threads on demand
- `#pragma omp parallel for schedule(guided, <n>)`

runtime scheduling:
- choose scheduling at runtime
- `#pragma omp parallel for schedule(runtime)`


how do you choose a scheduling technique?
- depends on code
- is the amount of computational work per iteration roughly the same for each iteration?
    - static is preferable if yes
        - block cyclic scheduling may be useful for regular uneven workload distributions
    - dynamic preferable for irregular, guided is usually superior
