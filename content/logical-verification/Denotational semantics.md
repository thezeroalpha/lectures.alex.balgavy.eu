+++
title = 'Denotational semantics'
+++
# Denotational semantics
## Compositionality
Denotational semantics: defines meaning of each program as mathematical object

⟦ ⟧ : syntax → semantics

Compositionality: meaning of compound statement should be defined in terms of meaning of its components

An evaluation function on arithmetic expressions is a denotational semantics.

## Relational denotational semantics
Can represent semantics of imperative program as function from initial state to final state, or as relation between initial and final state.

Continuing with the WHILE language:

```lean
def denote : stmt → set (state × state)
| stmt.skip := Id
| (stmt.assign n a) := {st | prod.snd st = (prod.fst st){n ↦ a (prod.fst st)}}
| (stmt.seq S T) := denote S ◯ denote T
| (stmt.ite b S T) := (denote S ⇃ b) u (denote T ⇃ (λs, ¬ b s))
| (stmt.while b S) := sorry
```

 For while, we need a fixpoint.

## Fixpoints
Fixpoint of `f` is a solution for `X` in the equation `X = f X`.
Under some conditions on `f`, unique least and greatest fixpoints will exist.

For semantics of programming languages:
- `X` will have type `set (state × state)`, i.e. `state → state → Prop`, representing relations between states
- `f` will be either taking one extra iteration of the loop (if `b` true), or identity (if `b` false)

Kleene's fixpoint theorem: `f⁰(∅) ∪ f¹(∅) ∪ f²(∅) ∪ ⋯ = lfp f`

Least fixpoint corresponds to finite executions of a program.

Inductive predicates correspond to least fixpoints, but are built into Lean's logic.

## Monotone functions
Take `α, β` types with partial order `≤`.
Function `f : α → β` is monotone if `∀a,b: a ≤ b → f a ≤ f b` .

All monotone functions `f : set α → set α` admit least and greatest fixpoints.

e.g. `f A = (if A = ∅ then set.univ else ∅)`.
Assuming `α` is inhabited, we have `∅ ⊆ set.univ` but `f ∅ = set.univ ⊈ f set.univ`

## Complete lattices
To define least fixpoint on sets, need `⊆` and `∩`.
Complete lattice: ordered type `α` for which each set of type `set α` has an infimum.

Complete lattice consists of:
- partial order `≤ : α → α → Prop`
- infimum operator `Inf : set α → α` (kind of like a minimum of a set)
    - `Inf A` is lower bound of `A`: `Inf A ≤ b` for all `b ∈ A`
    - `Inf A` is greatest lower bound: `b ≤ Inf A` for all `b` st `∀ a, a ∈ A ≤ a`

`Inf A` is not necessarily element of `A`.

Examples:
- `set α`: partial order `⊆`, infimum `∩` for all `α`
- `Prop`: partial order `→`, infimum `∀` (`Inf A := ∀a ∈ A, a`)
- `β → α` if `α` is complete lattice
- `α × β` if `α` and `β` are complete lattices

## Least fixpoint
```lean
def lfp {α : Type} [complete_lattice α] (f : α → α) : α :=
complete_lattice.Inf ({a | f a ≤ a})
```

Knaster-Tarski theorem: for any monotone function `f`,
- `lfp f` is fixpoint, i.e. `lfp f = f (lfp f)`
- `lfp f` is smaller than any other fixpoint, i.e. `X = f X → lfp f ≤ X`

Then, the definition for `while` from [above](#relational-denotational-semantics) is:

```lean
...
| (stmt.while b S) := lfp (λX, ((denote S ◯ X) ⇃ b) ∪ (Id ⇃ (λs, ¬ b s)))
```

## Application to program equivalence
Based on denotational semantics, introduce notion of program equivalence: `S₁ ~ S₂`.

```lean
def denote_equiv (S₁ S₂ : stmt) : Prop := ⟦S₁⟧ = ⟦S₂⟧

infix ` ~ ` := denote_equiv
```

Program equivalence can be used to replace subprograms by other subprograms with same semantics.
