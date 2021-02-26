+++
title = "Introduction, basic concepts"
template = "page-math.html"
+++

# Introduction, basic concepts
Some definitions:
- digit: 0, 1
- word: sequence of digits
- length: digits in word (|word|)
- binary code: set C of words

assumptions about transmission channel:
- length of sent == length of received
- easy to find beginning of first word
- noise scattered randomly (not in bursts)

properties of binary channel:
- symmetric if 0 and 1 transmitted with same accuracy
- reliability: probability that digit sent == digit received
    - we assume ½ ≤ p < 1

information rate of code (length n) = $\frac{1}{n} \log_{2} |C|$

## Most likely codeword
Let $\phi_{p} (v,w)$ be probability that if word v sent over BSC with reliability p, word w is received.

$\phi_{p} (v, w) = p^{n-d} (1-p)^d$ if v and w disagree in d positions.

if v₁ and w disagree in d₁, and v₂ and w in d₂, then $\phi_{p} (v_{1}, w) \leq \phi_{p} (v_{2}, w)$ iff d₁ ≥ d₂.
- English: the most likely word disagrees in least digits

## Weight and distance

K = {0, 1}, $K^{n}$ = set of all binary words of length n

(Hamming) weight: number of ones

(Hamming) distance: number of differing digits between words

## Max likelihood decoding (MLD)
Complete:
- if one word min distance, decode to that
- else, arbitrarily select one of closest

Incomplete:
- if one word min distance, decode to that
- else, ask for retransmission
    - look for smallest weight in error patterns with C, e.g. 0+w and 1+w
    - retransmit if same weight

Reliability: probability that if v sent over BSC of prob b, then IMLD concludes that v was sent

$\theta_{p} (c, v) = \sum_{w \in L(v)} \phi_{p} (v, w)$ where $L(v) = \lbrace words \in K^{n} \enspace \| \enspace \text{IMLD correctly concludes v sent} \rbrace$

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
