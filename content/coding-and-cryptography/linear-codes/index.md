+++
title = "Linear codes"
template = "page-math.html"
+++

# Linear codes
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

## Generating matrices & encoding
- rank of matrix over K: num of nonzero rows in any REF
- dim k of code C: dim of C as subspace of Kⁿ
    - if C has length n and dist d -- C is (n, k, d) linear code
- if C linear code of length n and dim k, any matrix whose rows are basis for C is generator matrix for C (must have k rows, n cols, rank k)
- G generator matrix ⇔ rows of G linearly independent
- to find a generator matrix, put codewords in matrix and reduce, then take nonzero rows

if G generator matrix for linear code C length n and dimension k, then v = u G ranges over all $2^{K}$ words in C $\forall u \text{length} k \in 2^{k}$
- → C = { words u G, u in $K^{K}$ }
- → u₁ G = u₂ G ⇔ u₁ = u₂

info rate of (n, k, d) code: $\frac{\log_{2} (2^{k})}{n} = \frac{k}{n}$

## Parity check matrices
H parity check matrix for linear code C if columns form basis for dual code $C^{\perp}$.
- if C length n dimension k, parity check matrix has n rows, n-k columns, n-k rank
- H parity check ⇔ columns H linearly independent
- if H parity check matrix for C length n, then C = {words v ∈ Kⁿ | v H = 0}

Matrix G generating and H parity check iff:
1. rows of G linearly independent
2. columns of H linearly independent
3. rows(G) + columns(H) = columns(G) = rows(H)
4. G H = 0

H parity check for C ⇔ $H^{T}$ generator for $C^{\perp}$

$H ^{T} G ^{T} = (G H) ^{T} = 0$

![Conversion between generator and parity check matrices](conversion.svg)

## Equivalent codes
- if $G = [I_{k}, X]$, G in standard form and generator for linear code length n dimension k with standard form G, then first K digits in codeword v = u G form word u in $K^{K}$ ("information digits")
- you can always permute C and rearrange every word
- any linear code C equivalent to linear code C' having generator matrix in standard form

## Distance of linear code
H parity check for linear code C.

C has distance d ⇔ any set d-1 rows of H linearly independent & at least one set d rows of H linearly dependent

## Cosets
for C linear code length n, u any word length n: coset of C determined by u = C + u = {v + u | v ∈ C}

for C linear code length n, u and v words length n:
- u ∈ C + v → c + u = C + v
- u ∈ C + u
- u + v ∈ C →  u and v in same coset
- u + v ∉ C → u and v in different cosets
- either C + u = C + v, or the two have no common words
- |C + u| = |C|
- C dimension k → exists $2^{n-k}$ different cosets of C, each with $2^{k}$ words
- C is one of cosets

## MLD for linear codes
when word w received, choose word u of least weight in coset c + w. conclude that v = w + u sent.

for C linear code length n, H parity check for C, w and u words in Kⁿ:
- w H = 0 ⇔ w codeword in C
- w H = u H ⇔ w and u in same coset of C
- u error pattern in received w → u H sum rows of H corresponding to position where errors in transmission
- syndrome word w in Kⁿ: w H in $K^{n-k}$

coset leader: word of least weight in coset.

standard decoding array (SDA) matches coset leader u to syndrome u H.

constructing SDA:
1. list all cosets for code, elect leaders
2. find parity check H for code
3. calculate syndromes u H

decoding w received:
1. calculate syndrome w H
2. find coset leader u next to syndrome w H = u H in SDA
3. conclude v = w + u sent

IMLD:
- num words closest to w = num least weight error patterns in c + w
- cosets with more than 1 least weight are omitted.
