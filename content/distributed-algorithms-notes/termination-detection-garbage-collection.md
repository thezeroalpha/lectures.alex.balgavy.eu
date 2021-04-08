+++
title = 'Termination detection & garbage collection'
+++

# Termination detection
Termination detection in e.g. diffusing computations, workpools, deadlock detection, self stabilization.

Basic algorithm terminated if each process is passive (no sends/received), and no basic messages are in transit.

Control algorithm concerns termination detection and announcement.
Termination detection shouldn't influence basic computations.

## Dijkstra-Scholten algorithm
Centralised basic algorithm, undirected network.

Tree T is maintained with initiation p₀ as root, and includes all active processes.
Initially, T only has p₀.

cc(p) estimates number of children of process p in T.
- when p sends basic message, cc(p) += 1
- let this message be received by q
    - if q not yet in T, it joins T with parent p and cc(q) = 0.
    - if q already in T, it sends control message to p that isn't a new child of p. Upon receipt of this message, cc(p) -= 1
- when noninitiator q is passive and cc(q) == 0, it quits T and informs its parent that it's no longer a child
- when initiator p₀ is passive and cc(p) == 0, it calls Announce

## Shavit-Francez algorithm
Decentralised basic algorithm, undirected network.

Forest F of disjoint trees maintained, rooted in initiators.

Initially each initiator of basic algorithm constitutes tree in F
- when process p sends basic message, cc(p) += 1
- let this message be received by q
    - if q not yet in a tree in F, it joins F with parent p and cc(q) = 0
    - if q already in a tree in F, it sends control message to p that it isn't a new child of p. Upon receipt, cc(p) -= 1
- when noninitiator q is passive and cc(q) == 0, it informs its parent that it's no longer a child
- passive initiator p with cc(p) == 0 starts a wave, tagged with its ID. Processes in a tree refuse to participate, `decide` calls `Announce`

If a wave doesn't complete, another initiator for which tree not yet disappeared will start a wave.
Last tree to disappear will start a wave that completes.

## Rana's algorithm
Decentralised algorithm, undirected network.

Each basic message is acknowledged.
Lamport's logical clock provides control events with a time stamp.
Time stamp of process is highest time stamp of its control events so far (initially 0).

Let process p at time t become quiet, i.e. p is passive and all basic messages it sent have been acknowledged
- p starts a wave of control messages, tagged with t and p
- only processes that have been quiet from time ≤ t onwards take part in the wave
- if wave completes, p calls Announce

## Weight-throwing termination detection
Centralised basic algorithm, directed network.

Initiator has weight 1, noninitiators weight 0.

- When process sends basic message, it transfers part of its weight to this message.
- When a process receives a basic message, it adds the weight of this message to its own weight.
- noninitiator that becomes passive returns its weight to the initiator
- when initiator becomes passsive, and has regained weight 1, it calls Announce.

Problem with underflow, weight of process can become too small to be divided further
- solution 1: process gives itself extra weight and informs initiator of additional weight in the system (ack from initiator needed before extra weight can be used to avoid race condition)
- solution 2: process initiates weight-throwing termination detection sub-call, only returns its weight to initiator when it has become passive and the sub-call has terminated

## Safra's algorithm
Decentralised basic algorithm and directed network.

Each process maintaines an integer counter, initially 0.
- at each outgoing/incoming basic message, counter is increased/decreased
- at any time, sum of all counters in network is ≥ 0, and is exactly 0 iff no basic messages are in transit
- at each round trip, token carries sum of counters of the processes it has traversed

Processes colored white or black, initially white
- process receiving basic message becomes black
- when p₀ becomes passiv, it sends white token with sum 0
- noninitiator only forwards token when it's passive, adding its counter value to sum in the token
- when black process forwards the token, the process becomes white and the token black (and will stay black for the rest of the round trip)
- eventually token returns to p₀, who waits until it's passive and then adds its counter value to the sum in the token
    - of token and p₀ are white, and sum of all counters is 0, then p₀ calls Announce
    - else, p₀ sends white token with counter 0

# Distributed garbage collection
processes provided with memory.
objects carry pointers to local objects and references to remote objects

three operations by processes build or delete a reference
- creation: object owner sends pointer to another process
- duplication: process that isn't object owner sends reference to another process
- deletion: reference deleted at its process

## Reference counting
Tracks number of references to non-root object
- if it drops to zero, and no pointers to it, then object is garbage

Can be performed at runtime, but can't reclaim cyclic garbage.

## Indirect reference counting
Tree maintained for each object, with object at root, and references to this object as othe nodes in tree
- each object maintains counter how many references to it created
- each reference supplied with counter how many times it's been duplicated
- references keep track of their parent in tree (where they were created/duplicated from)

If process receives reference, but already holds reference to or owns this object, it sends back decrement.

When duplicated/created reference has been deleted, and its counter is zero, decrement is sent to process it was duplicated from (or owner).

When counter of object becomes zero, and no pointers to it, object can be reclaimed.

## Weighted reference counting
Each object carries total weight (weights of all references to the object) and a partial weight
- when reference created, partial weight of object divided over object and reference
- when reference duplicated, weight of reference divided over itself and copy
- when reference deleted, object owner is notified, and weight of deleted reference subtracted from total weight of the object

If total weight of object becomes eequal to its partial weight, and no pointers to the object, it can be reclaimed.

Underflow problem -- when weight of reference/object becomes too small to be divided further, no more duplicatation/creation possible
- solution 1: reference increases its weight and tells object owner to increase its total weight (ack from object owner to reference is needed before additional weight can be used to avoid race conditions)
- solution 2: process at which underflow occurs creates artificial object with new total weight, with reference to original object

duplicated references are then to artificial object, so references to original object become indirect.

## Garbage collection to termination detection
Garbage collection algorithms can be transformed into termination detection algorithms.

Given a basic algorithm.
Let each process p host one artificial root object O(p).
There is special non-root object Z.
- initially, only initiators p hold reference from O(p) to Z
- when process becomes passive it deletes its Z-refeference
- basic algorithm terminated iff Z is garbage

## Mark-scan
Two phases:
- traversal of all acessible objects, which are marked
- all unmarked objects are reclaimed

But in a distributed settings, mark-scan usually needs basic computation to freeze.

Mark-copy: second phase consists of copying all marked objects to empty memory space.

Mark-compact: second phase compacts all marked objects without requiring empty space.

## Generational garbage collection
In practice, most objects either reclaimed shortly after creation, or stay accessible for very long time.

Garbage collection in Java divides object into two generations
- garbage in young generation collected frequently with mark-copy
- garbage in old generation collected sporadically with mark-compact
