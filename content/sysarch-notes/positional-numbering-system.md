+++
title = 'Positional numbering system'
template = 'page-math.html'
+++
# Positional numbering system
Z is a set of {-inf…0…inf} integers

define an alphabet ∑

A string X of n elements from ∑: Xn is in ∑n

Apply Xn to a valuation function F

For a base-10 system (radix = 10):

$
\begin{aligned}
277_{10} &= \begin{array}{c|c|c} 10^{2} & 10^{1} & 10^{0} \\\\ \\hline 2 & 7 & 7 \end{array} \\\\
&= 2(10^{2}) + 7(10) + 7(1)
\end{aligned}
$

How do you choose a representation?
- representation of special values/cases (e.g. 0)
- range of values that can be represented
- efficiency of implementation (common operations?)

Unsigned integer representation:

$
F : x_{n-1} \cdot 2^{n-1} + x_{n-2} \cdot 2^{n-2} + \dots + x_{0} \cdot 2^{0}
$

Range: 2ⁿ-1 (total 2ⁿ, but one of those is 0)

Can overflow, so have to detect — carry
