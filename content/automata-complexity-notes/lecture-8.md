+++
title = "Lecture 8"
template = "page-math.html"
+++

# Pumping lemma for context-free languages
Let L be context-free language.

There exists m > 0 st for every word w ∈ L with |w| ≥ m, w = uwxyz. Constraints |vxy| ≤ m, |vy| ≥ 1, $uv<sup>ixy</sup>iz \in L$ for every i ≥ 0.

As a formula:
- ∃ m > 0.
- ∀w ∈ L with |w| ≥ m:
- ∃u,v,x,y,z with w = uvxyz, |vxy| ≤ m, |vy| ≥ 1
- ∀i ≥ 0, $uv<sup>ixy</sup>iz ∈ L$

## Using the lemma
Contradiction of the lemma for specific values of m, u, v, x, y, or z is not sufficient.

To contradict the lemma, prove the negation, i.e. show that ∃i ≥ 0, $uv<sup>ixy</sup>iz \notin L$.

As a 'game':
1. Given is language L, want to prove L is not context-free.
2. Opponent picks m.
3. We choose word w ∈ L with |w| ≥ m
4. Opponent picks u,v,x,y,z with w = uvxyz, |vxy| ≤ m, |vy| ≥ 1
5. If we can find i ≥ 0 such that $uv<sup>ixy</sup>iz \notin L$, then we win.
6. If we can always win, then L does not fulfil pumping lemma.

# Properties of context-free languages
If L₁ and L₂ are context-free, then so are $L_1 \cup L_2$, $L_{1}<sup>{R}$, $L_{1}L_{2}$, $L_{1}</sup>{*}$.

Proof:
1. Let $G_i$ be CFG with start variable $S_i$ st $L_i = L(G_i)$ for i = 1,2. Let G₁ and G₂ have no common variables.
2. Then for...
    - $L_1 \cup L_2$: add rules S → S₁ | S₂ and pick S as start variable.
    - $L_{1}<sup>{R}$: reverse all right-hand sides (i.e. $x \rightarrow y$ becomes $x \rightarrow y</sup>R$).
    - $L_{1}L_{2}$: add S → S₁S₂ and pick S as start variable.
    - $L_{1}^{*}$: add S → S₁S | λ and pick S as start variable

$L_1 \cap L_2$ and $L_1 \setminus L_2$ are context-free if $L_1$ is context-free and $L_2$ is _regular_.

$L \setminus \{ \lambda \}$ is context-free if L is context-free.

$\{a<sup>n b</sup>n | n \geq 1000 \}$ is context-free.

# Turing machines
Turing machines can read and write input word. Input is written on tape with a read-write-head.

In each step, the head:
1. Reads a symbol from the tape
2. Overwrites the symbol
3. Moves one place left or right.

Tape is two-sided infinite, i.e. unlimited memory (now if only that worked with actual computers).

Initial tape consists of word and blank symbols: □ □ □ input word □ □ □

Finite set of states Q, finite tape alphabet Γ, final accepting states.

Transition function δ: Q × Γ → Q × Γ × {L,R}. It's partial, δ(q,a) may be undefined.

δ(q,a) = (q', b, X) means:
- if head reads a from tape in state q
- then:
    1. A is overwritten by b
    2. Head moves 1 position: left if X = L, right if X = R
    3. Machine switches to state q'

configuration: a word vqw (q a state, v,w from the tape alphabet)
- machine is in state q
- tape content is vw, surrounded by □
- head stands on first symbol of w

A halting state is a configuration where a transition on the next symbol is undefined. In other words, a configuration $vqw$ with $q \in F$. Formally, a configuration $vqaw$ or $vq\lambda$ st $\delta(q,a)$ or $\delta(q,\square)$ is undefined.

An execution can be infinite!

some example computations:
- $vqaw \vdash vbq'w$ if $\delta (q,a) = (q', b, R)$
- $vq\lambda \vdash vbq'\lambda$ if $\delta(q, \square) = (q', b, R)$
- $\lambda qaw \vdash \lambda q'\square bw$ if $\delta(q,a) = (q',b,L)$
- $\lambda q \lambda \vdash \lambda q' \square b \lambda$ if $\delta(q, \square) = (q',b,L)$

Language is recursively enumerable if it's accepted by a (deterministic) Turing machine.

Church-Turing thesis: every computation of a computer can be simulated by a deterministic Turing machine.