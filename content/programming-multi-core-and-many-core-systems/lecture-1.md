+++
title = 'Lecture 1'
template = 'page-math.html'
+++

Programming shared address space concurrent systems:
- App-facing high-level approach: almost ordinary sequential program, add compiler directives to parallelise
    - structured parallelism, limited choice
- System-facing: explicitly multithreaded
- SIMD parallelism and vectorisation: single instruction, multiple data
    - extra long (vector) registers
    - store multiple values at once, apply same instruction to all values in vector
    - can be automatically vectorised by compiler, or use compiler intrinsics manually

Concurrency: tasks A and B are concurrent iff they can be performed independently of each other, yielding identical results.

Parallelisation patterns:
- decomposition:
    1. partition problem into concurrent subproblems
    2. Solve each sub-problem independently
    3. Combine partial solutions into solution of initial problem
- functional decomposition:
    1. Partition problem into mostly independent functional units
    2. Each functional unit has own implementation
    3. functional units communicate with each other
- pipelining
    - sequence of independent tasks
    - task receives input data and produces output (fifo buffers)
    - tasks are connected via streams (fifo buffers)
- domain (data structure) decomposition
    - problem dominated by manipulation of large data structure
    - decompose the data structure
    - let each process manipulate its own part of data
    - recombine data structure
- divide and conquer
    - task solved sequentially or recursively split into subtasks
    - fan-out defined by algorithm
    - subtasks computed independently
    - task waits for subtasks to finish
    - task combines partial result
    - only parent-child communication

Organisation principle: parallel supersteps
- spatial split into number of subtasks
- fan-out is runtime constant
- temporal split into supersteps
- subtasks independent within each step
- barrier sync between steps
- communication only between steps

How measure parallel performance?
- speedup: $S_{n} = \frac{T_{1}}{T_{n}}$
- T₁: exec time using 1 core
- $T_n$: exec time using n cores

Parallel program dev process:
1. formulate problem
2. write symbolic math specification
3. write sequential code
4. parallel code

Parallelisation does not affect asymptotic complexity, only adds a constant factor
