+++
title = 'Exam Review Notes'
+++
# Exam review notes
These are the notes I wrote while revising, sort of a summary of everything.

## Optimizing code on a single thread CPU:
- do computations/memory accesses once if repeatedly needed
- replace expensive operations with cheaper, e.g. `16*x` ⇒ `x << 4` (reduction in strength)
- inline functions (manually, or with compiler `-O1` and higher)
- use `restrict` if memory only accessed through one pointer

## In-core parallelism: SIMD vectorization
- same instruction across vector of data at once
- autovectorization with `-O2` and higher or specific flags, if
    - loop count doesn't change after it starts
    - no data dependencies (`#pragma GCC ivdep`)
- check compiler reports!
- data alignment leads to better performance
    - `float A[3] __attribute((aligned(16)))`
    - `#pragma vector aligned`
- hand-vectorize using intrinsics: unroll loop by intended SIMD width, then use vector operations
- locality: use low-stride memory accesses, reuse data, keep loop bodies small

## OpenMP (-fopenmp)
- loop parallelization if no data dependencies: `#pragma omp parallel for` (combines `parallel` and `for` pragmas)
- types of variables
    - private: one for each thread, no communication between threads
    - shared: one for all threads, communication between threads and sections
        - only loop variables of parallel loops are private
    - firstprivate: initialized with master thread value
    - lastprivate: value in last section propagated out
- data race: behavior depends on execution order of threads
- critical section: block of statements where only one thread runs at a time
     - all unnamed are synced, all with same name are synced
- reduction clause for sum, max, min, product, etc.
- if clause lets you conditionally parallelize if sufficient workload
- scheduling in loops:
    - static/block: loop divided into `nthreads` chunks
    - static size 1: iterations assigned to threads in round-robin ("cyclic")
    - static size n: loop divided into chunks of n iterations assigned in round-robin ("block-cyclic")
    - dynamic size n: loop divided into chunks of n iterations, assigned to threads on demand
    - guided size n: chunk size decreases exponentially with each assignment, chunks assigned on demand (n == minimum)
    - runtime: choose scheduling at runtime
- static preferable for uniform workload , dynamic otherwise (guided usually best)
- watch out for sync barriers!
- collapse clause collapses perfectly nested loops
- `#pragma omp parallel` starts/terminates threads, `for` doesn't
    - so have larger `parallel` blocks!
    - use `nowait` to get rid of barriers, e.g. `parallel` already has barrier
- `barrier` construct creates sync barrier where all threads wait
- `single` assigns block to one thread, with barrier after (unless `nowait`)
    - `master` assigns block to one thread, without sync barrier (unless `barrier`)
- `sections`: each `section` executed by exactly one thread, threads execute different code
- `threadprivate` vars: accessible like global, different for each thread
    - initialize to master value with clause `copyin`
- nested regions: new team of threads started, creator becomes master
- `#pragma omp task` spawns async task on block, original thread continues
    - wait for tasks with `#pragma omp taskwait`
- thread affinity
    - bind thread to place (core, usually hardware thread)
    - env variable `OMP_PLACES = "{0:4}, {4:4}, {8:4}, {12:4}` defines 4 places with 4 execution units
- busy wait vs suspension controlled via `OMP_WAIT_POLICY`
- atomic operations with `#pragma omp atomic read|write|update|capture`
    - no guarantees on operational behaviour
## Pthreads (-pthread)
- process terminates when initial thread terminates
- all threads terminate when initial thread terminates
- create with `pthread_create(...)`
- wait for termination with `pthread_join()` -- otherwise you get zombies
- attributes: `pthread_attr_init()`, `pthread_attr_destroy()`
    - joinable (default) or detached
    - process scope or system scope
        - process: library threads, more efficient, but process blocks on OS calls
        - system: kernel threads, scheduled by OS, but expensive context switches
- critical sections
    - mutexes: only one thread holds lock, only owner of lock can unlock
        - `trylock()` always returns, showing `EBUSY` if already locked
        - hierarchical locking: mutexes in ascending order, can only lock if all lower level locks are already held
    - condition variables: event-driven critical sections
        - allow threads to suspend & trigger other threads
        - suspend with `pthread_cond_wait()`
        - wake up one thread with `pthread_cond_signal` or all with `pthread_cond_broadcast`
    - spin locks: don't need to wake up, but consume resources while waiting
    - semaphores: wait until can decrement semaphore, or increment semaphore
        - no ownership, any thread can operate on semaphore
    - monitors: shared data & set of functions to manipulate it & mutex lock
    - reader-writer locks: allow concurrent read, exclusive write
    - problem with locking is low composability & priority inversion (when low priority thread holds lock, but doesn't make progress because low priority)
    - software transactional memory: write, check for concurrent writes, roll back and redo if needed
        - `__transaction_atomic { ... }`
        - must only contain code without side effects
    - thread-specific global data can be accessed from anywhere by thread
    - `pthread_once()` runs function at most once
    - `pthread_cancel()` cancels threads

## Common pitfalls
- utilisation of libraries: library functions may have hidden internal state
    - library interfaces should be re-entrant
    - functions should be mathematical, free of side effects
- dynamic memory management:
    - allocation expensive: access to shared heap must be synchronized (so one lock per malloc and free)
- false sharing
    - two threads frequently access independent unrelated data
    - independent data coincidentally mapped to nearby virtual addresses
- virtual memory management
    - ccNUMA: cache-coherent non-uniform memory access
    - memory page allocated close to processor that first accesses it

## GPU programming
- GPUs have many simple cores, little memory, little control
- sets of cores grouped into multiprocessors (SMs)

### CUDA: programming GPUs
- SIMT (single instruction multiple threads)
- parallelism:
    - thread processor runs thread
    - multiprocessor runs block of threads
    - device runs grid of blocks
    - grid == number of instances of kernel
- device code (GPU code) does computation
- host code (CPU code) instantiates grid, launches kernel, manages memory
- kernel function prefixed with `__global__`
- GPU-only function prefixed with `__device__`
- launch kernel: `kernelFunc<<<thread_blocks, threads_per_block>>>(args)`
    - geometry can be `dim3`
- built-in device code vars:
    - `dim3 gridDim`: grid dimension in blocks
    - `dim3 blockDim`: block dimension in threads
    - `dim3 blockIdx`: the block index in grid
    - `dim3 threadIdx`: the thread index in block
- global thread index: `(blockIdx.x * blockDim.x) + threadIdx.x`
- what;s the max? `cudaGetDeviceProperties()`
- memory operations
    - explicit:
        - allocate both CPU and GPU buffers
        - `cudaMalloc`, `cudaMemset`, `cudaFree`
        - `cudaMemcy`, last arg is enum stating copy direction
            - blocks CPU until copy done (unless `cudaMemcpyAsync()`)
            - doesn't start until all previous CUDA calls complete
    - managed/unified memory
        - allocate once with `cudaMallocManaged`

### Execution model
- GigaThread engine sends blocks to SMs (multiprocessors)
- blocks divided into warps of 32 threads
    - undefined block execution order, any should be valid
    - stalled warps immediately replaced (mainly when waiting on global memory)
- try to maximize occupancy: `(active warps)/(max active warps)`
    - each thread block consumes registers & shared memory
- threads in warp execute in lock-step (same instruction, different data)
- divergence: when threads do different things (worst case 1/32 performance)

### Memory spaces
- registers: stored in SM register file, not persistent after kernel ends
- constant: global `__constant__` variable
    - initialized with `cudaMemcpyToSymbol`
    - read-only for GPU, inaccessible for host
- global: `__global__`
    - set up by host with `cudaMalloc` and `cudaMemcpy`
    - persistent, values retained between kernels
    - not coherent: writes by other threads might not be visible
- unified memory: single coherent address space
    - `cudaMallocManaged`, no explicit copies needed
    - move data to GPU before it's needed: `cudaMemPrefetchAsync`
    - use 'advise' to establish data location
    - but is slower than manual management
- memory coalescing
    - group memory accesses into as few memory transactions as possible
    - stride 1 access patterns are best
- shared memory: `__shared__ type var`
    - size known at compile time
    - all threads in block see same memory (one per block)
    - not initialized, threads fill it
    - not persistent, data lost when kernel finishes
    - not coherent, have to `__syncthreads()`
    - L1 and shared memory allocated in same space, may need to configure
    - best to partition data into subsets and handle each subset with a block and its shared memory
- pinned memory may be good option for performance

### Shared variables
- use atomic to avoid data races (e.g. `atomicAdd`)
- best to limit their use because expensive

### Consistency & synchronization
- host-device
    - `cudaMemcpy` is blocking
    - kernel launch is not, use `cudaDeviceSynchronize`
- memory consistency
    - no ordering guarantees between warps and blocks
    - global and shared memory not consistent
    - `__syncthreads()` for block-level sync
    - global barrier only using multiple kernel launches

### CUDA streams
- sequence of operations
- default stream is synchronizing
- can create non-default streams: `cudaStreamCreate`, `cudaStreamDestroy`
- give as 4th geometry param at kernel launch
- sync one stream (`cudaStreamSynchronize`) or all streams (`cudaDeviceSynchronize`)

### CUDA events
- ways to query progress of work in stream (like markers)
- create and destroy: `cudaCreateEvent`, `cudaDestroyEvent`
- add event in stream: `cudaEventRecord`
- sync on event: `cudaEventSynchronize` (wait for everything before event to happen)
- query event: `cudaEventQuery`


