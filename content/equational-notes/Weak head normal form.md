+++
title = "Weak head normal form"
+++

# Weak head normal form
WHNF: at least one symbol is stable under reduction (the top part)

If the root is an abstraction, or applications with a variable on the left, it’s in WHNF.

every normal form is a WHNF, not necessarily the other way around.

definition: λx.P, xP₁...Pn

examples: x, λx.x, xΩ, λx.Ω

lazy reduction: stop at WHNF
