+++
title = "Lecture 2"
template = "page-math.html"
+++

# Lecture 2

## Nondeterministic Finite Automata (NFA)

Difference from DFA:

-   A state can have zero or more outgoing arrows with the same label.
-   Allows for empty steps: arrows with label λ that don\'t consume a
    symbol

Defined like DFAs, except for transition function. Consists of:

-   Q finite set of states
-   Σ finite input alphabet
-   δ : Q × (Σ  ∪ *λ*)  → 2<sup>Q</sup> transition function, 2<sup>Q</sup> is set of all
    subsets of Q
-   q<sub>0</sub> ∈ Q starting state
-   F ⊂ Q of final states

Nondeterministic means that it can accept a word in more than one way.

For an L, you cannot form $\overline{L}$ by flipping final and nonfinal
states.

A language L is accepted by NFA iff L is regular.

### Transforming NFA into DFA

Start with the λ-closure of the initial states -- i.e. the initial state
plus any states you can reach with a λ transition. Then, see what states
you can go to from there, and every time compute the λ-closure.

## Grammars

Grammar defines a language. With grammar rules you can construct a
sentence.

Consists of:

-   V finite set of non-terminals (variables)
-   T finite set of terminals
-   S ∈ V start symbol
-   P finite set of production rules x → y where
    -   $x \in (V \cup T)^+$ containing at least one symbol from V
    -   $y \in (V \cup T)^*$
    -   for CFGs, x ∈ V

If x → y is production rule, then we have derivation step uxv ⇒ uyv for
every u,v ∈ (V ∪ T)<sup>\*</sup>.

### Example

Find grammar G such that L(G) = {a,b}<sup>\*</sup> {c} {b,c}<sup>\*</sup>

``` {.example}
S → AcB
A → aA   B → bB
A → bA   B → cB
A → λ    B → λ
```

### Backus Naur Form (BNF) - Context-free grammar

Non-terminals are indicated by \< and \>, and you can abbreviate
multiple rules with an or.

So like:

``` {.example}
S → a
  | b
  | λ
```

### Right linear grammars

Right linear if all production rules are of form A → uB or A → u, where
A,B are variables and u is a terminal.

It's strictly right linear if $|u|  \leq 1$ (so $u \in (T  \cup \lambda)$)
