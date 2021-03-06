+++
title = 'Symmetric matrices'
template = 'page-math.html'
+++

# Symmetric matrices
symmetric if $A^T = A$ (also has to be square)

## Diagonalization of symmetric matrices
If A is symmetric, any two eigenvectors from two different eigenspaces are orthogonal.

An n×n matrix is orthogonally diagonalizable iff A is symmetric.

An n×n matrix A:
* has n real eigenvalues, including multiplicities
* is orthogonally diagonalizable
* dimension of eigenspace for each eigenvalue λ == multiplicity of λ as root of the characteristic equation ($\det (A-\lambda I) = 0$)
* eigenspaces are mutually orthogonal (i.e. eigenvectors corresponding to different eigenvalues are orthogonal)

## Singular value decomposition
singular values: square roots of eigenvalues of $A^T A$, denoted by $\sigma_1, \dots, \sigma_n$ in ascending order. They are also the lengths of vectors $Av_1, \dots, Av_n$.

Suppose $\{v_1, \dots, v_n\}$ is an orthonormal basis for $\Re^n$ consisting of eigenvectors of $A^T A$ in ascending order, and suppose A has r nonzero singular values.
* Then $\{Av_1, \dots, Av_n\}$ is orthogonal basis for Col A, and rank == r.
* Then there exists Σ matrix m×n for which diagonal entries are first r singular values of A, and there exist matrices U (orthogonal, m²) and V (orthogonal, n²) such that $A = U \Sigma V T$.
* Col U are "left singular vectors" of A, Col V are "right singular vectors" of A.

Let A be n², then the fact that "A is invertible" means that:
* $(\text{Col} A)^\perp = \{ 0 \}$
* $(\text{Nul} A)^\perp = \Re^n$
* $\text{Row} A = \Re^n$
* A has n nonzero singular values
