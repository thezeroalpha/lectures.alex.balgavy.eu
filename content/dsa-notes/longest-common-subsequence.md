+++
title = "Longest common subsequence"
+++

# Longest common subsequence

Problem:
"Find LCS of <N,I,A,C,U,E> and <N,I,C,E,A,C>."

Solution:
Set up a table (2D array):

| j \ i | 0   | N   | I   | A   | C   | U   | E   |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   | 0   | 0   | 0   |
| N   | 0   |     |     |     |     |     |     |
| I   | 0   |     |     |     |     |     |     |
| C   | 0   |     |     |     |     |     |     |
| E   | 0   |     |     |     |     |     |     |
| A   | 0   |     |     |     |     |     |     |
| C   | 0   |     |     |     |     |     |     |

Then, for every cell:

- If letter in row & column is the same, take the number diagonally up to the left and add 1. Place the result in the cell, draw an arrow pointing the cell that’s diagonally up and to the left — A[i-1, j-1]
- If not, compare neighbour to left and above, take the larger number and place it in the cell. Draw an arrow pointing left or up, depending on which number was used — A[i-1, j] or A[i, j-1]

The LCS length is the lowest rightmost cell. To find which elements are included in the subsequence, follow the arrows and record every cell that has a diagonal arrow pointing from it (it will be in reverse):

![Diagram](7574b0b5bd3e2a59ac1b8e6b93974270.png)

LCS = 4 — [N, I, A, C]

Worst-case complexity: O(m × n)

Extending:

To turn this into longest common increasing subsequence, create an array of elements from minimum to maximum, and then find LCS between this array and the input.
