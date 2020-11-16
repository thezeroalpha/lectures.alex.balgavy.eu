+++
title = 'Monads'
+++
# Monads
## Two operations, three laws
Monad: type constructor `m` that depends on type parameter `α`.
Has two operations:
- `pure {α : Type} : α → m α`: takes a type and wraps it in the monad
- `bind {α β : Type} : m α → (α → m β) → m β`: takes a type wrapped in monad, modifies it using a function, and returns it wrapped again
    - `bind ma f` can also be written `ma >>= f`

In english, a monad is a box. `pure` puts stuff in the box, `bind` lets you use and modify stuff in the box.

The `←` operator inside `do` can extract stuff from the monad (take it out of the box).

First law:

```lean
do
    a' ← pure a,
    f a'
=
    f a
```

Second law:

```lean
do
    a ← ma,
    pure a
=
    ma
```

## Mutable state
The state monad is based on an 'action':

```lean
def action (σ α : Type) :=
σ → α × σ
```

`σ` is the state here, or the 'context'.

Then you can have several operations on the state:

```lean
def action.read {σ : Type} : action σ σ
| s := (s, s)

def action.write {σ : Type} (s : σ) : action σ unit
| _ := ((), s)

def action.pure {σ α : Type} (a : α) : action σ α
| s := (a, s)

def action.bind {σ : Type} {α β : Type} (ma : action σ α) (f : α → action σ β) : action σ β
| s :=
    match ma s with
    | (a, s') := f a s'
    end
```

## Nondeterminism
When a program can return one of many possible values.
This can be modelled with sets -- i.e. it returns something from a set of values.
