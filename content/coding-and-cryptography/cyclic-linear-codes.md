+++
title = 'Cyclic linear codes'
template = 'page-math.html'
+++

# Cyclic linear codes
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

## Generator parity check for cyclic codes
Simplest generator matrix is rows of cyclic shifts: $\begin{bmatrix} g(x) \\\\ x g(x) \\\\ \dots \\\\ x^{n-1} g(x) \end{bmatrix}$

The k info digits to be encoded are represented by message polynomial a(x).

Encoding is polynomial multiplication a(x) g(x) yielding c(x).

parity check: ith row $r_i$ is word corresponding to $r_{i} (x) = x^{i} mod g(x)$

syndrome polynomial s(x) = w(x) mod g(x), provided w is the codeword

## Finding cyclic codes
To find linear cyclic code length n dimension k, find factor of 1+xⁿ with degree n-k.

irreducible polynomial: if not product of two polynomials in K[x] both with deg ≥ 1 (sort of like a 'prime polynomial')

e.g. for n = 6, factor 1+x⁶ into irreducible factors and form all products of factors except 1 and 1+x⁶.

Idempotent polynomial: I(x) = I(x)² (mod 1+xⁿ)

**Basic factoring**
- If $n = 2^{r} s$:
- then $1+x^{n} = (1+x^{s})^{2^{r}}$.

**The number of cyclic codes**
- If s odd & $1+x^{s}$ product of z irreducible polynomials
- Then
    - $(2^{r}+1)^{z}$ linear cyclic codes length n
    - $(2^{r}+1)^{z}-2$ proper linear cyclic codes length n

How to factor:
1. Partition $Z_{n} = \lbrace 0, 1, \dots, n-1 \rbrace$ into "classes"
    - $c_{i} = \lbrace s = 2^{j} \cdot i (\mod n) | j = 0, 1, \dots, r \rbrace$ where $1 = 2^{r} \mod n$
2. For each class $c_{i}$, form polynomial $c_{i} (x) = \sum_{j \in c_{i}} x^{j}$.
3. Find all idempotent polynomials: I(x) = a₀ c₀ + a₁ c₁ + a₂ c₂ + …
4. Find corresponding generator polynomials g(x) = gcd(I(x), 1+xⁿ)

## Dual cyclic codes
**Multiplication of polynomials & dot product of vectors**
- If a ↔ a(x), b ↔ b(x), b' ↔ b'(x) = xⁿ b(x⁻¹) mod 1+xⁿ
- then a(x) b(x) mod 1+xⁿ = 0 iff ∀k = 0..n-1, $\pi^{k} (a) \cdot b\' = 0$

**Dual code for cyclic linear code**
- If:
    - C linear cyclic code length n dimension k generator g(x)
    - & 1+xⁿ = g(x) h(x)
- Then:
    - $C^{\perp}$ cyclic code, dimension n-k, generator $x^{k} h(x^{-1})$.

