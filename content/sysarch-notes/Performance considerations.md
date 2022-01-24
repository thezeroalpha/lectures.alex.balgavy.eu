+++
title = 'Performance considerations'
+++
# Performance considerations
- price/performance ratio — common measure of success
- hit rate — number of hits as a fraction of all attempted accesses
- miss rate — number of misses as fraction of attempted accesses
- miss penalty — total access time seen by processor when miss occurs

improvements:

- larger cache (increased cost)
- larger block size (only effective up to a certain size, take longer to transfer)
- load-through approach reduces miss penalty
- implement cache on processor chip
- write buffer — temporary storage of write requests, then sent all at once to main memory
- prefetching data into cache
- lockup-free cache — let processor access cache while a miss is being serviced
