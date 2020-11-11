+++
title = 'Propositional logic'
+++

# Propositional logic
- Declarative sentence: true or false
- Argument abstraction:  If p and not g, then r. Not r. p. Therefore q.
- Argument formalisation: [ ( (p ∧ ¬ q) ➝ r ) ∧ (¬ r ∧ p) ) ] ➝ q
- Symbols: ∧ (and), ∨ (or), ⨁ (xor), ¬ (not), ➝ (implication)

Constructing formulae

- every propositional variable is a formula
- so is its negation
- so are constructors wit operators

Symbol priority: negation, then conjunction/disjunction, then implication

Types of proposition:

- Tautology (p ∨ ¬ p) is always true
- Contradiction (p ∧ ¬ p) is always false
- Contingency is neither a tautology nor a contradiction

Rules of propositional logic

- Implication ϕ ➝ Ψ  is
    - false if ϕ true and Ψ false
    - true otherwise
- Bi-implication ϕ ⟷ Ψ (“ϕ if and only if Ψ”) is
    - true if ϕ and Ψ have same truth value
    - false otherwise
- conjunction/disjunction (with conjunction as example)
    - p ∧ q ⟷ q ∧ p
    - p ∧ (q ∧ r) ⟷ (p ∧ q) ∧ r
    - p ∧ (q ∨ r) ⟷ (p ∧ q) ∨ (p ∧ r)
    - p ∧ p ⟷ p
    - p ∧ (p ∨ q) ⟷ p
- negation
    - p ∧ ¬ p ⟷ F
    - p ∨ ¬ p ⟷ T
    - ¬ ¬ p ⟷ p
- demorgan
    - ¬ p ∧ ¬ q ⟷ ¬ (p ∨ q)
    - ¬ (p ∧ q) ⟷ ¬ p ∨ ¬ q
- identity
    - disjunction
        - p ∨ T ⟷ T
        - p ∨ F ⟷ p
    - conjunction
        - p ∧ T ⟷ p
        - p ∧ F ⟷ F
- implication
    - p ➝ q == ¬ p ∨ q
