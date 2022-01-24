+++
title = 'Parallel programming'
+++
# Parallel programming
## Thread creation
how do we make processors participate in parallel execution?

when a single processor runs a program, there is one active thread of execution control

for a parallel program, you need independent tasks handled separately by multiple threads of execution control (one for each processor)

these threads are created explicitly, e.g. using a create_thread routine in a parallel programming library

## Thread synchronisation

how do we ensure that each processor finishes its task before the final result is computed?

several methods, usually implemented in library routines

e.g. barrier — force threads to wait until they all have reached a specific point in the program where there is a call to the barrier routine
