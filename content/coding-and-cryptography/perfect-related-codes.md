+++
title = 'Perfect & related codes'
template = 'page-math.html'
+++
# Perfect & related codes
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

## Perfect codes
perfect code: if length n, distance d = 2t+1, $|C| = \frac{2^{n}}{\binom{n}{0} + \binom{n}{1} + \dots + \binom{n}{t}}$

if C nontrivial perfect code length n, distance d = 2t+1, then n=23 and d=7, or n=2ᴿ-1 for some R ≥ 2 and d=3

if C perfect code length n distance d = 2t+1, then corrects all error patterns weight ≤ t and no others.

## Hamming codes
Hamming code length 2ᴿ-1 if n = 2ᴿ-1, R ≥ 2, parity check matrix rows consist of all nonzero vectors length R

- has dimension 2ᴿ-1-R, contains $2^{2^{R}-1-R}$ codewords
- has distance d=3
- is a perfect single error correcting code
