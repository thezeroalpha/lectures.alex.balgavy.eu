+++
title = 'Lecture 4'
template = 'page-math.html'
+++
## Perfect & related codes
bounds for codes:
- if ints t ≤ n and word v length n, then num words length n of max distance t from v is $\binom{n}{0} + \binom{n}{1} + \dots + \binom{n}{t}$. If t = n, then 2ⁿ.
- all words of distance t from word v: add to v all words weight t
- Hamming bound: C length n and distance d  = 2t + 1 or 2t + 2, then $|C| = \frac{2^{n}}{\binom{n}{0} + \binom{n}{1} + \dots + \binom{n}{t}}$ (i.e. max num of words length n distance d in code)
- singleton bound: for (n, k, d) linear code, d-1 ≤ n-k
- for (n, k, d) linear code:
    - d = n-k+1
    - every (n-k) rows of the parity check matrix are linearly independent
    - every k columns of generator matrix are linearly independent
    - C is MDS
- there exists code length n dimension k distance d if $\binom{n-1}{0} + \binom{n-1}{1} + \dots + \binom{n-1}{d-2} \lt 2^{n-k}$


### Perfect codes
perfect code: if length n, distance d = 2t+1, $|C| = \frac{2^{n}}{\binom{n}{0} + \binom{n}{1} + \dots + \binom{n}{t}}$

if C nontrivial perfect code length n, distance d = 2t+1, then n=23 and d=7, or n=2ᴿ-1 for some R ≥ 2 and d=3

if C perfect code length n distance d = 2t+1, then corrects all error patterns weight ≤ t and no others.

### Hamming codes
Hamming code length 2ᴿ-1 if n = 2ᴿ-1, R ≥ 2, parity check matrix rows consist of all nonzero vectors length R

- has dimension 2ᴿ-1-R, contains $2^{2^{R}-1-R}$ codewords
- has distance d=3
- is a perfect single error correcting code

## Cyclic linear codes
polynomial degree n over K: $a_{0} + a_{1} x + \dots + a_{n} x^{n}$ where coefficients $a_{0} \dots a_{k}$ are elements of K.

set of polynomials over K is K[x].

polynomial division:
- f(x) = q(x) h(x) + r(x), where q(x) quotient and r(x) remainder
- long division like normal, but arithmetic in K (so xor the terms)

a code length n can be represented as set of polynomials over K of degree max n-1.
- e.g. codeword 0101 ≡ 0(1) + 1(x) + 0(x²) + 1(x³) = x + x³

If f(x) ≡ g(x) (mod h(x)), then
- f(x) + p(x) ≡ g(x) + p(x) (mod h(x))
- f(x) p(x) ≡ g(x) p(x) (mod h(x))

Cyclic shift π(v) of word v is when you move the last digits of v to the beginning (a rotation of the word).

Code is cyclic if rotating a codeword yields another codeword

To prove a code is cyclic, show that π(v) ∈ C for each word v in a basis for C.

To construct cyclic code: pick word v, form set S of all of its cyclic shifts, define C as linear span of S (\<S\>).

Given word v length n, let corresponding polynomial v(x), then cyclic shifts of v correspond to polynomials $x^{i} v(x) \mod 1 + x^{n}$

If C cyclic and v ∈ C, then for any polynomial a(x), c(x) = a(x) v(x) mod (1 + xⁿ) is codeword in C

Generator polynomial: unique nonzero polynomial of min degree in C

If g(x) generator polynomial for cyclic C, and n-k = deg(g(x)),
- C has dimension K
- codewords corresponding to $g(x), x g(x), \dots, x{k-1} g(x)$ are basis for C
- c(x) ∈ C ⇔ g(x) divisor of every codeword c(x)

g(x) generator polynomial ⇔ g(x) divides 1+xⁿ
- g(x) = gcd(v(x), 1+xⁿ)
- easy way to find: put basis or generator matrix in RREF with last k columns leading, min degree row is the generator polynomial
