+++
title = 'Finite model property'
+++
# Finite model property
If φ is satisfiable, then φ is satisfiable on a finite model.

Effective finite model property: if φ is satisfiable, then φ is satisfiable in a model of size ≤ f(φ)

Via selection:
- suppose there is a model that makes φ true
- unravel the model at x to a tree model
- φ has finite modal depth n, so restrict tree model to height n
- rewrite φ to a conjunction of first-order propositional logic formulas and diamonds
- take for every diamond formula a successor

Via filtration:
- suppose there is a model that makes φ true
- consider set S of all subformulas of φ
- define equivalence relation on S: u ~ v iff u and v are modally equivalent
    - i.e., if they agree on letters/formulas
- define W' to consist of equivalence classes [u] of states from W
- define V' using u ∈ V(p) iff [u] ∈ V'(p) for every p in S
- define a R' using R'[u][v] if Ruv, and requiring:
    - if R'[u][v] and ◇ ψ ∈ S and [v] ⊨ ψ, then [u] ⊨ ◇ φ
    - then (W', R'), V' is finite and (W', R'), V', [x] ⊨ φ


