+++
title = "Natural numbers as lambda terms"
+++

# Natural numbers as lambda terms
## Church numerals
Try to find infinitely many different closed normal forms that let us calculate.

<pre>
zero                            => z
successor(zero)                 => s z
successor(successor(zero))      => s (s z)
</pre>

∴ infinite, many, different, normal.

<pre>
c0 = λs.λz.z
c1 = λs.λz.s(z)
c2 = λs.λz.s(s((z)))
...
cn = λs.λz.sⁿ(z)
</pre>

∴ closed.

how to find definition of successor?

<pre>
s cn =β cn + 1
    (in english, successor of Church numeral n is the same as the Church numeral + 1)

c₁ = λsz.sz
c₂ = λsz.s (s z)

∴ s = λx.λsz.x s (s z)
    = λx.λsz.s (x s z)
</pre>

## Definability
a function `f : N —> N` is definable in lambda calculus by term F if `F[n] =β [ f (n) ]` for every n in N

for Church numerals only: `F cn =β cf (n)`

You can define successor as: `S = λx.λsz.s(xsz)` OR `S' = λx.λsz.xs(sz)`
