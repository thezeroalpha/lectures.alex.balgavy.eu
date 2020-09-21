+++
title = "Knapsack01"
+++

# Knapsack01

## Problem

Set of elements with a benefit and weight, and a total maximum weight. Have to find highest possible benefit.

W  = 5

| S   | B   | W   |
| --- | --- | --- |
| 1   | 2   | 1   |
| 2   | 5   | 2   |
| 3   | 4   | 3   |


## Solution
Initialise a table:

| w (b) \ W | 0   | 1   | 2   | 3   | 4   | 5   |
| --- | --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   | 0   | 0   |
| 1 (2) | 0   |     |     |     |     |     |
| 2 (5) | 0   |     |     |     |     |     |
| 3 (4) | 0   |     |     |     |     | **RESULT** |

For each cell, in row with weight n:
value = max{ b(n) + b(one row up, n columns to left), value in cell above }

| w (b) \ W | 0   | 1   | 2   | 3   | 4   | 5   |
| --- | --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   | 0   | 0   |
| 1 (2) | 0   | <= 2 | <= 2 | <= 2 | <= 2 | <= 2 |
| 2 (5) | 0   | ^ 2 | <= 5 | <= 7 | <= 7 | <= 7 |
| 3 (4) | 0   | ^ 2 | ^ 5 | ^ 7 | ^ 7 | **<= 9** |

So the maximum benefit is 9.

To find the items that were taken, retrace:

- if the number comes from above, the item was not taken
- else, the item was taken. add the item, go up and move n columns to the left (where n is the weight of the taken item). repeat until 0.

Here, the items were 3 and 2.

[https://www.youtube.com/watch?v=8LusJS5-AGo](https://www.youtube.com/watch?v=8LusJS5-AGo)

## Complexity
- for every k from 0 to n, consider Sk
- for every Sk consider w from 0 to W
- algorithm in O(nW) — size of matrix (pseudo-polynomial algorithm)
