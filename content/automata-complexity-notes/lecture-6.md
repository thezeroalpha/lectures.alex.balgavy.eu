+++
title = "Lecture 6"
template = "page-math.html"
+++

# Normalising (contd)

## Removal of unit production rules

Unit production rule: A → B, where B is a variable Steps:

1.  Remove all λ-productions
2.  Determine all pairs of different $A \rightarrow^+ B$
3.  Whenever there's a derivation A → B → y, add new rule A → y.
4.  Remove all unit production rules

## Chomsky normal form

When all rules have form A → BC or A → a. i.e.: the RHS is either two
variables, or a terminal.

Steps:

1.  Remove all λ-productions
2.  Remove all unit production rules
3.  For every terminal a:
    1.  add: variable C<sub>a</sub>, rule C<sub>a</sub> → a.
    2.  in any rule with length RHS  ≥ 2, replace the terminal a with
        C<sub>a</sub>
4.  Split all rules so that they have a maximum of 2 variables on the
    RHS, by adding new rules and variables. Example:
    -   start with one rule, {A → BCDE}.
    -   split, introduce variable X<sub>1</sub>: {A → BX<sub>1</sub>, X<sub>1</sub> → CDE}
    -   split, introduce variable X<sub>2</sub>: {A → BX<sub>1</sub>, X<sub>1</sub> → CX<sub>2</sub>, X<sub>2</sub> → DE}
    -   no more splits needed, as every rule has max 2 variables on the
        RHS.

## Removing useless variables

Why? It simplifies the grammar, sometimes by a ton.

A variable is:

-   useless if there's no way to reach it when deriving a
    word/terminal. If you remove production rules with useless
    variables, the language doesn't change.
-   productive if it derives to a terminal. If it's not productive,
    it's useless (just like your average student)

Steps:

1.  Determine the productive variables: if A → y is a rule, and all
    variables in y are productive, then A is productive.
2.  Remove rules containing a non-productive variable.
3.  Determine reachable variables:
    -   start symbol is always reachable
    -   if A → y, and A is reachable, then so are all variables in y.
4.  Remove rules containing an ureachable variable.
5.  Any variable from the original grammar that doesn't show up in the
    remaining rules is useless.

So basically, evict the unproductive and useless. Don't quote me on
that.

## Erasable variables

A is erasable if you can somehow derive λ from it.

-   if A → λ, A is erasable
-   if A → B<sub>1</sub>...B<sub>n</sub>, and B<sub>1</sub>...B<sub>n</sub> are erasable, then so is A.

# Parsing
Parsing: the search for a derivation tree for a given word.

For CFGs, parsing is possible in O(\|w\|<sup>3</sup>) time, where \|w\| is length
of input word.

## Bottom-up parsing (right-to-left)

Start from input word, try to construct starting variable S. Applies
rules backwards.

The CYK (Cocke-Younger-Kasami) algorithm does bottom-up parsing for
grammars in Chomsky normal form. It determines whether a non-empty word
w is in L(G) (i.e., is accepted by the grammar).

Steps:

1.  Take grammar G in Chomsky normal form. Hopefully someone will be
    nice enough to give you that; if not, you'll have to normalize it
    yourself.
2.  Compute sets V<sub>u</sub> of variables from which you can derive u, where u is a
    _contiguous_ subword of w.
    -   If u is a letter, then V<sub>u</sub> are the variables that derive to u.
    -   If u is multiple letters, then V<sub>u</sub> is set of all variables such that:
        -   u = u<sub>1</sub>u<sub>2</sub> with u<sub>1</sub> and u<sub>2</sub> being some nonempty _words_ (potentially multiple letters)
        -   A → BC is a production in the grammar, with B deriving to u<sub>1</sub> and C deriving to u<sub>2</sub>
3.  If the starting variable is in the set of variables that derive to word w, then the grammar generates that word.

## Top-down parsing (left-to-right)

Start from starting variable S, try to derive the input word.

Simple leftmost:

-   idea:
    -   always expand leftmost variable A, replace A by u if A → u.
    -   backtrack on mismatch with input string, then try another
        production rule A → v.
-   issue is that backtracking is expensive and hard

## LL parsing:

LL: left-to-right (top-down), leftmost derivation. Backtracking not
allowed.

-   LL(1): looks at one symbol of input. grammar is LL(1) if parser
    table has max one rule in every cell (i.e., no ambiguity when a
    symbol is read)
    -   left factorization can make a grammar LL(1). e.g:
        -   {S → ab \| ac } is not LL(1), ambiguity with one symbol
            lookahead.
        -   if factorize to two rules, {S → aA, A → b \| c}, the grammar
            is LL(1).
-   LL(k): looks k symbols ahead. table constructed with k symbol
    lookahead, the grammar is LL(k) if the table has max one rule in
    every cell. size of parser table grows exponentially.

CFG prerequisite - must have no useless variables (though λ-productions
and unit productions are allowed)

I'll try to explain this in a more understandable way than the abstract notation we get.

### First set
The set of terminals that begin strings derivable from variable A.

To find First(A), you want to look at the RHS of every rule A -> XY:
- if X is a terminal, then first(A) is that terminal
- if X is a variable, then first(A) is:
    - first(X)
    - and if X can derive lambda, also first(Y)

#### Example
Take the grammar with rules:

1. A → DbCbz
2. A → dzzzA
3. A → λ
4. B → kkdb
5. C → kzeA
6. D → AneCB

I start with B, because it doesn't depend on other first sets.

First(B):
- rule 4: k is first, and is a terminal
- therefore First(B) = k

First(C):
- rule 5: k is first, and is a terminal
- therefore First(C) = k

First(A):
- rule 3: λ
- rule 2: d is first, and is a terminal
- rule 1: D is first, and is a variable, so have to find First(D):
    - from below, First(D) = {d, n}
- therefore First(A) = {λ, d, n}

First(D):
- rule 6: A is first, and is a variable, so have to find First(A):
    - from above, First(A) = {d, First(D)}
    - A can derive λ, so First(D) includes n
- therefore First(D) = {d, n}

Remember, duplicates are excluded in sets.

### Follow set
The set of possible terminals immediately following a variable A.

To find Follow(A), you want to look at rules that have A on the RHS:
- if A is followed by a terminal, add that terminal to Follow(A)
- if A is followed by variable V, add First(V) to Follow(A)
- if A is at the end of a rule V → XA, where X are some variables/terminals, add Follow(V) to Follow(A)
- if A is at the end of a rule, add \$ to Follow(A) if
    - A is not included in any other RHS
    - or is in a rule such as A → XA and can derive λ
- the start symbol always has \$ in its follow set

#### Example
Take the grammar with rules:

1. A → DbCbz
2. A → dzzzA
3. A → λ
4. B → kkdb
5. C → kzeA
6. D → AneCB

I start with D, as it does not depend much on other rules.

Follow(D):
- rule 1: D is followed by b, which is a terminal
- therefore Follow(D) = {b}

Follow(B):
- rule 6: B is the last symbol, so add Follow(D) to Follow(B)
    - from above, Follow(D) = {b}
- therefore, Follow(B) = {b}

Follow(C):
- rule 1: C is followed by b, which is a terminal
- rule 6: C is followed by B, which is a variable, so add First(B) to Follow(C)
    - in the previous section, we found First(B) = {k}
- therefore, Follow(C) = {b, k}

Follow(A):
- rule 6: A is followed by n, which is a terminal
- rule 5: A is the last symbol, so add Follow(C) to Follow(A)
    - from above, Follow(C) = {b, k}
- rule 2: A is the last symbol, so add Follow(A) to Follow(A)
    - since A can derive λ, also add \$ to Follow(A)
    - nothing else is added, because sets don't have duplicates
- therefore, Follow(A) = {n, b, k, \$}

### Parse table construction
Once you have first and follow sets, you can construct a parse table.
The rows are indexed by variables, the columns are indexed by terminals.

A cell at row A and column u contains a rule (LHS → RHS) if:
- u ∈ First(RHS)
- or λ ∈ First(RHS) and u ∈ Follow(LHS)

#### Example
Take the grammar with rules:

1. A → DbCbz
2. A → dzzzA
3. A → λ
4. B → kkdb
5. C → kzeA
6. D → AneCB

Rule 1:
- First(DbCbz) = First(D) = {d, n}
- therefore, it will be in row A, at columns d and n

Rule 2:
- First(dzzzA) = d
- therefore, it will be in row A, at column d

Rule 3:
- First(λ) = λ
- Follow(A) = {n, b, k, \$}
- therefore, it will be in row A, at columns n, b, k, and \$.

Rule 4:
- First(kkdb) = k
- therefore, it will be in row B, at column k

Rule 5:
- First(kzeA) = k
- therefore, it will be in row C, at column k

Rule 6:
- First(AneCB) = First(A) = {λ, d, n}
- because λ ∈ First(A), add n to First(AneCB). But it's already part of the set.
- therefore, the rule will be in row D, at columns d and n.

The resulting parse table:

|   | b     | d                      | n                  | k        | z | \$    |
|---|-------|------------------------|--------------------|----------|---|-------|
| A | A → λ | A → DbCbz<br>A → dzzzA | A → DbCbz<br>A → λ | A → λ    |   | A → λ |
| B |       |                        |                    | B → kkdb |   |       |
| C |       |                        |                    | C → kzeA |   |       |
| D |       | D → AneCB              | D → AneCB          |          |   |       |

This table could not yet be used for LL(1) parsing, as there are cells containing more than one rule.
