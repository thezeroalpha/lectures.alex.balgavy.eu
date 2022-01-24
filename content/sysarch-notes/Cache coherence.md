+++
title = 'Cache coherence'
+++
# Cache coherence
copies of shared data may be in several caches

when any processor writes to a shared variable its cache, other caches with a copy of that variable have to be informed of the change — cache coherence

whenever a block is in a shared state, the memory owns it

## Write-through protocol
two ways:

- update protocol — broadcast written data to caches of all processors in the system, each processor updates contents of affected cache
- invalidation protocol — broadcast invalidation requests to all processors in the system

## Write-back protocol
based on concept of ownership of a block of data in the memory

creates less traffic because writes only happen in cache (unlike write-through)

- at the start, memory owns all blocks and retains ownership if a block is read
- writing to a new block:
    - the requesting processor must become an exclusive owner of the block
    - all copies must be invalidated with a broadcast request
- reading a modified block
    - it’s sent by the current owner to the processor and the memory, ending up with two copies in two caches and the memory
    - subsequent requests for the same block are serviced by the memory module.
- writing to a modified block
    - current owner sends data to requesting processor, which becomes owner
    - old owner invalidates its cached copy
    - contents of memory are *not* updated, next request for the block is serviced by the new owner

## Snoopy caches
all transactions in a single-bus system occur through requests/responses on bus

snooping is observing all transactions on the bus through a controller circuit

if a processor broadcasts a read request for a block owned by a processor, the memory is not allowed to respond

the owner of the block snoops on the bus and sees the request, and asserts a signal on the bus that effectively tells the memory “hell nah bitch I got this”

then the owner broadcasts a copy of the block on the bus, marks its copy as unmodified, and the response is accepted by the processor that issued the read request.

the memory also reacquires ownership of the block and updates its copy (and its shared because there’s two copies in caches of two processors)

further requests are serviced by the memory.

if two processors have copies and both try to write to the same cache at the same time:

1. One of the processors gets to use the bus first, broadcasts an invalidation request, and becomes the owner

2. The other processor snoops and invalidates its copy

3. When other processor gets to use the bus, it broadcasts a read-exclusive request (read + invalidation request)

4. Owner snoops the read-exclusive request, provides a data response, and invalidates its copy (other processor becomes new owner)

an alternative in large shared-memory multiprocessors is directory-based cache coherence, where there are directories in each memory module which indicate which nodes can have copies of a given block

if a block is modified, the directory identifies node that is current owner
