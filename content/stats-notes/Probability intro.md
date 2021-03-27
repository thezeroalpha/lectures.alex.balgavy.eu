+++
title = 'Probability intro'
template = 'page-math.html'
+++

# Probability intro

sample space: set of all possible outcomes
- Ω = 1,2,3,4,5,6

event: collection of outcomes (capital letters)
- A = {even number thrown} = {2,4,6}

probability measure: value between 0 and 1
- $P(A) = P(2,4,6 = \frac{1}{2})$
- P(A) = 0: event is impossible
- P(A) = 1: event is certain

## Determining probability

1. Estimate with relative frequency:
	$\begin{aligned}
	P(A) &= \frac{\text{number of occurrences of A}}{\text{number of times procedure was repeated}} \\\\
		&= \frac{\text{successes}}{\text{total number of tries}}
	\end{aligned}$

2. Theoretical approach: make a probability model
3. Subjective approach: estimate P(A) based on intuition/experience

Finding P(A) for discrete case:
1. Find sample space Ω

2. Determine probabilities P(ω) for all ω ∈ Ω

    - if all equally likely, then P(ω) = 1/N where N is number of outcomes in Ω

3. Determine which outcomes are in A
4. Compute P(A) by

$P(A) = \sum_{\omega :\; \omega \in A} P(\omega)$

## Probability rules:

“At least one”: P(at least one) = 1 - P(none)

Addition rule (A and B): $P(A \cup B) = P(A) + P(B) - P(A \cap B)$

Complement (not A):
- $P(\bar{A}) = 1 - P(A)$
- $P(A) = P(B \cap A) + P(\bar{B} \cap A)$

Conditional probability (B given A):
- $P(B | A) = \frac{P(A \cap B)}{P(A)}$
- $P(A \cap B) = P(A | B) \times P(B)$
- $P(B) + = P(B | \bar{A}) \times \bar{A}$
- $P(B | A) + P(\bar{B} | A) = 1$ (**NOT IF COMPLEMENT IS IN CONDITION**)

Disjoint events (mutually exclusive):
- $P(A \cup B) = P(A) + P(B)$
- $P (A \cap B) = 0$

Independent events:
- $P(A \cap B) = P(A) \times P(B)$
- $P(B|A) = P(B)$

## Bayes theorem

Forget that complicated-ass formula. You literally never need to use it.
For example, given these values:
- P(A) = 0.01
- $P(\bar{A})$ = 0.99
- $P(X|A)$ = 0.9
- $P(X|\bar{A})$ = 0.08

You need to calculate $P(A|X)$. Use conditional probability and do some rewriting:

$\begin{aligned}
P(A|X)            &= \frac{P(A \cap X)}{P(X)}\\\\
P(X)              &= P(A \cap X) + P(\bar{A} \cap X)\\\\
\therefore P(A|X) &= \frac{P(A \cap X)}{P(A \cap X) + P(\bar{A} \cap X)} \\\\
P(A \cap X)       &= P(X \cap A) \\\\
                  &= P(X|A) \times P(A) \\\\
\therefore P(A|X) &= \frac{P(X|A) \times P(A)}{P(X|A) \times P(A) + P(X|\bar{A}) \times P(\bar{A})} \\\\
                  &= \frac{0.9 \times 0.01}{0.9 \times 0.01 + 0.08 \times 0.99} \\\\
                  &= 0.1020408163 \approx 0.1
\end{aligned}$

