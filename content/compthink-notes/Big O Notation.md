+++
title = 'Big O Notation'
template = 'page-math.html'
+++
# Big O Notation
used to classify algorithms
function characterisation according to rates of growth
useful for analysing efficiency
always uses approximate worst case
read “order of"

Example:
- $T(n)=4n^2-2n+2$
- $n=500$ => $4n^2$ is 1000 times larger than 2n
- $T(n) = O(n^2)$

## Time complexity
expressed in Big O notation
performance: how much time, memory, disk, etc.

time complexity: amount of time taken by an algorithm to run, as a function of the length of the string representing the input

typically interested in worst-case time complexity T(*n*)

Determining complexities:

- sequence of statements:
    - T=t(statement 1)+t(statement 2)+…+t(statement k)
    - if simple, time for each statement is constant, so total time is constant
    - therefore T(*n*) = O(1)
- if-then-else
    - worst case is the slower of two possibilities
    - max(time(block1), time(block2))
    - if block1 takes O(1) and block2 takes O(N), it will be O(N)
- loops
    - loop executes N times, so sequence of statements also executes N times
    - if assume statements are O(1), total time is N\*O(1)
    - so O(N)
- nested loops
    - if N is times for outer loop, and M is times for inner loop
    - executes total of N\*M times
    - so complexity is O(N\*M)
- function/procedure calls
    - f(k) has O(1)
    - g(k) has O(k)
    - if a loop goes 1 .. N and calls g(J) every time
    - complexity of O(N)²
