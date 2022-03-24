+++
title = 'Semantics: truth and validity, game semantics for formula validity'
template = 'page-math.html'
+++
# Lecture 2
## Semantics: local truth
Valuation notation:
- V : Var → P(W) means Var → W → {0,1}
- V(p,w) = 1 is the same as w ∈ V(p)

A formula φ _characterizes_ a state x in model M if φ is true in x but not in other states of M.

A formula φ _distinguishes_ state x from state y in a model M if φ is true in x but not in y.

![State diagram](example-characterizing.png)

Above:
- the formula 3 ⊨ □ ⊥ characterizes state 3
- the formula 2 ⊨ ◇ □ ⊥ characterizes state 2

## Game semantics
This is an approach to determine if a formula φ holds in a pointed model M, w.

We have:
- model M = ((W,R), V), world w ∈ W, formula φ
- two players:
    - Verifier V claims that φ is true in w (sort of like ∀)
    - Falsifier F claims that φ is false in w (sort of like ∃, try to find a _witness_)
- position: pair (w, φ) with w ∈ W a world and φ a formula
- move: from position (w, φ), determined by main operator of φ

Assume that negation only applied to prop. variables.
Transform formulas from ¬ □ p to ◇ ¬ p, ¬(p ∧ q) to ¬p ∨ ¬q.

The position determines the move, e.g. in a position (t, ◇ φ), V chooses a successor _u_ of _t_, and play continues with (u, φ).
For (t,p), if p is true in t then V wins, otherwise F wins.
For (t, ¬p), if p is false in t then V wins, otherwise F wins.
If a player should but cannot choose a successor, they lose.

Who starts:
- V: ∨, ◇
- F: ∧, □

A complete game tree for φ and (M,w) starts with (w,φ) and contains all possible moves.
A strategy for player P is subset of steps for P, and it's a winning strategy if it ensures that P wins the game.
φ is true in M in s ⇔ V has a winning strategy for M,s,φ.

### Example
Diagram:

![States](states.dot.svg)

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) states.dot -->
```dot
digraph states {
1 -> 2
1 -> 3
2 -> 3
3 -> 2
3 -> 4
4 -> 2
4 -> 3
}
```

</details>

Given:
- formula ◇ p ∨ □ ◇ p, in state 2.
- p is true in state 3.

Complete game tree:

![Game tree](tree.dot.svg)

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) tree.dot -->
```dot
digraph gametree {
    top [label="[V] ◇ p ∨ □ ◇ p, 2"]
    l11 [label="[V] ◇ p, 2"]
    l12 [label="[F] □ ◇ p, 2"]
    top -> l11
    top -> l12
    l21 [label="p 3"]
    l22 [label="[V] ◇ p, 3"]
    l11 -> l21
    l12 -> l22
    l31 [label="Verifier wins"]
    l32 [label="p, 2"]
    l33 [label="p, 4"]
    l21 -> l31
    l22 -> l32
    l22 -> l33
    l41 [label="Falsifier wins."]
    l42 [label="Falsifier wins."]
    l32 -> l41
    l33 -> l42
}
```

</details>

## Truth and validity
(((W,R),V),w) ⊨ φ means φ is valid in a point w.
(W,R) ⊨ φ means φ is valid in a frame (W,R).
⊨ φ means φ is valid/tautology.
If a part is omitted, it's implicitly universally quantified.

Satisfiability:
- φ _satisfiable in model M_ if there's a world w ∈ M such that M,w ⊨ φ
- φ _satisfiable_ if there's a model M and a world w ∈ M such that M,w ⊨ φ
- φ and ψ _semantically equivalent_ if ∀ M,w: M,w ⊨ φ ⇔ M,w ⊨ ψ
- φ valid iff ¬ φ not satisfiable

### Example
Show universal validity of □ (φ → ψ) → (□ φ → □ ψ)

1. let F = (W,R) be frame, V valuation on F, let x ∈ W.
2. Assume a1: F,V,x ⊨ □ (φ → ψ)
3. Assume a2: F,V,x ⊨ □ φ
4. Aim to show F,V,x ⊨ □ ψ.
5. □ is universal quantification, so take an arbitrary successor y ∈ W.
6. If Rxy, aim to show y ⊨ ψ. If not, □ ψ holds.
7. Have y ⊨ φ → ψ and y ⊨ φ.
8. From a2, have y ⊨ φ.
9. From a1, have have y ⊨ ψ.
10. Hence x ⊨ □ ψ, hence x ⊨ □ φ → □ ψ. Hence formula is valid.

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
If you need to prove that a formula characterizes a property, you need to prove this bi-implication in _both_ directions.

## Modal equivalence
Two states M, w and M', w' are modally equivalent if they satisfy the same formulas.
