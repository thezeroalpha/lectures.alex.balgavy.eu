+++
title = "Max subarray"
template = "page-math.html"
+++

# Max subarray

Problem

Assume array of integers. Give maximum sum of elements of a contiguous subarray.

A = [-6, 2, -4, 1, 3, -1, 5, -1]

Solution
Create a table containing arrays A and a new array B.
Initialise first element of B with max(A[1], 0):

<table>
<tr><td>A</td><td>-6</td><td>2</td><td>-4</td><td>1</td><td>3</td><td>-1</td><td>5</td><td>1</td></tr>
<tr><td>B</td><td>0</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
</table>

For each cell B:

- B[i] = max{ B[i-1]+A[i], 0 }
- m = max{ B[i], m }

<table>
<tr><td>A</td><td>-6</td><td>2</td><td>-4</td><td>1</td><td>3</td><td>-1</td><td>5</td><td>-1</td></tr>
<tr><td>B</td><td>0</td><td>2</td><td>0</td><td>1</td><td>4</td><td>3</td><td>8</td><td>7</td></tr>
</table>

m holds the highest sum:
m=8

To find subarray, go back from m until you find a 0.
[1,3,-1,5]

Complexity
The brute force algorithm is is in O(n2)
Divide and conquer is in O(nlogn)
DP brings it down to O(n).

$S(i) = \begin{cases}
A[i] & \text{if } i = 0\\\\
\max {S(i-1)+A[i], A[i]} & otherwise \end{cases}$
