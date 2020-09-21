+++
title = "Lecture 1"
template = "page-math.html"
+++

# Automata and complexity

[Slides](http://joerg.endrullis.de/automata/)

## Intro

Some problems are undecidable: program termination, post correspondence
problem

Some are NP-complete - travelling salesman, satisfiability in
prop. logic

**Word**: finite sequence of symbols from finite alphabet Σ

conventions:

-   symbols: a, b, c
-   words: u, v, w, x, y, z
-   empty word: λ

computer program is a word, takes input word, produces output word

can concatenate words, \|v\| means length of word

power v<sup>k</sup> is k concatenations of v's

reverse (a<sub>1</sub> ... a<sub>n</sub>)<sup>R</sup> = a<sub>n</sub> ... a<sub>1</sub>

## Formal languages

Formal language: set of words.

Σ<sup>\*</sup> is set of all words over Σ, formal language L is subset of Σ<sup>\*</sup>

Since it's a set, the usual set operations have meaning (complement,
union, intersection, etc.)

nth power of language is L<sup>n+1</sup> = L<sup>n</sup> L

Kleene star: $L<sup>* = \bigcup_{i=0}</sup>{\infty} L<sup>i$, $L</sup>+ = \bigcup_{i=1}<sup>{\infty} L</sup>i$

$\overline{L}<sup>R$ == $\overline{L</sup>R}$

But sets are not the best for language description, so let's use something else.

## Deterministic Finite Automata (DFA)

Consists of:

-   Q: finite set of states
-   Σ: finite input alphabet
-   δ : Q × Σ → Q: transition function
-   q<sub>0</sub> ∈ Q: starting state
-   set F ⊂ Q of final states

If automaton in state q reads symbol a, resulting state is δ(q, a).

$(q, aw) \vdash (q', w) \quad if \quad \delta(q, a) = q'$

You can write transition function δ in form of table:

|       | State              ||
| ---   | ------   | ------   |
| **δ** | **q<sub>0</sub>** | **q<sub>1</sub>** |
| a     | q<sub>0</sub>     | q<sub>1</sub>     |
| b     | q<sub>1</sub>     | q<sub>0</sub>     |



### DFA transition graphs

DFA can be visualised as transition graph:

-   states are nodes of graph
-   arows with labels from Σ
-   starting state: extra incoming arrow
-   final states: double circle
-   arrow q → q\' with label a iff δ(q, a) = q\'

![](880d7e035dcb41b290b260eb932562c7.png)

if $(q, w) \vdash^* (q', λ)$, can write $q \xrightarrow{w} q'$

A DFA defines a regular language based on what it accepts (or rejects).

To get a complement, you can just invert final states.

### Determinism

Deterministic: for every state and symbol, any state q has only one
outgoing arrow with label a

For every input word, there\'s exactly one path from starting state
through transition graph

### Theorems for regular languages

A language is regular if there is a DFA M = (Q, Σ, δ, q<sub>0</sub>, F) with L(M) = L

If L regular, $\overline{L}$ also regular.

If L<sub>1</sub> and L<sub>2</sub> regular, then L<sub>1</sub> ∪ L<sub>2</sub> regular.

If L regular, L<sup>R</sup> regular.

Every finite language is regular.
