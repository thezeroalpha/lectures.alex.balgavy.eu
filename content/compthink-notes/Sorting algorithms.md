+++
title = 'Sorting algorithms'
+++
# Sorting algorithms
Sorting: arranging the elements in a list/collection in increasing/decreasing order of some property; elements are homogeneous

important to:

- optimise the use of other algorithms
- make searching easier (you can use binary search)
- normalise and standardise data
- produce a readable output

Classification based on:

- computational complexity (big O)
- memory usage
- recursion
- stability
    - a sorting algorithm is stable if: relative order of elements with equal values in input is maintained in the output
    - example: sorting list of words by first letter, if two words “straw” and “spoon” stay in the same order, it is stable (we only care about the first letter)
    - stability is not an issue with array of integers

Types:

- [Bubble sort](./bubble-sort)
- [Quicksort](./quicksort)
- [Merge sort](./merge-sort)
