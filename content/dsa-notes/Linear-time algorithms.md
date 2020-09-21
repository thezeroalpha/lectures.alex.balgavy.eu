+++
title = "Linear-time algorithms"
+++

# Linear-time algorithms

run faster than O(nlogn), but require special assumptions about input

## Counting sort

- assume input is in fixed range {0…k}
- count number of occurrences of each: from 0 to k
- time complexity in ϴ(n+k) for length n
    - k may absorb n and vice versa
- drawbacks: fixed range, requires space for array of length n

## Radix sort

- assume input is in fixed range of integers
- sorting numbers considered as tuples
- consider from least significant digit, sorting lexicographically
- if counting is used, time complexity ϴ(d(n+k)) with d being dimension

## Bucket sort

- assumes for correctness: keys in [0,1)
- assumes for time complexity: key uniform distribute over [0,1)
- has to be randomly uniformly distributed
- algorithm:
    - for n elements, make array of n empty buckets
    - for every array element a[i], insert a[i] into bucket[n*a[i]]
    - sort each bucket using insertion sort
    - concatenate all sorted buckets
- worst case: insertionSort is O(n²), so ϴ(n²)
- average case: ϴ(n)
- to improve worst case, don’t use insertion sort
