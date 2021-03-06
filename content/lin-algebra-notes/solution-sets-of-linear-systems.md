+++
title = 'Solution sets of linear systems'
template = 'page-math.html'
+++

# Solution sets of linear systems
## Homogeneous linear systems
homogeneous: if you can write it in $Ax = 0$ where A is an $m \times n$ matrix and 0 is the zero vector in $\Re^m$
* always has at least one solution (the trivial solution, $x = 0$).
* has a nontrivial solution iff there is a free variable
    * if the equation has only one free variable, the solution is a line through the origin
    * when there are two or more free variables, it's a line through the origin
* solution set is $\text{Span} \{v_1, \ldots, v_p\}$ for suitable vectors

## Parametric vector form
implicit description:
* a simple equation
* e.g. $10x_1 - 3x_2 - 2x_3 = 0$

explicit description (parametric vector form):
* the solution to the equation as a set spanned by u and v
* of the form $x = su + tv$, with $s,t \in \Re$

the solution set of $Ax = 0$ is $x = tv$ with $t \in \Re$.

if $Ax = b$ has a solution, then you get the solution set by translating the solution set of $Ax = 0$ using any particular solution p of $Ax = b$. The set is then $x = p + tv$

Writing a solution set in parametric vector form:
1. Row reduce augmented matrix to echelon form
2. Express each basic variable in terms of any free variables.
3. Write a typical solution x as a vector, with entries depending on the (potential) free variables.
4. Decompose x into a linear combination of vectors using free vars as parameters.

## Linear independence

linearly independent:
* set of vector equations: iff the vector equation has only the trivial solution ($x_1 = x_2 = x_3 = 0$)
* columns of matrix: iff $Ax = 0$ has _only_ the trivial solution
* one vector: iff v is not the zero vector
* two vectors: if neither of the vectors is a multiple of the other

linearly dependent:
* iff at least one of the vectors is a linear combination of the others
* if there are more vectors than entries in each vector
* if the set contains the zero vector

a set is linearly dependent iff it's not linearly independent.

