+++
title = "Heapsort"
+++

# Heapsort

Intuition:

- input array is a max-heap (‘neat binary tree’)
- largest element is at the top
- deal with height of the tree (logn)
- have to maintain max-heap property

Tree definitions:

- depth: length of the pat to root from a node
- height: max path to a leaf
- binary: every node has 0, 1, or 2 successors
- almost complete if filled left-to-right
- an almost complete binary tree corresponds to an array
- height = floor(logn)
- parent = index/2
- left = index × 2
- right = (index × 2)+1

Heap:

- almsot complete binary tree, labelled with key from totally ordered set
- when walking downward, keys decrease
- hence largest key is at the top
- to reconstruct max-heap, bubble elements down and left — maxHeapify
    - O(logn)
- building: bottom-up, from lowest level (which is already heaps) — buildMaxHeap
    - O(n)

Heapsort:

- algorithm:
    - first: turn input-array into max-heap
    - loop:
        - swap root key with last node key
        - exclude last node form heap (decrease heap size)
        - reconstruct heap
        - if sorted (heap size 0), exit
- in-place
- worst-case is O(nlogn)
