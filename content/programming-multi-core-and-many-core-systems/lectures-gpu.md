+++
title = 'GPU programming'
+++

# GPU computing
GPUs are better performing, more power efficient, but not easy to program well/efficiently.

CPU:
- few complex cores
- lots of on-chip memory & control logic

GPU:
- many simple cores
- little memory & control

NVIDIA GPU architecture
- many slim cores, sets grouped into 'multiprocessors' with shared memory
- various memory spaces -- on-chip, off-chip global, separate CPU and GPU memories
- work as accelerators, with CPU as the host
- CPU offloads work to GPU, symmetric multi-threading
- execution model SIMT: single instruction, multiple threads (with hardware scheduler)

## Programming GPUs
- Kernel is the parallel program.
- Device code manages the parallel program.

Low level models: CUDA, OpenCL, and variations

CUDA:
- mapping of hardware into programming model
    - thread hierarchy that maps to cores, configurable at logical level
    - memory spaces mapping to physical memory spaces, usable through variable scopes and types
- symmetric multithreading: write code for single thread, instantiate as many as needed
- SIMT: single instruction on multiple threads at the same time
- thread hierarchy:
    - each thread executes same kernel code
    - one thread one core
    - threads grouped into thread blocks, where only those in same block can cooperate
    - all thread blocks logically organised in grid (1D/2D/3D). the grid specifies how many instances run the kernel
- parallelization for GPUs: map data/work to threads, write computation for 1 thread. organise threads in blocks, and blocks in grids.

CUDA program organisation:
- device code: GPU code, i.e. kernels and GPU functions
    - sequential, write for one thread & execute for all
- host code: CPU code
    - instantiate grid, run the kernel
    - handles memory management
- host-device communicate is explicit/implicit via PCI/e or NVLink

Example of code:

```c
// GPU kernel code
__global__ myKernel(int n, int *dataGPU) {
    myProcess(dataGPU);
}

// GPU device code
__device__ myProcess(int *dataGPU) {
    // code
}

// CPU code
int main(int argc, const char **argv) {
    myKernel<<<100, 10>>>(1000, myData);
}
```

Compiling CUDA:
- use nvcc
- separates source code into device code (GPU) and host code (CPU)

Execution flow loop:
1. GPU memory allocation
2. Transfer data CPU → GPU
3. CPU calls GPU kernel
4. GPU kernel executes
5. Transfer data GPU → CPU
6. GPU memory release

Creating a CUDA application
1. Identify function to offload
2. Determine mapping of operations and data to threads
3. Write kernels & device functions (sequential, per-thread)
4. Determine block geometry, i.e. threads per block and blocks per grid
5. Write host code: memory initialization, kernel launch, inspect results
6. Optimize kernels

GPU data transfer models
- explicit allocation and management: allocated twice, copied explicitly on demand, allows asynchronous copies
- implicit unified memory: allocated once, implicitly moved/copied when needed, potentially prefetched

## Example: vector add
First, the sequential code:

```c
void vector_add(int size, float *a, float *b float *c) {
    for (int i = 0; i < size; ++i) {
        c[i] = a[i] + b[i];
    }
}
```

What does each thread compute? One addition per thread, each thread uses different element. To find out which, compute mapping of grid to data.

Example with CUDA:

```c
// GPU kernel code
// compute vector sum c = a+b
// each thread does one pair-wise addition
__global__ void vector_add(float *a, float *b, float *c) {
    int i = threadIdx.x + blockDim.x * blockIdx.x; // mapping
    if (i<N) c[i] = a[i] + b[i];
}

// Host CPU code
int main() {
    N = 5000;
    int size = N * sizeof(float);
    float *hostA = malloc(size);
    float *hostB = malloc(size);
    float *hostC = malloc(size);

    // initialize A, B arrays

    // allocate device memory
    cudaMalloc(&deviceA, size);
    cudaMalloc(&deviceB, size);
    cudaMalloc(&deviceC, size);

    // transfer data from host to device
    cudaMemcpy(deviceA, hostA, size, cudaMemcpyHostToDevice);
    cudaMemcpy(deviceB, hostB, size, cudaMemcpyHostToDevice);

    // launch N/256 blocks of 256 threads each
    vector_add<<< N/256+1, 256 >>>(deviceA, deviceB, deviceC);

    // transfer result back from device to host
    cudaMemcpy(hostC, deviceC, size, cudaMemcpyDeviceToHost);

    cudaFree(deviceA);
    cudaFree(deviceB);
    cudaFree(deviceC);
    free(hostA);
    free(hostB);
    free(hostC);
}
```

With OpenACC:

```c
void vector_add(int size, float *a, float *b float *c) {
    #pragma acc kernels, copyin(a[0:n],b[0:n]), copyout(c[0:n])
    for (int i = 0; i < size; ++i) {
        c[i] = a[i] + b[i];
    }
}
```

## Execution model
### Task queue & GigaThread engine
Host: tasks for GPU pushed into queue ("default stream"), execute in order

Device: GigaThread engine manages GPU workload, dispatches blocks to multiprocessors (SMs)
- blocks divided into warps (groups of 32 threads)
- per SM, warps submitted to warp schedulers, which issue instructions

Scheduling: mapping and ordering application blocks on hardware resources

Context switching: swapping state and data of blocks that replace each other

Block scheduling:
- one block runs on one SM, to completion without preemption
- undefined block execution order, any should be valid
- same application runs correctly on SMs with different numbers of cores (performance may differ)

Warp scheduling:
- blocks divided into warps ("wavefronts" in AMD)
- threads in warp execute in lock-step
    - same operation in every cycle
- warps mapped onto cores, concurrent warps per SM limited by hardware resources
- undefined warp execution order
- very fast context switching, stalled warps immediately replaced. no fairness guarantee
- if all warps stalled, no instruction issued so performance lost
    - main reason is waiting on global memory
    - if need to read global memory often, maximize occupancy: active warps divided by max active warps
    - resources allocated for entire block
    - potential occupancy limiters: register usage, shared memory usage, block size
    - to figure out used resources, use compiler flags: `nvcc -Xptxas -v`
- divergence:
    - when each thread does something different, worst case is 1/32 performance
    - depends on if branching is data or ID-dependent. if ID, consider changing grouping of threads. if data, consider sorting.
    - non-diverging warps have no performance penalty, so here branches are not expensive
    - best to avoid divergence at warp-level with logical operators, lazy decisions, etc.

## Memory spaces
Multiple device memory scopes:
- per-thread local memory
- per-SM shared memory: each block has own shared memory, like explicit software cache, data accessible to all threads in same block
    - declared with e.g. `__shared__ float arr[128];`
    - not coherent, `__syncthreads()` required to make writes visible to other threads
    - good to use when caching pattern not regular, or when data reuse
- device/global memory: GPU frame buffer, any thread can use
    - allocated and initialized by host program (`cudaMalloc()`, `cudaMemcpy()`)
    - persistent, values re retained between kernels
    - not coherent, writes by other threads might not be visible until kernel finishes
- constant memory: fast memory for read-only data
    - defined as global variable: `__constant float speed_of_light = 0.299792458`, or initialize with `cudaMemcpyToSymbol`
    - read-only for GPU, cannot be accessed directly by host
- texture memory: read-only, initialized with special constructs on CPU and used with special functions on GPU
- registers store thread-local scalars/constant size arrays. stored in SM register file.

Unified/managed memory
- all processors see single coherent memory image with common address space
- no explicit memory copy calls needed
- performance issues with page faults, scheduling of copies, sync
- behaviour is hardware-generation dependent

avoid expensive data movement, keeping most operations on device including init.
prefetch managed memory when needed.
use explicit memory copies.

Prefetching: move data to GPU prior to needing it

Advise: establish location where data resides, only copy data on demand on non-residing device

Host (CPU) manages device (GPU) memory, and copies it back and forth.

Example with unified memory:

```c
__global__ void AplusB(int *ret, int a, int b) {
    ret[threadIdx.x] = a + b + threadIdx.x;
}

int main() {
    int *ret, i;
    cudaMallocManaged(&ret, 1000 * sizeof(int));
    AplusB<<< 1, 1000 >>>(ret, 10, 100);
    cudaDeviceSynchronize();
    for (i = 0; i < 1000; ++i) printf("%d ", host_ret[i]);
    cudaFree(ret);
}
```

Example with explicit copies

```c
__global__ void AplusB(int *ret, int a, int b) {
    ret[threadIdx.x] = a + b + threadIdx.x;
}

int main() {
    int *ret, i;
    cudaMalloc(&ret, 1000 * sizeof(int));
    AplusB<<< 1, 1000 >>>(ret, 10, 100);
    int *host_ret = malloc(1000 * sizeof(int));
    cudaMemcpy(host_ret, ret, 1000 * sizeof(int), cudaMemcpyDefault);
    for (i = 0; i < 1000; ++i) printf("%d ", host_ret[i]);
    free(host_ret); cudaFree(ret);
}
```

Memory coalescing
- combining multiple memory accesses into one transaction.
- group memory accesses in as few memory transactions as possible.
- stride 1 access patterns preferred.
- structure of arrays is often better than array of structures.
