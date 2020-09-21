+++
title = "Fractional knapsack"
template = "page-math.html"
+++

# Fractional knapsack

## Problem
take as much as as possible from best benefit per weight ratio.

(Benefit,Weight) = {(12, 4), (10, 6), (8, 5), (11, 7), (14, 3), (7, 1), (9, 6)}
Total Weight (W) = 18

## Solution
Build a table, and calculate the B/W ratio for each entry:

|     |     |     |     |
| --- | --- | --- | --- |
| S   | B   | W   | R=B/W |
| 1   | 12  | 4   | 3   |
| 2   | 10  | 6   | $1 \frac{4}{6}$ |
| 3   | 8   | 5   | $1 \frac{3}{5}$ |
| 4   | 11  | 7   | $1 \frac{4}{7}$ |
| 5   | 14  | 3   | $1 \frac{2}{2}$ |
| 6   | 7   | 1   | 7   |
| 7   | 9   | 6   | $1 \frac{1}{2}$ |

W = 18.

Start taking by highest ratio.
Formula:

$B_{\text{S with highest ratio}}\times\frac{\text{items taken}}{weight}$



<table>
<tr><td><strong>Item<strong></td><td>$B_6\times\frac{1}{1}$</td><td>$B_5\times\frac{3}{3}$</td><td>$B_1\times\frac{4}{4}$</td><td>$B_2\times\frac{6}{6}$</td><td>$B_3\times\frac{4}{5}$</td></tr>
<tr><td><strong>Cum.totalweight<strong></td><td>1</td><td>4</td><td>8</td><td>14</td><td>18</td></tr>
</table>


For total profits, calculate the addition of all items.

## Complexity

if S is a heap-based priority queue, with highest benefit per weight value having highest priority,

then in O(nlogn)
