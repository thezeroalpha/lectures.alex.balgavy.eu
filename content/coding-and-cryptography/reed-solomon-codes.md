+++
title = 'Reed-Solomon Codes'
template = 'page-math.html'
+++

# Reed-Solomon Codes
## Codes over $GF(2^{r})$
$GF(2^{r})[x]$: all polynomials with coefficients from $GF(2^{r})$.

Let $a_{1} \dots a_{n}$ be distinct nonzero elements of $GF(2^{r})$, then $g(x) = (a_{1}+x)(a_{2}+x)\dots (a_{t}+x)$ generates linear cyclic code length $2^{r}-1$ over $GF(2^{r})$.

Let C be linear code length n over $GF(2^{r})$. Then every codeword c(x) can be written uniquely as m(x)g(x) for some m(x) in $GF(2^{r})[x]$ of degree n - deg(g(x)), and g9x) divides f(x) iff f(x) codeword and g(x) divides 1+xⁿ.

Let g(x) degree n-k.
If g(x) generates linear cyclic code C over $GF(2^{r})$ length $n = 2^{r}-1$ and dimension k, then

$G = \begin{bmatrix} g(x) \\\\ xg(x) \\\\ \vdots \\\\ x^{k-1} g(x) \end{bmatrix}$ and there are $(2^{r})^{k}$  codewords.

## Reed-Solomon codes
Let $a_{1} \dots a_{n}$ be nonzero elements of $GF(2^{r})$.

$\det
\begin{bmatrix}
1 & a_{1} & a_{1}^{2} & \dots & a_{1}^{t-1} \\\\
1 & a^{2} & a_{2}^{2} & \dots & a_{2}^{t-1} \\\\
\vdots & \vdots & \vdots & \vdots & \vdots \\\\
1 & a_{t} & a_{t}^{2} & \dots & a_{t}^{t-1}
\end{bmatrix} = \prod_{1 \leq j < i \leq t} (a_{i} + a_{j})$

Let $g(x) = (\beta^{m+1} + x)(\beta^{m+2}+x) \dots (\beta^{m+\delta-1}+x)$ be generator of linear cyclic code C over $GF(2^{r})$ of length $n = 2^{r}-1$, where β is primitive element in $GF(2^{r})$ and m is some int.
Then d(C) ≥ δ.

If C = RS($2^{r}$, δ), then:
- $n = 2^{r}-1$
- $k = 2^{r}-δ$
- d = δ
- $|C| = 2^{rk}$
- d = n - k + 1, so RS codes are MDS codes

For int s with 1 ≤ s < $2^{r}-\delta$ and code RS($2^{r}$, δ), shortened code is when take codewords with zeros in last s positions and delete last s positions (or also set of polynomials of deg less than $n - s = 2^{r} - 1 - s$).

$G(x) = \begin{bmatrix} g(x) \\\\ xg(x) \\\\ \vdots \\\\ x^{k-s-1} g(x) \end{bmatrix}$

Let C(s) be shortened RS($2^{r}$, δ), then:
- $n(s) = 2^{r}-1-s$
- $k(s) = 2^{r} - \delta - s$
- $d(s) = \delta$

## Decoding Reed-Solomon codes
error locations: coordinates where most likely error pattern is nonzero, referred to by error location number.

error magnitude of a location is element of $GF(2^{r})$ occurring in coordinate of most likely error pattern

0. Suppose sent word in RS($2^{r}$, δ) with generator $g(x) = (\beta^{m+1}+x) \dots (\beta^{m+\delta-1} + x)$ and w received.
Let t = ⌊(δ - 1) / 2⌋.
1. Calculate $s_{j} = w(\beta^{j})$ for m+1 ≤ j ≤ m+2t
2. Set e = t and find rank of extended matrix M'
3. Let e be that rank, solve for $\sigma_{0} \dots \sigma_{e-1}$ the system $M \begin{bmatrix} \sigma_{0} \\\\ \vdots \\\\ \sigma_{e-1} \end{bmatrix} = \begin{bmatrix} s_{m+e+1} \\\\ s_{m+e+2} \\\\ s_{m+2e} \end{bmatrix}$
4. Find roots of $\sigma_{A}(x) = \sigma_{0} + \sigma_{1} x + \dots + x^{e}$. These roots are location numbers.
5. Solve for $b_{1} \dots b_{e}$ the system
$\begin{bmatrix}
a_{1}^{m+1} & a_{2}^{m+1} & \dots & a_{e}^{m+1} \\\\
\vdots & \vdots & \vdots & \vdots \\\\
a_{1}^{m+e} & a_{2}^{m+e} & \dots & a_{e}^{m+e}
\end{bmatrix} \begin{bmatrix} b_{1} \\\\ b_{2} \\\\ \vdots \\\\ b_{e} \end{bmatrix}
= \begin{bmatrix} s_{m+1} \\\\ s_{m+2} \\\\ \vdots \\\\ s_{m+e} \end{bmatrix}$ yielding the error magnitudes.
