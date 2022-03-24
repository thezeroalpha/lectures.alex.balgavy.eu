+++
title = 'Multi-modal logic'
+++
# Lecture 10
## Multi-modal logic
Assume set of labels I (which in a diagram are on the arrows).
For every label i there is modality 〈i〉 so the formulas of multi-modal logic are, given I, defined for i in ∈ I.

I-frame is pair (W, {Rᵢ | i ∈ I}).
Rᵢ ⊆ W × W for every i ⊆ I.

I-model is triple (W, {Rᵢ | i ⊆ I}, V).

### Truth and validity
For M an I-model, M,w ⊨ φ is defined by induction on the definition of formulas.

Clauses:
- M,w ⊨ 〈a〉φ iff M,v ⊨ φ for some v with Rₐwv
- M,w ⊨ [a]φ iff M,v ⊨ φ for all v with Rₐwv

### Example
Use index set I = {a, b, c}.
Give model with a world where the formula 〈a〉(〈b〉[a] p ∧ [c] ¬ 〈a〉p) is true.

![Example multimodal logic formula](example-multimodal-logic-formula.dot.svg)

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) example-multimodal-logic-formula.dot -->
```dot
digraph g {
rankdir=LR
1 -> 2 [label="a"]
2 -> 3 [label="b"]
}
```

</details>


For a bisimulation, when you do a step between states, they have to be with the same label (so the mimic step must have the same label).

### Geach axiom
◇ □ p → □ ◇ p.

Valid in frame iff for every r ← s → u there is r → v ← u.
