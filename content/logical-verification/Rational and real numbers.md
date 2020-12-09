+++
title = 'Rational and real numbers'
+++
# Rational and real numbers
## Rational numbers
Rational numbers are fractions.
As integers are naturals with a minus operator, rationals are integers with a division operator.

```lean
structure fraction :=
(num : Ζ)
(denom : Ζ)
(denom_ne_zero : denom ≠ 0)
```

You can then define equivalence on a fraction:

```lean
@[instance] def fraction.setoid : setoid fraction :=
{   r := λa b : fraction, num a * denom b = num b * denom a,
    iseqv := /- proof -/ }

lemma fraction.setoid_iff (a b : fraction) :
    a ≈ b ↔ num a * denom b = num b * denom a :=
by refl
```

Then define rationals based on the setoid:

```lean
def rat : Type := quotient fraction.setoid

@[instance] def has_zero : has_zero rat :=
{ zero := ⟦0⟧ }

@[instance] def has_one : has_one rat :=
{ one := ⟦1⟧ }

@[instance] def has_add : has_add rat :=
{ add :=
    quotient.lift₂ (λa b : fraction, ⟦a + b ⟧)
    by /- proof -/ }
```

Could also use a subtype of `fraction`, but then more complicated function definitions are needed.

## Real numbers
Some sequences seem to converge, but don't converge to a rational number. For example √2.
The reals are rationals with a limit.

A sequence of rational numbers is Cauchy if for a nonzero `x`, there is an `n ∈ Ν`, such that for all `m ≥ n`, we have `|a_n - a_m| < x`.

```lean
def is_cau_seq (f : Ν → Q) : Prop :=
∀x > 0, ∃n, ∀m ≥ n, abs (f n - f m) < x

def cau_seq : Type :=
{f : N → Q // is_cau_seq f}

-- two sequences represent same real number when their difference converges to zero
@[instance] def cau_seq.setoid : setoid cau_seq :=
{   r := λf g : cau_seq, ∀x > 0, ∃n, ∀m ≥ n, abs (seq_of f m - seq_of g m) < x,
    iseqv := by /- proof -/ }

def real : Type := quotient cau_seq.setoid
namespace real

@[instance] def has_zero : has_zero real :=
{ zero := ⟦cau_seq.const 0⟧ }

@[instance] def has_one  : has_one real :=
{ one := ⟦cau_seq.const 1⟧ }

@[instance] def has_add : has_add real :=
{ add := quotient.lift₂ (λ a h : cau_seq, ⟦a + b ⟧)
            by /- proof -/ }
end real
```

