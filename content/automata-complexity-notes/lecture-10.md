+++
title = "Lecture 10"
template = "page-math.html"
+++

# Decidability

Decision problem P is language P ⊂ Σ<sup>\*</sup>

Decidable: P is recursive Semidecidable: P is recursively enumerable Undecidable: otherwise

Decidable problem:

-   algorithm that always halts
-   always returns yes or no

Semidecidable problem:

-   algorithm halts eventually if the answer is yes (w ∈ P)
-   may or may nto halt if answer is no
-   but you don\'t know how long you\'ll have to wait for an answer

Decision problem is decidable if:

-   P is semidecidable, and
-   $\overline{P}$ is semidecidable

The halting problem: given deterministic Turing machine and a word, does the machine halt when started with the word as input? It\'s undecidable, as the language H = { (M, x) \| M reaches halting state on input x } is not recursive.

Rice\'s theorem: every non-trivial property of recursively enumerable languages is undecidable. A property of class K is trivial if it holds for all or no k ∈ K.

## Post correspondence problem

Given n pairs of words (w<sub>1</sub>, v<sub>1</sub>)...(w<sub>n</sub>, v<sub>n</sub>), are there indices i<sub>1</sub>...i<sub>k</sub> st $w_{i_{1}}...w_{i_{k}} = v_{i_{1}}...v_{i_{k}}$?

Modified: is there a way to make the first words the same?

The PCP is undecidable, as evidenced by Joerg spending 2 hours in a lecture trying to make us decide it.

## Undecidable properties of context-free languages

Stuff that\'s undecidable:

-   the question L<sub>1</sub> ∩ L<sub>2</sub> = ∅
-   ambiguity of context-free grammars
-   whether a context-free language contains a palindrome
-   the question L = Σ<sup>\*</sup> (and hence equality of languages)

## Semidecidability

A decision P ⊂ Σ<sup>\*</sup> is:

-   decidable if P recursive
-   semidecidable if P recursively enumerable

Examples of semidecidable: halting problem, PCP, non-empty intersection of context-free languages, ambiguity of context-free grammars

Examples of undecidable:

-   derivability of formula φ in predicate logic
-   Hilbert\'s 10th problem (algorithm to decide if system of Diophantine equations has solution in Z)

# Complexity

## Big O notation

Wtf is this definition. TODO: find a better definition.

The highest exponent is what matters. e.g. n<sup>3</sup> is in O(n<sup>3</sup>) but also in O(n<sup>5</sup>) List of big Os:

-   exponentials are in O(n<sup>e</sup>), where e is the exponent
-   polynomials are O(n<sup>e</sup>), where e is the largest exponent

## Time complexity

Let f,g : N → N. Nondeterministic Turing machine (M) runs in time f if for every input (w), every computation of M reaches a halting state after at most f(\|w\|) steps.

A Turing machine has time complexity O(g) if there exists f ∈ O(g) st the machine runs in time f.

### Complexity classes P and NP

Nondeterministic Turing machine is in polynomial time if it has time complexity O(n<sup>k</sup>) for some k.

NP are languages accepted by **nondeterministic** polynomial time Turing machines.

P is class of languages accepted by **deterministic** polynomial time Turing machines.

P ⊂ NP, but nobody knows if P = NP.

A problem is in NP if:

-   every instance has finite set of possible solutions
-   correctness of solution can be checked in polynomial time
