+++
title = 'Binary search'
template = 'page-math.html'
+++
# Binary search
an efficient algorithm to search position of element in a *sorted list*

belongs to the “Divide and Conquer” strategy (divide into subproblems into smallest is solved, solve subproblems recursively, combine all solutions)

average faster than linear search

How it works:
works by comparing the search key K with the middle element A[m] of the list

middle element found by:
subtract array.length-1, divide by 2, round up

then:

- if $K>A[m]$, first half is eliminated
    - search goes on in the second half of the array
    - continues recursively
- if $K<A[m]$, second half is eliminated
    - search goes on in the first half of the array
    - continues recursively

Performance:

- Best case: 1 comparison
- Worst case: log₂(n+1) comparisons
- Average: ~log₂(n) comparisons

Time complexity:

- Best case: O(1)
- Worst case: O(log(n))
- Average: O(log(n))
