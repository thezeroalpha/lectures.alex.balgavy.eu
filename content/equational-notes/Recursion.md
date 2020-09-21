+++
title = "Recursion"
+++

# Recursion
Let’s say you build a function for factorial, using applied lambda calculus (extra functions). For factorial — if x is 0, return 1, otherwise return `x × factorial (n-1)`

Basic function:

<pre>
factorial := λx.(iszero x) c₁ (mult x (factorial (n-1)))
</pre>

The problem is, it has factorial in its definition. It can’t. So abstract it.

<pre>
factorial := (λa.λx.(iszero x) c₁ (mult x (a (n-1))) ) factorial
</pre>

We can then divide it into two parts:

<pre>
F := λa.λx.(iszero x) c₁ (mult x (a (n-1)))
factorial := F factorial
</pre>

Then use a fixed point combinator.

<pre>factorial := Y F</pre>
