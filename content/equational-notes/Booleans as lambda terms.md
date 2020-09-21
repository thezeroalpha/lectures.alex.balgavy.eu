+++
title = "Booleans as lambda terms"
+++

# Booleans as lambda terms
Church's thesis: everything computable can be defined in pure untyped lambda calculus

## Finding booleans
Try to find two different closed normal terms that let us calculate.

1. Two normal terms: x, y
2. Closed: λx.x, λy.y
	- but these are alpha-equivalent!
3. Different: λx.y.x, λx.y.y

Therefore:
- true = λxy.x
- false = λxy.y

## Negation
- not true =β false
- not false =β true

Deriving the definition for 'not':

```
(not) (true)
(λu.u__) (true) => replace the u with true.
true takes two arguments and returns first (by definition above).
therefore two arguments must be false, true.
```

∴ not = λx.x false true

Verifying:

```
(not) (true)
=> (λu.u false true) (true)
=> (true) (false) (true)
=> (λxy.x) (false) (true)
=> false
not true == false, so definition is OK
```

## Conjunction (AND)
Start with a truth table (specification):

```
and true true =β true
and true false =β false
and false true =β false
and false false =β false
```

We see that there are two arguments x and y. The value is given by the logical statement "if x then y otherwise false". So if the first argument is true, then the value depends on the truth value of the second argument. If the first argument is false, the whole thing is automatically false.

In lambda calculus:

`and := λxy.x y false`

Checking for correctness:

```
and false true  =   (λxy.x y false) (false) (true)
                ⇒β  (false) (true) (false)
                =   (λxy.y) (true) (false)
                ⇒β  false
        false   =β  and false true
```
``
This makes sense, so the definition is correct.

## Disjunction (OR)
Start with a truth table (specification):

```
or true true =β true
or true false =β true
or false true =β true
or false false =β false
```

We see that there are two arguments x and y. The value is given by the logical statement "if x then true otherwise y". So if the first argument is true, the whole thing is automatically true. If the first argument is false, the value depends on the truth value of the second argument.

In lambda calculus:

`or := λxy.x true y`

Checking for correctness:

```
or false true   =   (λxy.x true y) (false) (true)
                ⇒β  (false) (true) (true)
                =   (λxy.y) (true) (true)
                ⇒β  true
        true    =β  or false true
```

This makes sense, so the definition is correct.
