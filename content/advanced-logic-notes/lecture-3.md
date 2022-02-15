+++
title = 'Lecture 3'
template = 'page-math.html'
+++
# Lecture 3
## Preservation of truth and validity
### Substitution
Substitution for propositional variables
- σ : Var → Form
- T and ⊥ not substituted

If (W,R), V ⊨ φ then not necessarily $(W,R) V \models \phi^{\sigma}$

But validity in a frame is preserved under substitution: if F ⊨ φ, then $F \models \phi^{\sigma}$ for any substitution σ.

Validity is closed under substitution: if F ⊨ φ, then $F \models \phi^{\sigma}$ for any substitution σ.

### Alternative semantics
The interpretation $[\\![ \phi ]\\!] _{M}$ of a formula φ in model M = (W,R,V) is set of worlds in which φ is true.

M, w ⊨ φ iff $w \in [\\![\phi]\\!]_{M}$

M ⊨ φ iff $[\\![\phi]\\!]_{M} = W$

### Preservation of truth and validity
Local truth preserved by modus ponens: if M, w ⊨ φ → ψ and M, w ⊨ φ then M, w ⊨ ψ

Global truth preserved by modus ponens and necessitation: if M ⊨ φ then M ⊨ □ φ

Frame validity preserved by modus ponens, necessitation, and substitution: if F ⊨ φ then $F \models \phi^{\sigma}$.

## Modal tautologies
⊨ □ (p → q) → □ p → □ q

If ⊨ φ → ψ and ⊨ φ then ⊨ ψ

If ⊨ φ then ⊨ □ φ

If ⊨ φ then $\models \phi^{\sigma}$

## Characterizations of frame properties
If F reflexive then F ⊨ □ p → p.
This holds in the opposite.
So the formula □ p → p characterizes the frame property 'reflexivity'.

In general, formula φ characterizes the frame property P means: F has property P iff F ⊨ φ.

## Modal equivalence
Two states M, w and M', w' are modally equivalent if they satisfy the same formulas.
