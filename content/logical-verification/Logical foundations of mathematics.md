+++
title = 'Logical foundations of mathematics'
+++
# Logical foundations of mathematics
## Universes
Girard's paradox: Type : Type ⇒ false
Russel's paradox: {x | x ∈ x }

Types have a type.
You can't type Type as Type because of Girard's paradox.

So you set up something like this:
- `Prop`: Sort 0
- `Type`: Sort 1
- `Type 1`: Sort 2
- etc.

The types of types are "universes".
`u` in `Sort u` is "universe level".

## The Prop universe
`Prop` is different from other universes.

### Universe of α → β (impredicativity)
functions are used both returning Types and returning Prop.

You can use the typing rule

    C ⊢ σ : Sort u    C, x : σ ⊢ τ[x] : Sort v
    ——————————————————————————————————————————— Forall
    C ⊢ (∀x : σ, τ[x]) : Sort (imax u v)

where

    imax u 0       = 0
    imax u (v + 1) = max u (v + 1) -/

### Proof irrelevance
`∀(a : Prop) (h₁ h₂ : a), h₁ = h₂`

When seeing proposition as type, and proof as element of that type, a proposition is either empty type or has exactly one inhabitant.

### No large elimination
Can't extract data from a proof of a proposition.
This needs to be true for proof irrelevance.

## Axiom of choice
Makes it possible to get an arbitrary element from any nonempty type.
`classical.choice` gives back some element of the type.
It's not computable, and definitions that use it must be marked `noncomputable`.

## Subtypes
If a type is a set of elements, a subtype is a subset of those elements.

Given base type and property, the subtype has syntax: `{` variable `:` base type `//` property `}`
So for example `{i : Ν // i ≤ n}`

You create elements with `subtype.mk property proof_of_property`.

## Quotient types
If a type is a set of elements, and some of those elements are equivalent, the quotient type is the set of those equivalences.
You create this with a setoid (a structure with an equivalence relation and proof).
