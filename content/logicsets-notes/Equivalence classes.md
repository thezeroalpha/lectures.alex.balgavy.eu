+++
title = 'Equivalence classes'
template = 'page-math.html'
+++
# Equivalence classes
a *binary* relation R is an equivalence relation if for all elements x, y, z in its domain, R satisfies:

- reflexivity: x R x
- symmetry: x R y ➝ y R x
- transitivity: x R y ∧ y R z ➝ x R z

an equivalence class consists of all elements x,y for which x R y

within an equivalence class, all formulas are semantically equivalent

each equivalence class contains infinitely many formulas

one class contains all tautologies, another all contradictions (all semantically equivalent)

for two vars p,q there are as many ≡-equivalence classes as truth tables for p,q — i.e. 16

## How many equivalence classes?

for one variable p, there are two valuations (T or F)
- each valuation has two possible outcomes (T or F)
- therefore, 22 = 4 equivalence classes

for two variables p,q there are four valuations (T or F for each var)
- each valuation has two possible outcomes (T or F)
- therefore, 24 = 16 equivalence classes

etc. for n variables, there are $2^n$ valuations and $2^{2^n}$ equivalence classes.
