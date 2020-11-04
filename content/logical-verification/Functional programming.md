+++
title = 'Functional programming'
+++
# Functional programming
## Inductive types
Mottoes:
- no junk: type contains no values except those expressible using constructors
    - e.g. for `nat`, there aren't values that can't be expressed using finite combination of `zero` and `succ`
- no confusion: values built in different ways are different
    - e.g. for `nat`, `zero` ≠ `succ x`

## Structural induction
generalization of math induction to inductive types.
- to prove property `P[n]` for natural numbers `n`, prove:
    - base case `P[0]`
    - induction step `∀k, P[k] → P[k+1]`
- similarly for lists:
    - base case `P[[]]`
    - induction step `∀y ys, P[ys] → P[y :: ys]`

Example proof:

```lean
lemma nat.succ_neq_self (n : Ν) :
    nat.succ n ≠ n :=
begin
    induction' n,
    { simp },
    { simp [ih] }
end
```

You can use `case` to supply custom names and/or reorder cases.

## Structural recursion
Form of recursion where you can peel off constructors from value.
Hence only call themselves finitely many times.

Example:

```lean
def fact : Ν → Ν
| 0     := 1
| (n+1) := (n+1) * fact n
```

## Pattern matching
`match` lets you do nonrecursive pattern matching

```
match term_1, term_2, ..., term_n with
| pattern_1, ..., pattern_m := result_1
...
| pattern_k1, ..., pattern_km := result_k
end
```

## Structures
You can define records/structures, essentially nonrecursive single-constructor inductive types.

```lean
structure rgb := (red green blue : Ν)
def red : rgb :=
{ red := 0xff,
  green := 0x00,
  blue := 0x00 }

structure rgba extends rgb := (alpha : Ν)
def semitransparent_red : rgba :=
{ alpha := 0x7f,
  ..pure_red }
```

`cases` does a case distinction on a term, giving rise to as many subgoals as constructors in definition of term's type.


## Type classes
Structure type combining abstract constants and their properties.
Type can be declared instance of type class by (1) providing concrete definitions for constants and (2) proving that properties hold.

for example, for class:

```lean
class inhabited (α : Sort u) := (default [] : α)
```

you can declare an instance like this:

```lean
@[instance] def nat.inhabited : inhabited Ν := { default := 0 }

@[instance] def list.inhabited : {α : Type} : inhabited (list α) := { default := [] }
```

## Lists
Inductive polymorphic types constructed from `nil` and `cons`.

`cases'` can be used on hypothesis of form `l = r`. Matches `r` against `l`, replaces all occurrences of vars in `r` with corresponding terms in `l` globally across goal.
it can also do case distinction on proposition, yielding one subgoal where the prop is true, and one where it's false.

`list.map` applies function element-wise to list.
`list.tail` gets everything but first element.
`list.head` gets first element.
`list.zip` takes two lists, and creates list of pairs.
`list.length` returns number of elements.

## Binary trees
Inductive types with constructors taking recursive arguments.
Have nodes with max two children.

```lean
inductive btree (α : Type) : Type
| empty {} : btree
| node : α → btree → btree → btree
```