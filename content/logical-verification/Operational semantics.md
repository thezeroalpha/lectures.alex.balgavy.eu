+++
title = 'Operational semantics'
+++
# Operational semantics
## Creating a small imperative language: WHILE
WHILE has the grammar:

```
S ::= skip  -- no-op
    | x := a                -- assignment
    | S; S                  -- sequence of statements
    | if b then S else S    -- conditional statement
    | while b do S          -- while loop
```

It can be represented in Lean with an inductive type:

```lean
inductive stmt : Type
| skip : stmt
| assign : string → (state → Ν) → stmt
| seq : stmt → stmt → stmt
| ite : (state → Prop) → stmt → stmt → stmt
| while : (state → Prop) → stmt → stmt

infixr ` ;; ` : 90 := stmt.seq
```

The state is basically the environment, resolving a string to a value.
Then we can write a program:

```lean
def prog1 : stmt :=
stmt.while (λs, s "y" > 0)
    (stmt.skip ;; stmt.assign "x" (λs, s "a" + s "b"))
```

Deep embedding: abstract syntax tree specified in proof assistant, along with semantics
Shallow embedding: reuses mechanisms from logic (λ-terms, functions, predicate types)

## Big-step (natural) semantics
Judgments have the form `(S, s) ⇒ t`: starting in state `s`, executing `S` terminates in state `t`.

Derivation rules:

```
——————————————— Skip
(skip, s) ⟹ s


——————————————————————————— Asn
(x := a, s) ⟹ s[x ↦ s(a)]


(S, s) ⟹ t   (T, t) ⟹ u
——————————————————————————— Seq
(S; T, s) ⟹ u


(S, s) ⟹ t
————————————————————————————— If-True   if s(b) is true
(if b then S else T, s) ⟹ t


(T, s) ⟹ t
————————————————————————————— If-False   if s(b) is false
(if b then S else T, s) ⟹ t


(S, s) ⟹ t   (while b do S, t) ⟹ u
—————————————————————————————————————— While-True   if s(b) is true
(while b do S, s) ⟹ u


————————————————————————— While-False   if s(b) is false
(while b do S, s) ⟹ s
```

Specifying the rules in Lean:

```lean
inductive big_step : stmt × state → state → Prop
| skip {s}
    : big_step (stmt.skip, s) s
| assign {x a s}
    : big_step (stmt.assign x a, s) (s{x ↦ a s})
| seq {S T s t u}
    (hS : big_step (S, s) t)
    (hT : big_step (T, t) u)
    : big_step (S ;; T, s) u
| ite_true {b : state → Prop} {S T s t}
    (hcond : b s)
    (hbody : big_step (S, s) t)
    : big_step (stmt.ite b S T, s) t
| ite_false {b : state → Prop} {S T s t}
    (hcond : ¬ b s)
    (hbody : big_step (T, s) t)
    : big_step (stmt.ite b S T, s) t
| while_true {b : state → Prop} {S s t u}
    (hcond : b s)
    (hbody : big_step (S, s) t)
    (hrest : big_step (stmt.while b S, t) u)
    : big_step (stmt.while b S, s) u
| while_false {b : state → Prop} {S s}
    (hcond : ¬ b s)
    : big_step (stmt.while b S, s) s

infix ` ⟹ ` : 110 := big_step
```

## Properties of big-step semantics
We can:
- prove properties of programming language, e.g. equivalence between programs and determinism
- reason about concrete programs, proving theorems relating to state transitions

```lean
lemma big_step_deterministic {S s l r} (hl : (S, ⟹ l) (hr : (S, s) ⟹ r) :
    l = r
begin
    induction' hl,
    case skip { cases' hr, refl },
    case assign { cases' hr, refl }
    case seq : S T s t l hS hT ihS ihT {
        cases' hr with _ _ _ _ _ _ _ t' _ hS' hT',
        cases' ihS hS',
        cases' ihT hT',
        refl },
    case ite_true : b S T s t hb hS ih {
        cases' hr,
        { apply ih hr },
        { cc } },
    ...
end
```

For termination, it's unprovable, but you can generate a counterexample and prove that it doesn't terminate:

```lean
lemma big_step_doesnt_terminate {S s t} :
    ¬ (stmt.while (λ_, true) S, s) ⟹ t :=
begin
    intro hw,
    induction' hw,
    case while_true {assumption},
    case while_false {cc}
end
```

## Small-step semantics
Big-step semantics doesn't let us reason about intermediate states, or express nontermination or interleaving.
You can do this with small-step semantics (structural operational semantics).

A judgment has form `(S, s) ⇒ (T, t)`: starting in state `s`, executing one step of `S` leaves us in state `t`, with program `T` remaining to run.
A pair `(S, s)` is a "configuration". It's "final" if there's no transition from it.

Derivation rules:

```
————————————————————————————————— Asn
(x := a, s) ⇒ (skip, s[x ↦ s(a)])


(S, s) ⇒ (S', s')
———-————————————————————— Seq-Step
(S ; T, s) ⇒ (S' ; T, s')


—————————————————————— Seq-Skip
(skip ; S, s) ⇒ (S, s)


———————————————————————————————— If-True   if s(b) is true
(if b then S else T, s) ⇒ (S, s)


———————————————————————————————— If-False   if s(b) is false
(if b then S else T, s) ⇒ (T, s)


——————————————————————————————————————————————————————————————— While
(while b do S, s) ⇒ (if b then (S ; while b do S) else skip, s)
```

The Lean specification:

```lean
inductive small_step : stmt × state → stmt × state → Prop
| assign {x a s}
    : small_step (stmt.assign x a, s) (stmt.skip, s{x ↦ a s})
| seq_step {S S' T s s'}
    (hS : small_step (S, s) (S', s'))
    : small_step (S ;; T, s) (S' ;; T, s')
| seq_skip {T s}
    : small_step (stmt.skip ;; T, s) (T, s)
| ite_true {b : state → Prop} {S T s}
    (hcond : bs)
    : small_step (stmt.ite b S T, s) (S, s)
| ite_false {b : state → Prop} {S T s}
    (hcond : ¬ b s)
    : small_step (stmt.ite b S T, s) (T, s)
| while {b : state → Prop} {S s}
    : small_step (stmt.while b S, s) (stmt.ite b (S ;; stmt.while b S) stmt.skip, s)

infixr ` ⇒ ` := small_step
infixr ` ⇒* ` : 100 := star small_step
```

We can define big-step semantics based on small-step: `(S, s) ⟹ t` iff `(S, s) ⇒* (skip, t)` (i.e. we can get to a `skip` in one or more small steps).
The `*` is the reflexive transitive closure.

## Properties of small-step semantics
E.g. to show that a configuration is final only if the statement is a `skip`.

```lean
lemma small_step_final (S s) :
    (¬∃ T t, (S, s) ⇒ (T, t)) ↔ S = stmt.skip :=
begin
    induction' S,
    case skip {simp, intros T t hstep, cases' hstep },
    case assign : x a {
        simp,
        apply exists.intro stmt.skip,
        apply exists.intro s{x ↦ a s}),
        exact small_step.assign },
    case seq : S T ihS ihT {
        simp,
        cases' classical.em (S = stmt.skip),
        case inl {
            rw h,
            apply exists.intro T,
            apply exists.intro s,
            exact small_step.seq_skip },
        case inr {
            simp [h, auto.not_foorall_eq, auto.not_not_eq] at ihs,
            cases' ihS s with S' hS',
            cases' hS' with s' hs',
            apply exists.intro (S' ;; T),
            apply exists.intro s',
            exact small_step.seq_step hs' } },
    case ite : b S T ihS ihT {
        simp,
        cases' classical.em (b s),
        case inl {
            apply exists.intro S,
            apply exists.intro s,
            exact small_step.ite_true h },
        case inr {
            apply exists.inro T,
            apply exists.intro s,
            exact small_step.ite_false h } },
    case while : b S ih {
        simp,
        apply exists.intro (stmt.ite b (S ;; stmt.while b S) stmt.skip),
        apply exists.intro s,
        exact small_step.while }
end
```

