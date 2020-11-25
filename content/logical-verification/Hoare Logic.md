+++
title = 'Hoare Logic'
+++
# Hoare Logic
For reasoning about concrete programs.

## Hoare triples
Have the form `{P} S {Q}`, where `S` is statement, `P` (precondition) and `Q` (postcondition) are logical formulas over state variables.

Meaning: if `P` holds before `S` is executed and execution terminates normally, `Q` holds at termination.
Is partial correctness statement, i.e. program is correct if it terminates normally.

Examples:

```
{true} b := 4 {b = 4}
{b ≥ 5} b := b + 1 {b ≥ 6}
```

## Hoare rules

## Semantic approach to Hoare Logic
We can define Hoare triples semantically in Lean.
Use predicates on states (`state → Prop`) to represent pre and postconditions.

```lean
def partial_hoare (P : state → Prop) (S : stmt) (Q : state → Prop) : Prop :=
∀s t, P s → (S, s) ⟹ t → Q t

notation `{* ` P : 1 ` *} ` S : 1 ` {* ` Q : 1 ` *}` :=
partial_hoare P S Q
```

Using it for a program exchanging two variables (in WHILE):

```lean
def SWAP : stmt :=
stmt.assign "t" (λs, s "a") ;;
stmt.assign "a" (λs, s "b") ;;
stmt.assign "b" (λs, s "t")

lemma SWAP_correct (a₀ b₀ : Ν) :
    {* λs, s "a" = a₀ ∧ s "b" = b₀ *}
    SWAP
    { * λs, s "a" = b₀ ∧ s "b" = a₀ *} :=
begin
    /-
    proof of correctness
    -/
    sorry
end
```

Program adding two numbers:

```lean
def ADD : stmt :=
stmt.while (λs, s "n" ≠ 0)
    (stmt.assign "n" (λs, s "n" - 1) ;;
    stmt.assign "m" (λs, s "m" + 1))

lemma ADD_correct (n₀ m₀ : Ν) :
    {* λs, s "n" = n₀ ∧ s "m" = m₀ *}
    ADD
    {* λs, s "n" = 0 ∧ s "m" = n₀ + m₀ *} :=
begin
    /-
    proof here
    -/
    sorry
```

## Verification condition generator
Program that applies Hoare rules automatically and produce verification conditions, which have to be proved by user.
User must provide strong enough loop invariants as annotations.

An invariant must be true before loop, remain true for each iteration if true before loop, and be strong enough to imply desired loop postcondition.
Suitable invariants tend to be: work done + work remaining = desired result.

VCGs usually work backward from postcondition, using backward rules (rules sated to have some `Q` as postcondition).

## Hoare triples for total correctness
Total correctness: program not only partially correct, but always terminates.
Of the form `[P] S [Q]`: if `P` holds before `S` runs, the execution terminates normally and `Q` holds in the final state.
Loops must then be annotated by a variant `V` (natural number that decreases with each iteration).

