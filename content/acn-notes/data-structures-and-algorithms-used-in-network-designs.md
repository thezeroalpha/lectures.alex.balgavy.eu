+++
title = 'Data structures and algorithms used in network designs'
+++
# Data structures and algorithms used in network designs
## How to quickly decide if element exists in a large set
Used in tasks involving membership detection:
- access control list (decides if IP address is in blocklist)
- IP multicast (decides if router port should replicate packet)
- load balancer (decides if source IP has been assigned to server)

Trivial solutions:
- unordered list, linear search. O(n) time.
- ordered list, binary search. O(log n) time.

Hashing:
- map data to fixed-size values with function
- hash table indexed by hash values, 1-to-1 mapping
- constant O(1) time, just computing a function
- problems: hash collision -- multiple data entries mapped to same hash value
- choosing good hash functions: deterministic (always same value for same key), efficiently computable, minimize collisions
  - modulo hashing: $h(x) = x % table_size$, with $table_size$ a prime number
    - with non-uniformly distributed data, data sharing factors with $table_size$ will be hashed to same values → use prime numbers, which have least factors
    - other hash functions, e.g. MD5, SHA256
- handling hash collisions:
  - data structure that resolves hash collisions
    - separate chaining: create list of keys that map to same hash value
    - open addressing: shift values following a given strategy when a collision happens. when trying to find(x), hash and keep looking for x using the strategy until an empty slot is found.
    - cuckoo hashing: use two hash functions to generate two possible slots for each key, use two hash tables
    - bloom filter

## How to efficiently count occurrences for large set of elements
Counting bloom filter:
- increment counters corresponding to hash values on insert
- on read, look up counters corresponding to hash values with minimum count

Count-min sketch:
- three hash functions, each mapped to array of counters (hash tables)

## How to quickly find match on prefix of a string
Trie: a binary tree where nodes have a part of the prefix

PATRICIA trie: radix trie with radix 2

Direct trie: combine segments in entries

TCAM: hardware implementation
- supports matching on set of records in constant time
