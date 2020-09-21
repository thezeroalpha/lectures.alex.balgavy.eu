+++
title = "Binary Search & AVL Trees"
template = "page-math.html"
+++

# Binary Search & AVL Trees

**Binary trees:**

- can have a linked implementation
- traversals, recursive (e.g. preorder to nonrecursive)

**Binary search**

- search for key k in sorted array A[l…r]
- algorithm search (A, l, r, k):
    - if l > r, return that k is not present
    - if l ≤ r, let l := floor( (l+r)/2 )
        - compare m := A[i] with k:
            - if k < m, search k in A[l…i-1]
            - if k = m, return that k is at i
            - if k > m, search k in A[i+1…r]
- recurrence equation:

    $T(n) = \begin{cases}
        1 & \text{if $n = 1$}\\\\
        T(\frac{n}{2})+1 & \text{if $n>1$}\end{cases}$

- in O(logn)

Lookup table:

- search in O(logn)
- adding and deleting in O(n)

**Binary search tree:**

- for a node x with key k, all left nodes are less than k and right greater than k
- doesn’t have to be filled left to right like a heap
- to find successor (inorder), return minimum of subtree
- operations (search, min, max, succ, pred) are all in O(n)
- add & remove in

**AVL tree (balanced)**

- height of tree == height of root == max path to leaf
- BST where for every node, absolute value of difference between left and right height is max 1
- as in BST, but balanced:
    - height is in O(logn)
    - min, max is in O(h) == O(logn)
    - succ, pred in O(logn)
    - search in (logn)
- insert/delete are more complicated, have to rebalance:
    - left-left imbalance — right rotation

    ```
    T1, T2, T3 and T4 are subtrees.
             z                                      y
            / \                                   /   \
           y   T4      Right Rotate (z)          x      z
          / \          - - - - - - - - ->      /  \    /  \
         x   T3                               T1  T2  T3  T4
        / \
      T1   T2
    ```

    - left-right imbalance — left rotation to left-left, then right rotation

    ```
         z                               z                           x
        / \                            /   \                        /  \
       y   T4  Left Rotate (y)        x    T4  Right Rotate(z)    y      z
      / \      - - - - - - - - ->    /  \      - - - - - - - ->  / \    / \
    T1   x                          y    T3                    T1  T2 T3  T4
        / \                        / \
      T2   T3                    T1   T2
    ```

    - right-right imbalance — left rotation

    ```
      z                                y
    /  \                            /   \
    T1   y     Left Rotate(z)       z      x
        /  \   - - - - - - - ->    / \    / \
       T2   x                     T1  T2 T3  T4
           / \
         T3  T4
    ```

    - right-left imbalance — right rotation to right-right, then left rotation

    ```
       z                            z                            x
      / \                          / \                          /  \
    T1   y   Right Rotate (y)    T1   x      Left Rotate(z)   z      y
        / \  - - - - - - - - ->     /  \   - - - - - - - ->  / \    / \
       x   T4                      T2   y                  T1  T2  T3  T4
      / \                              /  \
    T2   T3                           T3   T4
    ```
