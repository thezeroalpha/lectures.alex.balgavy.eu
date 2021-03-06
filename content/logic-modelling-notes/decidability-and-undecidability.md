+++
template = 'page-math.html'
title = 'Decidability and Undecidability'
+++

# Decidability and Undecidability
## Decision problems
Decision problem consists of set I and a predicate Y ⊆ I

Examples:
* determine whether a number is prime:
  * input: natural number n
    * I = N
  * output: yes if n is prime, no otherwise
    * Y = { n ∈ N | n is prime }
* termination problem (whether a program terminates):
  * input: program P, input w
    * I = set of all pairs <program, input>
  * output: yes if P started with input w terminates, no otherwise
    * Y = { <P, w> | P terminates on input w }
* validity problem (determine whether a formula is valid):
  * input: formula Φ of predicate logic
    * I = set of formulas of predicate logic
  * output: yes if Φ is valid, no otherwise
    * Y = set of valid formulas in predicate logic

A decision problem Y ⊆ I is decidable if there is a program that tells for every i ∈ I whether i ∈ Y.

### Termination problem
This problem is undecidable.

steps:
* T outputs yes on input <P, w> ⇔ P halts on input w
* Tself outputs yes on input P ⇔ P halts on input P
* Z halts on input P ⇔ P does not halt on input P
* Z halts on input Z ⇔ Z does not halt on input Z
* contradiction.

### Post's Correspondence Problem
Given n pairs of words: <w1, v1> , ..., <wn, vn>

are there indices $i_1, i_2, ..., i_k$ (k ≥ 1) s.t. when concatenated, $wi_1 wi_2 ... wi_k = vi_1 vi_2 ... vi_k $?

as a decision problem:
* $PCP = \{ < <w_1, v_1>, ..., <w_k, v_k> > | k ≥ 1, w_i, v_i \; \text{binary words} \}$
* Y = { i ∈ PCP | i has a solution }

it's undecidable.

the termination problem can be reduced to PCP -- there is a computable function r that maps instances of termination problem to instances of PCP such that it holds: $P\text{ terminates on input w} \iff I_{<P, w>}\text{ has a solution}$

the validity problem in predicate logic is undecidable (no program that, given formula Φ, decides whether or not ⊨ Φ holds). PCP can be reduced to validity problem:
* I (instance of PCP) has a solution ⇔ ⊨ ΦI (instance of validity problem is valid)

Then if we had program deciding validity for predicate logic, we would obtain PCP-solver. Not gonna work.

## Undecidability of Validity and Provability
The validity problem in predicate logic is undecidable.
There cannot be a program that, given any formula Φ, decides whether or not ⊨Φ holds.

The provability in predicate logic is undecidable.
There cannot be a program that, given any formula Φ, decides whether or not ⊢ Φ holds.
This follows from soundness and completeness theorem.

## Undecidability of Satisfiability
for sentences Φ it holds:
* Φ is unsatisfiable ⇔ ¬ Φ is valid
* Φ is satisfiable ⇔ ¬ Φ is not valid

there's an easy reduction of validity problem to satisfiability problem.

The relations ⊨ and ⊢ in predicate logic are undecidable.

