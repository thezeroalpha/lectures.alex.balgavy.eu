+++
title = 'Bubble sort'
+++
# Bubble sort
"brute force"
1. compare adjacent elements: if current is bigger than next, swap
2. compare next adjacent elements
3. repeat until go through all and no swaps have been made

## performance

a list with n elements: need n-1 comparisons for first pass, n-2 for second pass, etc.

number of key comparisons = (n-1) + (n-1) + (n-3) … + 1 = n(n-1)/2

## complexity

- Best case: O(n)
- Worst case: O(n²)
- Average: O(n²)
