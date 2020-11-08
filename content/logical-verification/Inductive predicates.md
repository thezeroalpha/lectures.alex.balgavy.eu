+++
title = 'Inductive predicates'
+++

# Inductive predicates

This is basically "logic programming."
Inductive predicates: inductively defined propositions, way to specify functions of type `... → Prop`.

Example for even numbers:

```lean
inductive even : Ν → Prop
| zero : even 0
| add_two : ∀k : Ν, even k → even (k+2)
```

To check if a list is sorted:

```lean
inductive sorted : list Ν → Prop
| nil : sorted []
| single {x : Ν} : sorted [x]
| two_or_more {x y : Ν} {zs : list Ν} (hle : x ≤ y) (hsorted : sorted (y :: zs)) :
    sorted (x :: y :: zs)
```

You can use this to specify 'states'.

Logical symbols are specified like this:

```lean
inductive and (a b : Prop) : Prop
| intro : a → b → and

inductive or (a b : Prop) : Prop
| intro_left : a → or
| intro_right : b → or
```

Rule induction: induction in a proof term. The induction is on the introduction rules (constructors of proof term).

For example:

```lean
lemma mod_two_eq_zero_of_even (n : Ν) (h : even n) :
    n % 2 = 0 :=
begin
    induction' h,
    case zero { refl },
    case add_two : k hk ih { simp [ih] }
end
```

Other way to eliminate:
* `cases'`: like `induction'`, but without induction hypothesis
* `match` corresponds to dependently typed pattern matching

It's convenient to use the `inversion rule`: `∀x y, p (c x y ) → (∃..., ... ∧ ...) ∨ ... ∨ (∃..., ... ∧ ...)`

