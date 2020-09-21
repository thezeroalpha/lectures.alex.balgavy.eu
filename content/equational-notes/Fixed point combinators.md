+++
title = "Fixed point combinators"
+++

# Fixed point combinators
**Fixed point**
M is a fixed point of F if `F M =β M`
for example, every term M is a fixed point of I.

**Fixed point combinator**
Y is a fixed point combinator if
`F M =β M (F M)` for every λ-term F

examples:
- Curry’s — Y = λf.(λx.f (x x)) (λx.f (x x))
- Turing’s — (λx.λy.(x x y)) (λx.λy.y (x x y))
