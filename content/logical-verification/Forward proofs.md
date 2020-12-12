+++
title = 'Forward proofs'
+++
# Forward proofs
## Structured constructs
Structured proofs are Lean's proof terms with syntactic sugar.
Simplest kind is lemma, possibly with argument:

```lean
lemma add_comm (m n : Ν) :
    add m n = add n m :=
sorry
```

`fix` and `assume`: move `∀`-quantified vars/assumptions from goal into local context (like `intros`)
`show g, from ...`: repeats goal to prove, can also be used to rephrase goal including computation
`have h := ...` proves intermediate lemma
`let...in` introduces a variable

You can enter tactic mode (backward reasoning) by using `begin..end` blocks, e.g. in a `from`

## Calculational proofs
Sometimes we use transitive chains of relations (e.g. `a ≥ b ≥ c`).
In lean, you use `calc`:

```lean
lemma two_mul (m n : Ν) :
    2 * m + n = m + n + m :=
calc 2 * m + n
    = (m + m) + n :
        by rw two_mul
... = m + n + m :
        by cc
```

## Dependent types
For example, have a function `pick` taking natural number n as argument, and returning number between 0 and n.
This means that `pick` has a dependent type: `(n : Ν) → {i : Ν | i ≤ n}` (`|` is "such that", in lean it's `//`)

A "dependent type" means type depending on another term.

In lean, you write a dependent type `(x : σ) → τ` as `∀x : σ, τ`

## Curry-Howard Correspondence
PAT = propositions as types = proofs as terms

That is, the same lemma can be proved in multiple ways.

As a function:

```lean
lemma and_swap (a b : Prop) :
    a ∧ b → b ∧ a :=
λhab : a ∧ b, and.intro (and.elim_right hab) (and.elim_left hab)
```

As a tactical proof:

```lean
lemma and_swap (a b : Prop) :
    a ∧ b → b ∧ a :=
begin
    intro hab,
    apply and.intro,
    apply and.elim_right,
    exact hab,
    apply and.elim_left,
    exact hab
end
```

As a structured proof:

```lean
lemma and_swap (a b : Prop) :
    a ∧ b → b ∧ a :=
assume hab : a ∧ b,
have hb : b :=
    and.elim_right hab,
show b ∧ a, from
    and.intro hb (and.elim_left hab)
```

## Induction by pattern matching
Curry-Howard also means that proof by induction is like a recursively specified proof term.
The induction hypothesis is then the name of the lemma we're proving.

```lean
lemma reverse_append {α : Type} :
    ∀xs ys : list α, reverse (xs ++ ys) = reverse ys ++ reverse xs
| [] ys := by simp [reverse]
| (x :: xs) ys := by simp [reverse, reverse_append xs ys]
```
