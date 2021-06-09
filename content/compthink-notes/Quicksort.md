+++
title = 'Quicksort'
+++
# Quicksort
Divide and conquer.

Algorithm:
1. Make right-most index value pivot
2. partition array using pivot value
3. quicksort left partition recursively
4. quicksort right partition recursively

Find the pivot value:
1. Choose highest index value as pivot
2. Two variables point left and right of list (except pivot)
3. Left points to low index
4. Right points to high index
5. While value at left < pivot; move right
6. While value at right > pivot; move left
7. If *both* step 5 and step 6 fail — swap
8. If left ≥ right, point where they met is new pivot

Time complexity:

- Best case: O(nlogn)
- Worst case: O(n^2)
- Average case: O(nlogn)
