+++
title = "Hashing"
template = "page-math.html"
+++

# Hashing

- hash tables are good for dictionaries
- keys starting at 0
- direct address table:

    $\text{keys} \in {0,…,m-1}$

    $T[k] = \begin{cases} \text{nil} & \text{if no item with key k}\\\\
    \text{pointer to element with key k} & \text{otherwise}\end{cases}$

    - insert: set value at key
    - delete: set value to nil
    - drawbacks: lots of memory, keys must be int
    - identity function key —> index
- for other purposes, change the mapping function
- simple example:
    - keys are first names, value phone number
    - hash function is name length mod 5
- choosing a hash function
    - division: k ➝ (k mod m)
        - easy but not good for all values
        - so better to take prime not close to power of 2
    - multiplication
- problem of collision: different keys hashed to same slot
    - for p items, hash table size m, so mp possibilities for hash function
    - $\frac{m!}{(m-p)!}$  possibilities for hashing without collision
- solving collisions
    - chaining: put items that hash to same value in a linked list
        - insertion in O(1)
        - deletion in O(1) for doubly-linked (you wouldn’t use singly linked)
        - searching in O(n) with n dictionary size, average in ϴ(1+α)
            - α is load factor
            - for n keys, m slots,

                $\alpha = \frac{n}{m}$

    - open addressing
        - make probe sequence: h: U × { 0…m-1} ➝ {0…m-1}
        - linear probing
            - for next probe, next address mod m
            - h(k,i) = h’(k) + i mod m
            - keep increasing i until empty place found
            - but you get clustering, and removal hurts on a physical level
        - double hashing, use two functions when the first function gives a collision
