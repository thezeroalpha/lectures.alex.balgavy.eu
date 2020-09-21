+++
title = "Lecture 5"
+++

# Context-free languages

## Context-free grammars (CFG)

Grammar G = (V,T,S,P) is \"context-free\" if all production rules are of
the form A → u, where A is a variable and u is variable or terminal.
i.e., LHS of all rules is a single variable.

A language L is context-free if it has a context-free grammar.

Let G be grammar, consider derivation S ⇒<sup>\*</sup> w.

-   G right linear: w contains at most one variable
-   G context-free: w can contain multiple variables

Which variable do you expand? Leftmost, or rightmost. The result
doesn\'t depend on the strategy, but on the choice of rules.

## Derivation trees

Derivation tree for a CFG has nodes with labels that can be variables,
terminals, or λ.

-   root is labeled by start symbol
-   if there is production rule:
    -   A → x<sub>1</sub> ... x<sub>n</sub> with n  ≥ 1: node labelled A can have children
        labelled x<sub>1</sub>...x<sub>n</sub>.
    -   A → λ: node labelled A can have one child with label λ
-   every node with label that\'s a terminal is a leaf (has no children)

Labels of leaves of derivation tree, from left to right, skipping λ,
form a word in L(G).

## Ambiguous grammars

A CFG is ambiguous if there is a word in the language that can have
multiple derivation trees.

An example of ambiguity is the dangling else problem. Joerg gave an
example in ALGOL, but it\'s the same in C (and is solved by always
making else bind tightly, i.e. to the nearest if):

``` {.c}
if (condition)
if (condition2) printf("Whatever");
else printf("Something else");
// without braces or indentation, you don't know whether the else corresponds to the
//  inner or outer if.
```

Ambiguity is undecidable -- you can\'t algorithmically determine whether
a CFG is ambiguous.

Inherently ambiguous language: if the language is context free, and
every grammar for that language is ambiguous.

## Normalising
### Removal of λ rules

λ-production rule: a rule where a variable can rewrite to λ

Steps:

1.  Note which variables rewrite to λ (any number of steps).
2.  For all variables B from step 1: for every rule A → xBy, add a new
    rule A → xy.
    -   watch out for transitivity: i.e. if A → B and B → λ, then A → λ.
3.  Remove all rules with λ on the right hand side.
