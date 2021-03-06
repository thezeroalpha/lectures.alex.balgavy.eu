+++
template = 'page-math.html'
title = 'Incompleteness theorem'
+++
# Incompleteness theorem
Consider sets of function and predicate symbols:
* F = {0, S, +, ·}
* P = {<}

with as intended model number theory N:
* domain of N is the natural numbers with 0
* $0^\mathbb{N} = 0$
* $S^\mathbb{N} (n) = n + 1$
* $+^\mathbb{N} (n,m) = n+m$
* $\mathbb{N}(n,m) = n \cdot m$
* $<^\mathbb{N} = \{ <n,m> | n,m \in \mathbb{N} \text{ such that }n < m \}$

One would like to have complete theory (deduction system) ⊢ for N that allows to derive all formulas that are true in N.

First incompleteness theorem:
* every axiomatizable and sound theory ⊢ of first-order logic
* for number theory with language <F,P>
* is incomplete:
  * it contains sentences Φ that are true in N, but unprovable in ⊢: N ⊨ Φ, yet ⊬ Φ.


Second incompleteness theorem:
* for every axiomatizable theory ⊢ of first-order logic
* for number theory with language <F,P>
* that is rich enough to express its own consistency by a sentence Φ⊢
* it holds that either:
  * ⊢ ⊥ (⊢ is inconsistent)
  * ⊬ Φ⊢ (hence ⊢ is incomplete)
* so first-order theories (based on predicate logic) of number theory can't prove their own consistency
