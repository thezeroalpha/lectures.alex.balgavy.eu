+++
title = 'Backward proofs'
+++

# Backward proofs

This is like going up the proof tree.

Tactical propositions look like this:

```lean
lemma lemma_name :
    statement :=
begin
    proof
end
```

It can also be a one-line proof, with `by`:

```lean
lemma lemma_name :
    statement :=
by tactic
```

Tactics:

- `intro h` creates assumption `h` from left-hand of implication or quantifiers (`intros` for multiple at once)
- `apply h` matches goal's conclusion with conclusion of `h` and adds `h`'s hypotheses as new goals
- `exact h` matches goal's conclusion with conclusion of `h`, closing the goal (could also use `apply`)
- `assumption` finds a hypothesis from the context that matches the goal's conclusion and applies it
- `refl` proves reflexivity (`l = r`) including unfolding definitions, β reduction, and more
- `and.intro`, `and.elim_right`, `and.elim_left`, `or.intro_right`, `or.intro_left`, `or.elim` are for logical connectives (∧, ∨)
- `eq.refl` for reflexivity, `eq.subst h` to substitute h into equality
- `rw h` applies `h` once as left-to-right rewrite rule. can apply right-to-left by writing `←h`.
- `not_def`: ¬a ↔ a → false
- `simp [h1, h2...]` applies rewrite rules and hypothesis set
- `cc` applies congruence closure
- `em` applies Law of Excluded Middle (p ∨ ¬p)
- `induction'` performs proof by induction, yields one subgoal per constructor
- `rename h1 h2` renames `h1` to `h2`
- `clear h1` removes `h1`

## Rewrite rules

This wasn't covered in the lecture, but it's useful so I'll add them here.

<table>
<tr>
<th>Implication</th>
<th>Conjunction</th>
<th>Negation</th>
<th>Disjunction</th>
<th>Bi-implication ("if and only if")</th>
<th>True & False</th>
</tr>
<tr>
<td>
<img src="68c840d11fe44ef29cb662c5b8ca1641.png" alt="implication-elimination.png">
</td>
<td>
<img src="d6ea36c804da4da3a1ba5be0b92d3234.png" alt="and-elimination.png">
</td>
<td>
<img src="6a8c517e54014b91bc71be3cb288d803.png" alt="negation-elimination.png">
</td>
<td>
<img src="6463b42ec717467c82a85101441f06c8.png" alt="disjunction-elimination.png">
</td>
<td>
<img src="2be50f863ace4c788b9dbe612c835bcb.png" alt="bi-implication-elimination.png">
</td>
<td>
<img src="e4ca711cb4bf4095806d8d7478b38b66.png" alt="falsum-elimination.png">
</td>
</tr>
<tr>
<td>
<img src="042e1ee9cd194f558fe79fd0f59857d4.png" alt="Implication introduction">
</td>
<td>
<img src="3fe765a8a14e4b8db6de84bcf5d6c97a.png" alt="conjunction-introduction.png">
</td>
<td>
<img src="5615644a2e664300a6d97325777bde3c.png" alt="Negation introduction">
</td>
<td>
<img src="a3129857d2114c8cae495ca1917c27c5.png" alt="disjunction-introduction.png">
</td>
<td>
<img src="50a65a98d80b4e5babf78c571487649e.png" alt="bi-implication-introduction.png">
</td>
<td>
<img src="d60db12d0f7941f3baf1b81243ea2aca.png" alt="truth-introduction.png">
</td>
</tr>
</table>

Quantifiers

<table>
<tr>
<th>Universal</th>
<th>Existential</th>
</tr>
<tr>
<td>
<img src="1cf1941c0bd24761a12d32d17945432f.png" alt="universal-elimination.png">
</td>
<td>
<img src="25529c12211e4d65986715e83210a531.png" alt="existential-elimination.png">
</td>
</tr>
<tr>
<td>
<img src="fb5ddc0670d14b739136cdcc6450584f.png" alt="universal-introduction.png">
</td>
<td>
<img src="3a95c65fe13f4c41a39a5fe143fa3919.png" alt="existential-introduction.png">
</td>
</tr>

Conjunction-negation:

![conjunction-negation-rule.png](6620aa0fda0247a78ad7e703b5a8b80c.png)

Proof by contradiction:

![proof-by-contradiction.png](443572833c9d4026bc04826456586a1e.png)

Induction:

![induction-natural-deduction-rule.png](9949541eac784432894b91cdb0dad372.png)
