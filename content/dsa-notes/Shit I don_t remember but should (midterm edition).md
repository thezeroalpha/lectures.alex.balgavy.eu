+++
title = "Shit I don't remember but should (midterm edition)"
+++

# Shit I don't remember but should (midterm edition)

Worst-case complexities:

- O(n^2)
    - Bubblesort
    - Insertion sort
    - Quicksort — but very rare, average O(nlogn)
- O(nlogn)
    - Mergesort
    - Heapsort
- O(n+k) — k is range, n is number of elements
    - Counting sort
    - Bucket sort
- O(n)
    - Radix sort: O(d(n+k)), where d is dimension (number of digits)

Calculating recurrence equations:
1. Find T(n) in terms of i, base is i = 1 (not 0!!!)
2. Find n for T(n) to be 1
3. Calculate i in terms of n when T(n) is 1
4. Substitute i in T(n) and simplify

Priority queue can be done with max heap

Correctness

- Loop invariant, show:
    - Initialisation: true prior to first iteration
    - Maintenance: if true before iteration, remains true after iteration
    - Termination: when loop terminates, invariant gives useful property that helps show the algorithm is correct

Summations:

- ![](1f1c4ec570db9d8d636503b88c239f60.png)
- ![](85fc1da988814d4954ddabc21f3851b6.png)
