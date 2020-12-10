+++
title = 'Formalizing the p-adic numbers'
+++
# Formalizing the p-adic numbers
The rational numbers Q are incomplete: the sets `{x ∈ Q | x² < 2}` and `{x ∈ Q | x² > 2}` partition Q, but both are open.

A sequence is Cauchy if its entries eventually become arbitrarily close.

Two sequences are equivalent if they eventually become arbitrarily close to each other: `s ∼ t` if for every positive `ε ∈ Q`, there exists and N such that for all `k ≥ N`, `|s_k - t_k| < ε`.

equivalence relation: binary relation that is reflexive, symmetric, and transitive

equivalence class: for `≈` as equivalence relation on S, the equivalence class of `a ∈ S` is `⟦a⟧ = {x ∈ S | a ≈ x}.`

quotient: based on the above equivalence class, is the set `{⟦a⟧ | a ∈ S}` (so set of all equivalence classes)

The set of real numbers is the set `{s : N → Q | s is Cauchy}`. It is the quotient of set of rational Cauchy sequences, with respect to equivalence. This is the completion of Q.

## The p-adic norm
An alternate absolute value.

If `q ≠ 0`, the p-adic norm of rational `q` is `p ^ (-(padic_val_rat p q))`.
If `q = 0`, p-adic norm of `q` is 0.

The p-adic numbers are the Cauchy completion of Q with respect to the p-adic norm.
