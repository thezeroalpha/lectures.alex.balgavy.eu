+++
title = 'Adequate systems of connectives'
+++
# Adequate systems of connectives
a system C of connectives is adequate if every truth table can be expressed as formula with connectives C

example:
express (p ∧ ¬ q) ∨ (¬ p ∧ q) in the system {¬, ∧}

- use: ϕ ∨ Ψ ≡ ¬ (¬ ϕ ∧ ¬ Ψ)
- rewrite like hell
- result: ¬ (¬ p ∨ ¬¬ q) ∨ ¬ (¬ ¬ p ∨ ¬ q)

Sheffer stroke is an adequate system — {|}
- ϕ | Ψ means "not both ϕ and Ψ” (ϕ NAND Ψ)
- ϕ | Ψ ≡ ¬ (ϕ ∧ Ψ)

adequate systems are: {|}, {¬, ∧}, {¬, ∨}, {¬, ∧, ∨}, etc.
