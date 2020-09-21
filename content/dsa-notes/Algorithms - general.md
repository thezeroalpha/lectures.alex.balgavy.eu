+++
title = "Algorithms - general"
+++

# Algorithms - general

some problems can’t be solved, some can, and some efficiently.
efficiency is speed, power, security, etc. but in this class mainly speed.

example algorithm  — Euclid’s greatest common divisor.

- two non-negative numbers a ≥ b
    - if b = 0, return a
    - if b ≠ 0, then find gcd of b and (a mod b)

important aspects:

- correctness — does it output what it should?
- termination — does it eventually produce output?
- efficiency/complexity: how much time/memory does it use

complexity as a function of input

- time: how long does it take?
- space: how much space does it use?
- counting elementary steps, if n is size of input, a function of n is the number of steps
- approach — worst-case asymptotic time complexity
    - function T(n) giving time complexity for input of size n
    - want to know what happens to T as n gets very large

need to know how to:

- give the intuition of the algorithm
- give the pseudo-code for the algorithm
- apply the algorithm
- adapt the algorithm
- analyse correctness of the algorithm
- analyse (worst-case) time complexity of the algorithm
