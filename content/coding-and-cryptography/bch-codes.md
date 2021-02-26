+++
title = 'BCH Codes'
template = 'page-math.html'
+++

# BCH codes
## Finite fields
**Basic roots**
- 1 is root of f(x) ⇒ 1+x is divisor/factor of f(x)
- g(0) = 0 ⇒ x is divisor/factor of g(x)

primitive irreducible polynomial: not divisor of $1+x^{m}$ for m < 2ⁿ-1

in a field, if ab = 0, then a = 0 or b = 0

To make Kⁿ into field, define multiplication in Kⁿ modulo an irreducible polynomial of degree n (gives you GF(2ⁿ)).

## Minimal polynoms
Order of nonzero element α ∈ GF(2ⁿ) is smallest positive int m such that $\alpha^{m} = 1$

Minimal polynomial of α ∈ GF(2ⁿ) is polynomial in K[x] of min degree with α as root

$\alpha^{m} = 1$ ⇒ α is root of $1+x^{m}$

**Facts about minimal polynomials**
- If
    - a ≠ 0 in GF(2ⁿ)
    - & $m_{a} (x)$ minimal polynomial of a
- Then $m_{a} (x)$ is:
    - irreducible over K
    - factor of polynomial f over K where f(a) = 0
    - unique min polynomial
    - factor of $1+x^{2^{r}-1}$

To find min polynomial, find linear combination of {1, a, a², …, $a^{r}$} which sums to 0

**Roots of minimal polynomials**
- If a ∈ GF(2ⁿ) with min polynomial $m_{a (x)}$
- then roots of $m_{x}$ are {a, a², a⁴, …, $a^{2^{r-1}}$}
