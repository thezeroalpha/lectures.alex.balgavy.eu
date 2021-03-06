+++
title = 'Vector spaces'
template = 'page-math.html'
+++

# Vector spaces
subspace of $\Re^n$ is any set H in $\Re^n$ that has properties:
a) The zero vector is in H
b) For each u and v in H, the sum $u + v$ is in H
c) For each u in H and each scalar c, the vector $cu$ is in H

the zero subspace is the set that only contains zero vector in $\Re^n$

## Column space and null space of a matrix
column space: set of all linear combinations of the columns of a matrix. it's the _span_ of the columns of the matrix.

column space of m × n matrix is subspace of $\Re^m$

null space: set of all solutions of equation $Ax = 0$.

null space of an m × n matrix is subspace of $\Re^n$.

to determine if p is in Nul A, check if Ap = 0. if so, p is in Nul A.

## Basis for a subspace
basis for subspace H of $\Re^n$ is linearly independent set in H spanning H

the pivot columns of a matrix form the basis for its column space.

## Coordinates
let $H \in \Re^n$ be subspace with $B = \{ b_1, \dots, b_p\}$. then for all x ∈ H, there are unique $c_1, \dots, c_p$ such that $x = c_1 b_2 + \dots + c_p b_p$. (to prove this theorem, use a contradiction on uniqueness)

the coordinates of x w.r.t. B are $c_1, \dots, c_p$.

the coordinate system of x w.r.t. B is $[x]_B = \begin{bmatrix}c_1\\\\ \dots\\\\ c_p\end{bmatrix}$

## Dimension of a subspace
let $H \in \Re^n$ be a subspace with basis $B=\{ b_1, \dots, b_p \}$. then every basis for H comprises p vectors.

the dimension of H is the number of basis vectors in _any_ basis for H.

dim Col A = #pivot columns (rank A)

dim Nul A = #free variables in Ax = 0

Rank theorem: dim Col A + dim Nul A = #columns

