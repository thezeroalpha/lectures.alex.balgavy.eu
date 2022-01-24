+++
title = 'Representation of data'
+++
# Representation of data
## Representing data
Binary circuits in computers

Unit of information: bit (binary digit) — 0 or 1 (data values or boolean)

Bit strings: multiple bits together, which can be given a specific meaning (such as natural numbers)

## Computing — boolean algebra
we want a computer that can calculate (expression string → result string(s))

operations:

- x.y (or x ^ y) — “AND", class of objects with both properties
    - x.x— no further information
        - x*x = x² = x
    - 0.x = 0 (annihilator)
    - 1.x = x (identity)
- x+y (or x v y) — “OR”, merges independent objects
- x+x — no further information
    - x+x = x
    - 0+x = x (identity)
    - 1+x = 1 (annihilator)

complements:

- if x, then complement is 1-x
- x(1-x) = x-x² = x-x = 0
- 1-x = x̄

therefore, any function ƒ(x) can be written as ƒ(x) = a ⋅ x + b ⋅ (1-x)

can it really? let’s try one:

```
ƒ(x) = a₀ + a₁x
let b = a₀, a = a₀ + a₁
∴ ƒ(x) = a ⋅ x + b ⋅ (1-x)
ƒ(1) = a
ƒ(0) = b
ƒ(x) = ƒ(1) ⋅ x + ƒ(0) ⋅ x̄
```

## Truth tables
Binary addition — XOR

x ⨁ y = x ⋅ ȳ + y ⋅ x̄

| x   | y   | ⨁<br>(carry result) |
| --- | --- | --- |
| 0   | 0   | 0 0 |
| 0   | 1   | 0 1 |
| 1   | 0   | 0 1 |
| 1   | 1   | 1 0 |

Binary multiplication — AND

x ⨂ y = x ⋅ y

| x   | y   | ⨂<br>(carry result) |
| --- | --- | --- |
| 0   | 0   | 0   |
| 0   | 1   | 0 1 |
| 1   | 0   | 0 1 |
| 1   | 1   | 1 0 |
