+++
template = 'page-math.html'
title = 'Meta-Theorems of Predicate Logic'
+++
# Meta-Theorems of Predicate Logic
Entailment syntactically (⊢) and semantically (⊨)
* Γ ⊢ ψ: there is natural deduction derivation of ψ that only uses premises in Γ
* Γ ⊨ ψ: for all M and l, if M ⊨l Φ for every Φ ∈ Γ, then M ⊨ ψ

Soundness and completeness:
* Γ ⊢ Φ ⇔ Γ ⊨ Φ
* for all formulas Φ, every set Γ of formulas
* soundness (correctness): left-to-right (⇒)
* completeness: right-to-left (⇐)

soundness theorem:
* Γ ⊢ Φ ⇒ Γ ⊨ Φ
* if there is natural deduction derivation of Φ from Γ, then there's no model M in which all formulas of Γ are true, but Φ is false
* "correct" means not possible to derive false conclusion Φ from true premises Γ
* prove by induction on derivation lengths

completeness theorem:
* Γ ⊨ Φ ⇒ Γ ⊢ Φ
* derivations are strong enough to derive all valid semantic entailment statements
* "complete" means more derivation rules are not necessary
* proof is non-trivial

consistency and syntactical consistency
* Γ is consistent ⇔ Γ is syntactically consistent
* Γ has a model ⇔ there is no derivation of ⊥ from Γ

semantical consistency:
* set Γ of formulas is consistent if there is model M and environment l such that M ⊨ Φ for all Φ ∈ Γ

syntactical consistency:
* set Γ of formulas is syntactically consistent if Γ ⊬ ⊥

compactness theorem:
* Γ is consistent ⇔ every finite subset Γ₀ ⊆ Γ si consistent

