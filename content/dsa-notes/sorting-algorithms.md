+++
title = "Sorting algorithms"
template = "page-math.html"
+++

# Sorting algorithms

Specification:

- input: finite sequence, usually array starting at index 1
- output: ordered permutation (ascending)

Properties:

- comparison-based: based on comparisons of elements
    - for these, lowest worst case is Ω(nlogn)
    - this can be proved using decision trees
    - can do better using linear algorithms for specific inputs
- in-place: use space for input plus a constant amount of extra space
- stable: keep order of equal elements (could lead to space issues if it doesn’t happen)
- efficient: what’s the best we can do?

Theta notation & Big O (like ‘classes of functions’)

- rate of growth of function when input grows to infinity
- saying that a function is in a class means that it ‘grows the same way'
- first approximation: drop lower-order terms and leading constants
- types:
    - ϴ is asymptotic tight bound (“=“)
    - O is asymptotic upper bound (“≤”)
    - Ω is asymptotic lower bound (“≥”)
- properties of Big O
    - $n^a \in O(n^b) \\;\forall 0 < a \leq b$
    - $\log_a(n) \in O(n^b)\\;\\;\forall a,b > 0$
    - $n^a \in O(b^n)\\;\\;\forall a>0, b>1$
    - $\log_an\in O(\log_bn)\\;\\;\forall a,b > 0$
- important summations
    - $\sum_{i=0}^{n}a^i = \frac{1-a^{n+1}}{1-a}$
    - $\sum_{i=1}^{n}i=\frac{n(n+1)}{2}$

Algorithms:

- [Insertion sort](../insertion-sort)
- [Merge sort](../merge-sort)
- [Heapsort](../heapsort)
- [Quicksort](../quicksort)
- [Linear-time algorithms](../linear-time-algorithms)
