+++
title = "Lecture 2"
template = "page-math.html"
+++

## Error-detecting codes
error pattern is u = v + w if v ∈ C sent and w ∈ Kⁿ received.

error detected if u is not a codeword.
error patterns that can't be detected are sums of codewords

distance of code: smallest d(v, w) ∀v,w.

Code of dist d at least detects patterns of weight d-1, there's at least one pattern of weight d not detected.

t-error-detecting code if detects pattern weight max t, and does not detect at least one pattern of weight t+1.
so code with dist d is "d-1 error-detecting code"

## Error-correcting codes
Code C corrects error pattern u if ∀v ∈ C, v+u closer to v than any other word

Code of dist d corrects all error patterns $weight \leq \frac{d-1}{2}$, at least one pat weight $1+\frac{d-1}{2}$ not corrected.

## Linear codes
Code linear v+w is word in C when v and w in C.

dist of linear code = min weight of any nonzero codeword.

vector w is linear combination of vectors $v_{1} \dots v_{k}$ if scalars $a_1 \dots a_k$ st. $w = a_{1} v_{1} + \dots + a_{k} v_{k}$

linear span \<S\> is set of all linear comb of vectors in S.

For subset S of Kⁿ, code C = \<S\> is: zero word, all words in S, all sums.

## Scalar/dot product
$\begin{aligned}
v &= (a_{1} \dots a_{n}) \\\\
w &= (b_{1} \dots b_{n}) \\\\
v \dot w &= a_{1} b_{1} + \dots + a_{n} b_{n}
\end{aligned}$

- orthogonal: v ⋅ w = 0
- v orthogonal to set S if ∀w ∈ S, v ⋅ w = 0
- $S^{\perp}$ orthogonal complement: set of vectors orthogonal to S

For subset S of vector space V, $S^{\perp}$ subspace of V.

if C = \<S\>, $C^{\perp} = S^{\perp}$ and $C^{\perp}$ is _dual code_ of C.

To find $C^{\perp}$,  compute words whose dot with elements of S is 0.

## Linear independence
linearly dependent $S = {v_{1} \dots v_{k}}$ if scalars $a_1 \dots a_k$ not all zero st. $a_{1} v_{1} + \dots + a_{k} v_{k} = 0$.

If all scalars have to be zero ⇒ linearly independent.

Largest linearly independent subset: eliminate words that are linear combination of others, iteratively.

## Basis
Any linearly independent set B is basis for \<B\>

Nonempty subset B of vectors from space V is basis for V if:
1. B spans V
2. B is linearly independent

dimension of space is number of elements in any basis for the space.

linear code dimension K contains $2^{K}$ codewords.

$\dim C + \dim C^{\perp} = n$

if ${v_{1} + \dots + v_{k}}$ is basis for V, any vector in V is linear combination of ${v_{1} + \dots + v_{k}}$.

Basis for C = \<S\>:
1. make matrix A where rows are words in S
2. find REF of A by row operations
3. read nonzero rows

Basis for C:
1. make matrix A where rows are words in S
2. find REF of A
3. locate leading cols
4. original cols corresponding to leading cols are basis

Basis for $C^{\perp}$ ("Algorithm 2.5.7"):
1. make matrix A where rows are words in S
2. Find RREF
3. $\begin{aligned}
    G &= \text{nonzero rows of RREF} \\\\
    X &= \text{G without leading cols} \\\\
    H &= \begin{cases}
        \text{rows corresponding to leading cols of G} &\text{are rows of X} \\\\
        \text{remaining rows} &\text{are rows of identity matrix}
        \end{cases}
    \end{aligned}$
4. Cols of H are basis for $C^{\perp}$

## Matrices
product of A (m × n) and B (n × p) is C (m × p), where row i col j is dot product (row i of A) ⋅ (col i of B).

leading column: contains leading 1

row echelon form: zero rows of all at bottom, leading 1s stack from right.
- reduced REF: each leading col has exactly one 1
