+++
title = 'Exercise class 3'
+++

# Exercise class 3
## Exercise 1
The two models:

<table>
<tr>
<th>M</th>
<th>K</th>
</tr>
<tr>
<td>
<img src="1-model-m.dot.svg" alt="Model M">

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) 1-model-m.dot -->
```dot
digraph g {
a -> b
a -> c
c -> a
c -> d
}
```

</details>

</td>
<td><img src="1-model-k.dot.svg" alt="Model K">

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) 1-model-k.dot -->
```dot
digraph g {
1 -> 2
2 -> 3
3 -> 1
1 -> 4
}
```

</details>
</td>
</tr>
</table>

### a)

| Round | S      | D            | link  | local harmony |
|-------|--------|--------------|-------|---------------|
| 0     |        |              | a ~ 1 | ok            |
| 1     | a -> c | (1/2) 1 -> 2 | c ~ 2 | ok            |
| 2     | c -> d | 2 -> 3       | d ~ 3 | ok            |
| 3     | 3 -> 1 | stuck.       |       |               |
| ...   | ...    | ...          | ...   | ...           |
| 1     | a -> c | (2/2) 1 -> 4 | c ~ 4 | ok            |
| 2     | c -> a | stuck.       |       |               |

So even in an optimal game, D gets stuck.
Therefore, M,a and K,1 are not bisimilar.

Once we find a winning strategy for S no matter what D does, we can stop.

### b)
A formula distinguishing M,a and K,1 is: ◇ ◇ □ ⊥

In two steps, we reach a blind state.

## Sequents and tableaux (exercise 5)
### □ p → ◇ p
Show validity of: □ p → ◇ p

Pre-processing:

```
□ p → ◇ p ≡ ¬ □ p ∨ ◇ p
          ≡ ◇ ¬ p ∨ ◇ p
```

<table>
<tr><th>Sequent</th><th>Tableau</th></tr>
<tr>
<td>

```
⇒ ◇ ¬ p ∨ ◇ p
⇒ ◇ ¬ p, ◇ p
```

Stuck. No diamond on left, so cannot take a step.

◇ ¬ p ∨ ◇ p not valid, so □ p → ◇ p not valid.
</td>
<td>
<img src="5-1-tableau.dot.svg" alt="Tableau" />

Zero non-solid successors. Stuck, does not close, so non-validity.

Counter-model F = ({1}, ∅), V(p) = ∅.

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) 5-1-tableau.dot -->
```dot
graph g {
a [label="* ◇ ¬ p ∨ ◇ p", xlabel="1"]
a -- b
b [label="* ◇ ¬ p, ◇ p", xlabel="1"]
}
```

</details>

</td>
</tr>
</table>

### □ (p → q) → (□ p → □ q)
Show validity of: □ (p → q) → (□ p → □ q)

Pre-processing:

```
□ (p → q) → (□ p → □ q) ≡ ¬ ◇ ¬ (¬ p ∨ q) → (¬ ◇ ¬ p → ¬ ◇ ¬ q)
                        ≡ ◇ ¬ (¬ p ∨ q) ∨ (◇ ¬ p ∨ ¬ ◇ ¬ q)
                        ≡ ◇ (p ∧ ¬ q) ∨ ◇ ¬ p ∨ ¬ ◇ ¬ q
```

<table>
<tr> <th>Sequent</th> <th>Tableau</th> </tr>
<tr>
<td>

```
⇒ ◇ (p ∧ ¬ q), ◇ ¬ p, ¬ ◇ ¬ q
◇ ¬ q ⇒ ◇ (p ∧ ¬ q), ◇ ¬ p

One case:
¬ q ⇒ p ∧ ¬ q, ¬ p
p, ¬ q ⇒ p ∧ ¬ q
p ⇒ p ∧ ¬ q, q

Two goals, both must be valid:
    A) p ⇒ p, q
       Valid.
    B) p ⇒ ¬ q, q
       p, q ⇒ q
       Valid.

Sequent is valid, so initial formula is valid.
```

</td>
<td>
<img src="5-2-tableau.dot.svg" alt="Tableau" />

Closes, so initial formula is valid.

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) 5-2-tableau.dot -->
```dot
graph g {
a [label="* ◇ (p ∧ ¬ q), ◇ ¬ p, ¬ ◇ ¬ q", xlabel="1"]
b [label="◇ ¬ q * ◇ (p ∧ ¬ q), ◇ ¬ p", xlabel="1"]; a -- b
c [label="¬ q * p ∧ ¬ q, ¬ p", xlabel="2"]; b -- c [style="dashed"]
d [label="p * p ∧ ¬ q, q", xlabel="2"]; c -- d

el [shape="record", label="{ p * p, q | closes. }", xlabel="2"]; d -- el

er [label="p * ¬ q, q", xlabel="2"]; d -- er
f [shape="record", label="{ p, q * q | closes. }", xlabel="2"]; er -- f
}
```

</details>

</td>
</tr>
</table>

### (□ p → □ q) → □ (p → q)
Show validity of: (□ p → □ q) → □ (p → q)

Pre-processing:

```
(□ p → □ q) → □ (p → q) ≡ (¬ ◇ ¬ p → ¬ ◇ ¬ q) → ¬ ◇ ¬ (¬ p ∨ q)
                        ≡ ¬ (◇ ¬ p ∨ ¬ ◇ ¬ q) ∨ ¬ ◇ (p ∧ ¬ q)
                        ≡ (¬ ◇ ¬ p ∧ ◇ ¬ q) ∨ ¬ ◇ (p ∧ ¬ q)
```

Tableau:

![Tableau](5-3-tableau.dot.svg)

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) 5-3-tableau.dot -->
```dot
graph g {
a [label="* (¬ ◇ ¬ p ∧ ◇ ¬ q), ¬ ◇ (p ∧ ¬ q)", xlabel="1"]
b [label="◇ (p ∧ ¬ q) * ¬ ◇ ¬ p ∧ ◇ ¬ q", xlabel="1"]; a -- b

la [label="◇ (p ∧ ¬ q) * ¬ ◇ ¬ p", xlabel="1"]; a -- la
lb [label="◇ (p ∧ ¬ q), ◇ ¬ p *", xlabel="1"]; la -- lb

lla [label="p ∧ ¬ q *", xlabel="2"]; lb -- lla [style="dashed"]
llb [label="p, ¬ q *", xlabel="2"]; lla -- llb
llc [label="{p * q | does not close}", xlabel="2", shape="record"]; llb -- llc

lra [label="{¬ p * | does not close}", xlabel="3", shape="record"]; lb -- lra [style="dashed"]

ra [label="◇ (p ∧ ¬ q) * ◇ ¬ q", xlabel="1"]; b -- ra
rb [label="p ∧ ¬ q * ¬ q", xlabel="4"]; ra -- rb [style="dashed"]
rc [label="p ∧ ¬ q, q *", xlabel="4"]; rb -- rc
rd [label="p, ¬ q, q *", xlabel="4"]; rc -- rd
re [label="{p, q * q | closes}", xlabel="4", shape="record"]; rd -- re
}
```

</details>

This yields a counter-model:

![Counter-model](5-3-counter-model.dot.svg)

<details>
<summary>Graphviz code</summary>

<!-- :Tangle(dot) 5-3-counter-model.dot -->
```dot
digraph g {
rankdir=LR
1 -> 2; 2 [shape="Mrecord", label="{2 | p}"]
1 -> 3
}
```

</details>

1 ⊭ □ (p → q) because 2 ⊭ p → q.
But 1 ⊨ (□ p → □ q) because 1 ⊭ □ p.
