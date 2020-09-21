+++
title = "Lecture 7"
template = "page-math.html"
+++

# Pushdown automata

Unlike NFA, the PDA has memory -- a stack of unlimited size.

Stack alphabet represented by Γ. Elements can be pushed/popped from the
stack. Initially, stack contains stack start symbol z ∈ Γ.

On transition, read topmost element of stack, and exchange with zero or
more new elements.

When NPDA reads words, need to keep track of current state, remaining
input, current stack.

Transition (q', v) ∈ δ(q, α, b) means that from state q with input α w
and stack bu, the automaton can go to state q' with input w and stack
vu. In other words, $(q, \alpha w, bu) \vdash (q', w, vu)$.

Transition graph for NPDA contains, for every (q', v) ∈ δ(q, α, b), an
arrow $q \xrightarrow{\alpha[b/v]} q'$. This reads as "if b is on the top of the
stack, transition from state q to state q', reading an α of input, and replacing
the b on the top of the stack with v".

Deterministic PDA:

-   δ(q, α, b) contains max one element
-   if δ(q, λ, b) ≠ ∅, then δ(q, a, b) = ∅ for every a ∈ Σ

Deterministic context-free language allows for efficient parsing.

Not all context-free languages are deterministic context-free.

It is decidable if two DPDAs generate same language.

Language L is context free ⇔ there exists NPDA for that language.

## CFG to NPDA

Simulate leftmost derivations on stack.

Construct NPDA with:

-   3 states, one of which is final
-   the stack alphabet containing variables, terminals, and z (stack
    start symbol)

Construct the PDA:

1.  Start with lambda transition that takes z on top of stack, and
    replaces it with the symbol.
2.  Simulate leftmost reductions for every rule. A rule is a λ
    transition that takes a a symbol on the stack, and replaces it with
    the expansion of the symbol.
    -   e.g. rules S → aSa \| aa
    -   two lambda transitions (loops):
        -   q<sub>1</sub> to q<sub>1</sub>, taking an S on the stack, and replacing it
            with aSa
        -   q<sub>1</sub> to q<sub>1</sub>, taking an S on the stack, and replacing it
            with aa
3.  Add transitions for consuming terminals. For every terminal, add
    transition that consumes the terminal, and replaces the terminal on
    the stack with λ.
4.  Add a lambda transition to final state, that takes z on the top of
    the stack and replaces with λ.

## NPDA to CFG

Assume there is one final state, which is reachable only with empty
stack. If not, make it so.

Define CFG with:

-   terminals being the alphabet
-   variables being (q b q') where q,q' are states and b ∈ Γ
    -   $(q b q') \Rightarrow<sup>{+} w \Leftrightarrow (q, w, b) \vdash</sup>{+} (q', \lambda, \lambda)$
-   build the productions with rules:
    - if there's an arrow $q \xrightarrow{\alpha [b/\lambda]} q'$
        -   add production (q b q') → α
        -   in Joerg terms: if $(q, \alpha w, b) \vdash (q', w, \lambda)$, or if (q', λ) ∈ δ(q, α, b)
    - if there's an arrow $q \xrightarrow{\alpha[b/c_{1}...c_{n}]} q'$
        -   add production $(q b r_{n}) \rightarrow \alpha (q' c_{1} r_{1})(r_{1} c_{2}r_{2})...(r_{n-1}c_{n}r_{n})$
        -   for all states r<sub>1</sub>...r<sub>n</sub>
        -   in Joerg terms: if $(q, \alpha w, b) \vdash (q', w, c_{1}...c_{n})$, or if (q', c<sub>1</sub>...c<sub>n</sub>) ∈ δ (q, α, b)
