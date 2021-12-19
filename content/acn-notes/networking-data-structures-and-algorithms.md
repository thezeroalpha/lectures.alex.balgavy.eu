+++
title = 'Networking data structures and algorithms'
+++

## Networking data structures and algorithms
Deciding if an element exists in a large set
- hashing: mapping data to fixed size values with a function
- hash function properties: deterministic, efficiently computable, minimize collisions
- modulo hashing: `h(x) = x % table_size`, with `table_size` a prime number
- handle collisions with separate chaining (linked list on each hash value), or open addressing (look for next open spot following a given strategy if collisions detected)
- bloom filter: use multiple hash functions to lower collision rate

Count occurrences for large set of elements:
- counting bloom filter: on insert, increment counters corresponding to hash values. on read, look up counters and take the minimum count (does not ensure correctness, only upper bound).
- count-min sketch: three hash functions, each mapped to array of counters. on insert, increment. on read, obtain minimum of all counters.

Find match on prefix of a string:
- Trie: binary tree whose nodes have part of the prefix
- PATRICIA trie: like radix trie, with radix 2
- direct trie: combine segments in entries
- hardware implementation in TCAM: hardware device that lets you match on set of records in constant time
