+++
title = "Normal form"
+++

# Normal form
## Normal form
λ-term is in beta-normal (B-normal) form if it does not contain a beta-redex (you can't reduce it any more).

If it is in normal form, it automatically also has a normal form.

If it has a normal form, it is not necessarily in normal form.

A λ-term M is in normal form if:
- M = λx.M with M a normal form
- M = x M1 ... Mn with n ≥ 0 and M1...Mn normal forms

**Strongly normalising (terminating):** if all B-reduction sequences starting in M are finite (therefore also weakly normalising)
- terminating: x, λx.x, ...
- non-terminating: Ω, (λx.xxx) (λx.xxx), ...

**Weakly normalising:** if there exists a B-reduction sequence starting in M that ends in a normal form.
- so it can reach a result, but also has a reduction loop.
- e.g. K, Ω


## Confluence
Confluence is when terms can be rewritten in more than one way, still giving the same final result. That is, reducing to the same normal form.

In logic:

```
∀M1, M2: M ⇒ M1
         M ⇒ M2

         M1 ⇒β B
         M2 ⇒β B
```

With M being some term and B being a normal form.
