+++
title = 'Orthogonality & least squares'
template = 'page-math.html'
+++

# Orthogonality & least squares
let $u,v \in \Re^n$. orthogonal iff:
* $u \cdot v = 0$
* or $\|u\|^2 + \|v\|^2 = \|u+v\|^2$

## Inner (dot) product & uses
let $u,v \in \Re^n$. then, $u \cdot v = u^T v \in \Re$.

in English, to calculate you just multiply the vectors row-wise, and sum all the results.

Regular algebraic rules apply.

$u \cdot u \geq 0$, only 0 iff u = 0.

### Length of a vector
Let $v \in \Re^n$, then the norm (length) of v is $\|v\| = \sqrt{v \cdot v}$.

Does the norm coincide with length of line segments? Yes:

$x = \begin{bmatrix}a\\\\b\end{bmatrix}, \quad \|v\| = \sqrt{v \cdot v} = \sqrt{a^2 + b^2} = \text{Pythagoras}$

### Distance between vectors
Let $u,v \in \Re^n$. then, $\text{dist}(u,v) = \|u-v\|$.

## Orthogonal complement
Let $W \subset \Re^n$ a subspace, then orthogonal complement of W is $W^\perp = \{x \in \Re^n | x \cdot v = 0 \forall u \in W \}$

properties:
* $(colA)^\perp = (NulA)^T$
* $(NulA)^\perp = (colA)^T$

## Orthogonal sets
a set $\{v_1 \dots v_p\}$ is orthogonal if $v_i \cdot v_j = 0 \forall i,j$. then $\{v_1 \dots v_p\}$ is a basis for $\text{Span}\{v_1 \dots v_p\}$

An orthogonal basis is a basis that is also an orthogonal set

Why orthogonal basis? Let $W \in \Re^n$ be subspace with orthogonal basis $\{u_1 \dots u_p\}$, then $W \ni y = c_1 u_1 + \ldots + c_p u_p$, with $c_i = \frac{y \cdot u_i}{u_i \cdot u_i}$ for i = 1...p.

An orthonormal set/basis is an orthogonal set/basis consisting of unit vectors (like $\{e_1, \ldots, e_n\}\text{ for }\Re^n$).

An m × matrix A has orthonormal columns iff $A^T A = I_n$
* $(Ax) \cdot (Ay) = x \cdot y$
* $\| Ax \| = \| x \|$

## Orthogonal projections
### Orthogonal decomposition
Let W be a subspace of $\Re^n$. Each y in $R^n$ can be written uniquely in $y = \hat{y}+z$ ($\hat{y} \in W,\\; z \in W^\perp$)

If $\{u_1, \ldots, u_p\}$ in orthogonal basis of W, then $\hat{y} = \frac{y \cdot u_1}{u_1 \cdot u_1} u_1 + \ldots + \frac{y \cdot u_p}{u_p \cdot u_p}u_p$

ŷ is an orthogonal projection of y onto W ($proj_w y$)

### Best approximation
Let W be subspace of $\Re^n$, y a vector in $\Re^n$, ŷ an orthogonal projection of y onto W.

Then $\|y-\hat{y}\| < \|y-v\|$

### When basis for W is an orthonormal set
If $\{u_1 \ldots u_p\}$ is orthonormal basis for subspace W of $\Re^n$, then $\text{proj}_w y = (y \cdot u_1)u_1 + \dots + (y \cdot u_p) u_p$

If U = $\begin{bmatrix} u_1 & u_2 & \dots & u_p \end{bmatrix}$, then $\text{proj}_w y = UU^T y \quad \forall y \in \Re^n$

## Gram-Schmidt process
An algorithm for producing orthogonal or orthonormal basis for any nonzero subspace of $\Re^n$.

Given basis $\{ x_1 \dots x_p \}$ for nonzero subspace W of $\Re^n$, define:

$
\begin{aligned}
v_1 &= x_1\\\\
v_2 &= x_2 - \frac{x_2 \cdot v_1}{v_1 \cdot v_1} v_1\\\\
v_3 &= x_3 - \frac{x_3 \cdot v_1}{v_1 \cdot v_1} v_1 - \frac{x_3 \cdot v_2}{v_2 \cdot v_2} v_2\\\\
\vdots \\\\
v_p &= x_p - \frac{x_p \cdot v_1}{v_1 \cdot v_1} v_1 - \dots - \frac{x_p \cdot v_{p-1}}{v_{p-1} \cdot v_{p-1} v_{p-1}}
\end{aligned}
$

Then $\{v_1 \dots v_p\}$ is an orthogonal basis for W.

$\text{Span}\{v_1 \dots v_k\} = \text{Span}\{x_1 \dots x+k\}$ for 1 ≤ k ≤ p.

### QR factorization
If A is an m × n matrix, with linearly independent columns, then A can be factored as $A = QR$, where Q is he m×n matrix whose columns form an orthonormal basis for Col A, and R is n×n upper triangular invertible matrix with diagonal positive entries.

## Least-squares problems
If a solution for $Ax = b$ does not exist and one is needed, try to find the best approximation x for $Ax = b$.

General least-squares problem is to find x that makes $\| b - Ax\|$ as small as possible.

If A is m×n and $b \in \Re^m$, a least-squares solution of $Ax = b$ is $\hat{x} \in \Re^n$ such that $\| b - A\hat{x} \| \leq \| b - Ax \|, \qquad \forall x \in \Re^n$.

Least-square solution set of $Ax = b$ is the same as the solution set for $A^T Ax = A^T b$.

Therefore, $\hat{x} = (A^T A)^{-1} A^T b$.

Given an m×n matrix A with linearly independent columns, let $A = QR$ be a QR factorization of A. Then, for each $b \in \Re^m$, $Ax = b$ has unique least-squares solution:

$\hat{x} = R^{-1} Q^T b$

