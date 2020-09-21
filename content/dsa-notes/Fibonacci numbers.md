+++
title = "Fibonacci numbers"
+++

# Fibonacci numbers

recursive algorithm is in O(2n)
using memoization, you get to O(n)

| Recursive | DP (memoization) |
| --- | --- |
| **Algorithm**  fib(n):<br>**if**  n=1 **or**  n=2 **then**<br>**return**  1<br>**else**<br>x := fib(n−1)<br>y := fib(n − 2)<br>**return**  x + y | **Algorithm**  fib(n):<br>**new**  array r[1...n]<br>r[1] := 1<br>r[2] := 1<br>**for**  i := 3 **to**  n **do**<br>r[i] := r[i −1]+r[i −2]<br>**return**  r[n] |

reuse easier sub-problems. order them in way that allows you to reuse them.
core of DP: optimal substructures, overlapping subproblems.
