+++
title = 'Lecture 1'
+++

# Intro

Basic model logic operators:
- □: necessary, known, provable
- ◇: possible, considered possible

- ◇ φ ⇔ ¬□ ¬φ
- □ φ ⇔ ¬◇ ¬φ

# First-order propositional logic
Includes variables, T, ⊥, not, and, or, implication.
Proofs are given by structural induction.
Precedence is ¬, then ∧∨, then →.

a valuation v : Var → {0,1} maps propositional variables to truth values.

the semantics of a formula under a valuation is defined with ⟦p⟧ᵥ = v(p), with p ∈ Var

if ⟦φ⟧ᵥ = 1, we write v ⊨ φ (read "v models φ")
- then, φ has a model, so φ is satisfiable

If every model of all φᵢ is a model of ψ, we write φ₁,...,φn ⊨ ψ
- then ψ is a semantic consequence of φ₁,...,φn

If v ⊨ φ for all valuations of v, then ⊨ φ (φ is a tautology)

Soundness: ⊢ implies ⊨, proved by induction on length of proof

Completeness: ⊨ implies ⊢, can be proven using consistency
