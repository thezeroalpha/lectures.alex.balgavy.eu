+++
title = 'Basic mathematical structures'
+++
# Basic mathematical structures
## Type classes

Different structures:
1. semigroups: satisfy `x * (y * z) = (x * y) * z`
2. monoids: satisfy 1 above and `x * 1 = x ∧ 1 * x = x`
3. groups: satisfy 1 and 2 above, and `x * x⁻¹ = 1 ∧ x⁻¹ * x = 1`

These are type classes in Lean.

We can define our own type, integers modulo 2, and register it as an additive group:

```lean
inductive my_int : Type
| zero
| one

def my_int.add : my_int → my_int → my_int
| my_int.zero a := a
| a my_int.zero := a
| my_int.one my_int.one := my_int.zero

@[instance] def my_int.add_group : add_group my_int :=
{   add := my_int.add,
    add_assoc :=
       by intros a b c; cases' a; cases' b; cases' c; refl,
    zero := my_int.zero,
    zero_add := by intro a; cases' a; refl,
    add_zero := by intro a; cases' a; refl,
    neg := λa, a,
    add_left_neg := by intro a; cases' a; refl }
```

## Lists, multisets, finite sets
For finite collections of elements, available structures:
- list: order and duplicates matter
- multiset: only duplicates matter
- finsets: neither order nor duplicates matter

`dec_trivial` is a lemma you can use for trivial decidable goals (i.e. if there are no variables in the expression).

## Order type classes
For example `(Ν, ≤)` or `(set Ν, ⊆)`.

- preorder: reflexivity (`x ≤ x`), transitivity (`x ≤ y → y ≤ z → x ≤ z`)
- partial order: preorder with antisymmetry (`x ≤ y → y ≤ x → x = y`)
- linear order: partial order with `x ≤ y ∨ y ≤ x`
