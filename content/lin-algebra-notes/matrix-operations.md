+++
title = 'Matrix operations'
template = 'page-math.html'
+++

# Matrix operations
$a_{ij}$ is the entry in the ith row and jth column of A

diagonal entries are $a_{11}$, $a_{22}$, etc. and form the main diagonal. if non-diagonal entries are zero, then it's a diagonal matrix.

equal matrices have same size _and_ their corresponding entries are equal.

## Sums and scalar multiples
sum A+B: sum corresponding entries in A and B.

scalar multiple $rA$ is matrix whose columns are r times the corresponding columns in A (with r scalar).

the usual rules of algebra apply to sums and scalar multiples of matrices.

when matrix B multiplies vector x, it transforms x into vector $Bx$. if $Bx$ is multiplied by A, the result is $A(Bx)$. $A(Bx)$ is produced from x by composition of mappings, which can be represented as multiplication by a single matrix AB.

$A(Bx) = (AB)x$

$AB = A \begin{bmatrix} b_1 & b_2 & \dots & b_p \end{bmatrix} = \begin{bmatrix} Ab_1 & Ab_2 & \dots & Ab_p \end{bmatrix}$

A is matrix, B is matrix with columns $b_1 \dots b_p$.

each column of AB is a linear combination of columns of A using weights from corresponding column of B. AB has the same number of rows as A and same number of columns as B. if the number of columns of A does not match number of rows of B, the product is undefined. in general, AB ≠ BA.

if product AB is defined, then:

$(AB)\_{ij} = a\_{i1} b_{1j} + a_{i2} b_{2j} + \dots + a_{in} b_{nj}$

$row_i (AB) = row_i (A) \times B$

a nifty trick: if multiplying matrix m×n by matrix n×o, the product will be a matrix m×o.

## Powers of a matrix
$A^k = \underbrace{A \dots A}_{k}$

with $A$ an n × n matrix and k a positive integer.

## Transpose of a matrix
a matrix $A'$ whose columns are made up of the corresponding rows of $A$

properties:
* $(A^T)^T = A$
* $(A+B)^T = A^T + B^T$
* $(rA)^T = rA^T$ with r a scalar
* $(AB)^T = B^T A^T$

the transpose of a product of matrices == product of their transposes in reverse order

## Inverse of a matrix
invertible (singular) if there is same size matrix C such that $CA = I$ and $AC = I$ where I is the n × n identity matrix.

identity matrix: a matrix where the diagonals are all 1.

C is uniquely determined by A, so: $A^{-1} A = I$.

let $A = \begin{bmatrix} a & b \\\\ c & d \end{bmatrix}.$ if $ad - bc \ne 0$ then $A^{-1} = \frac{1}{ad - bc} \begin{bmatrix} d & -b \\\\ -c & a \end{bmatrix}$

determinant: $\det A = ad - bc$

if A is invertible (determinant is not 0), then for each $b \in \Re^n$ the solution of $Ax = b$ is $A^{-1} b$.

properties of inverse:
* $(A^{-1})^{-1} = A$
* $(AB)^{-1} = B^{-1} A^{-1}$ (watch out for order!)
* $(A^T)^{-1} = (A^{-1})^T$

finding $A^{-1}$:
* Row reduce augmented matrix $\begin{bmatrix} A & I \end{bmatrix}$.
* if A is row equivalent to I, then $\begin{bmatrix} A & I \end{bmatrix}$ is row equivalent to $\begin{bmatrix} I & A^{-1} \end{bmatrix}$
* otherwise, A doesn't have an inverse.

## Elementary matrices
elementary matrix: obtained by performing single elementary row operation on identity matrix

if elementary row operation is performed on m × n matrix A, result is EA, with E an m × m matrix obtained by performing same row operation on $I_m$

inverse of any elementary matrix E is of same type that transforms E back into I.

an n² matrix A is only invertible if A is row equivalent to $I_n$. any sequence of elementary operations reducing A to $I_n$ also transforms $I_n$ into $A^{-1}$.

