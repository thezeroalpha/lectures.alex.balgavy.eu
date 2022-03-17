+++
title = 'Lecture 12'
template = 'page-math.html'
+++
# Lecture 12
- composition "R;S" = {(x, z) | ∃ y : Rxy ∧ Syz}
- union "R ∪ S" = {(x, y) | Rxy ∨ Sxy}
- R\*: repeat R one or more times

A model M is a PDL-model if the frame is a PDL-frame and $R_{\phi ?} = \\{ (w,w) \\;|\\; M, w \models \phi\\}$

The R of the frame is all sets of Rₐ where _a_ is a program (i.e. a label on an arrow).

<details>
<summary>Proof example of 〈α, β〉 p → 〈α〉〈β〉p</summary>

- Take a PDL model and a state x.
- Assume x ⊨ 〈α, β〉 p
- That is, there is a state y such that $(x, y) \in R_{\alpha;\beta}$ and y ⊨ p.
- $R_{\alpha;\beta} = R_{\alpha}; R_{\beta}$
- That is, there is a state u such that $(x, u) \in R_{\alpha}$ and $(u,y) \in R_{\beta}$.
- Because $(u,y) ∈ R_{\beta}$ and y ⊨ p, we have u ⊨ 〈β〉 p
- Because $(x,u) ∈ R_{\alpha}$, we have and u ⊨ 〈β〉p we have x ⊨ 〈α〉〈β〉p.
</details>

If then else:
- program: `if p then a else b`
- encoding: (p?; a) ∪ (¬ p? ; b)

<details>
<summary>Example</summary>

![Model](model-if-then-else.dot.svg)

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) model-if-then-else.dot -->
```dot
digraph g {
rankdir=LR
1 [xlabel="[p]"]
1 -> 2 [label="a"]
4 -> 2 [label="b"]
1 -> 3 [label="b"]
4 -> 3 [label="a"]
}

```

</details>

Calculate the relation for `if p then a else b`, which is encoded as `(p?; a) ∪ (¬ p?; b)`:

![Calculation](if-then-else-calculation.png)
</details>

While:
- program: `while p do a`
- encoding: (P?; a)\*; ¬ p?

<details>
<summary>Example</summary>

![Model](model-while.dot.svg)

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) model-while.dot -->
```dot
digraph g {
rankdir=LR
1 -> 2 [label="a"]
2 -> 3 [label="a"]
3 -> 4 [label="a"]
4 -> 5 [label="a"]
5 -> 6 [label="a"]
1 [xlabel="[p]"]
2 [xlabel="[p]"]
3 [xlabel="[p]"]
4 [xlabel="[p]"]
}
```

</details>

Calculating the relation `while p do a`, encoded as `(p?; a)*; ¬ p?`:

![Calculation](while-calculation.png)
</details>

If E is a bisimulation between two A-models, then it is a bisimulation for the models' PDL-extensions.
