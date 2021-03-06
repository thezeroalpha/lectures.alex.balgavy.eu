+++
title = 'One-page cheat sheet'
+++
# One-page cheat sheet
## Definitions
* Model is:
  * set A - domain
  * interpretation operation for predicate and function symbols
* satisfiable: some model & environment where it's true
* valid: true in all models and environments
* derivable: can be proven without global hypothesis
* tautology: true under any truth assignment (valid)
* soundness: ⊢ A → ⊨ A (from syntax to semantics)
* completeness: ⊨ A → ⊢ A (from semantics to syntax)
* partial order: antisymmetric, reflexive, transitive
  * memo technique -- p**art**ial means **a**ntisymmetric, **r**eflexive, **t**ransitive
  * strict means irreflexive
* total order: partial order & ∀ ab: R(a,b) ∨ R(b,a)
  * strict: ∀ ab: R(a,b) ∨ a = b ∨ R(b,a)
* equivalence relation: has all three properties in the positive (symmetric, reflexive, transitive)

environment is used to interpret free variables
## Modal logic
* □ Φ: true in world if true in all related worlds (if no related, true).
* ◇ Φ: true in world if true in some related world (if no related, false).

M,w ⊩ Φ: Φ true in world w of Kripke model M (true in model if true in every world)

Φ valid in frame if true with every labelling.

frame = Kripke - labels

## Metatheorems
* consistent: has a model
* syntactically consistent: can't derive ⊥
* compactness: if Γ is consistent, every finite subset of Γ is also consistent

## Definability
Model finiteness is undefinable.

Model infiniteness is definable by a set of formulas.

In predicate logic, only unreachability by n steps is definable, and only by a set of sentences.

## Decidability
Y ⊆ I decidable if program can tell for every i ∈ I whether i ∈ Y. I set, Y predicate on set.

Undecidable: termination, PCP, validity, provability, satisfiability.

Termination can be reduced to PCP, which can be reduced to validity.

Incompleteness theorems: every non-trivial formal system is
* either incomplete (valid but not derivable)
* or inconsistent (doesn't have a model, or entails ⊥)

