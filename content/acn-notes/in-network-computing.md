+++
title = 'In-network computing'
+++

## In-network computing
### Implementing in-network caching service
Key-value storage that meets aggressive latency and throughput objectives efficiently.

Target workloads: small objects, read intensive, highly skewed and dynamic key popularity

Use PISA for key-value store:
- programmable parser: parse custom key-value fields in packet header
- programmable match-action pipeline
  - read and update key-value data
  - provide query statistics for cache updates

How to identify app-level packet fields:
- NetCache packet has some data - operation, sequence, key, value
- only top-of-rack switch needs to parse those fields

How to store and serve variable-length data on switches:
- use register array, fetch using index
- for variable, either use action data to hold indices, or multiple register arrays with same index
- two-level lookup: bitmap indicates arrays that store key's value, index shows slots in arrays to get value

Efficiently keep cache updated:
- cache hottest O(NlogN) items with limited insertion rate
- cached key: per-key counter array
- uncached key: count-min sketch (report new hot keys), bloom filter (remove duplicate hot key reports)

### Implementing in-network coordination service
In-network coordination is communication-heavy, not computation-heavy

Use set of coordination switches to run consensus protocol

NetChain design goals: high throughput, low latency, consistency, fault tolerance

Chain replication: consistency & fault tolerance
- storage nodes organized in chain structure
- handle operations: read from tail, write from head to tail

Because of replication, tolerates f-1 failures for f nodes.
