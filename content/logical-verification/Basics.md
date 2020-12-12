+++
title = 'Basics'
template = 'page-math.html'
+++
# Basics
## Type checking

Type checking is done using rules:

Constant:

$\overline{C \vdash c : \sigma}^{\enspace Cst}$ if c declared with type $\sigma$

Variable:

$\overline{C \vdash x : \sigma}^{\enspace Var}$ if $x : \sigma$ occurs in C

Application:

$
\underline{C \vdash t : \sigma \rightarrow \tau \qquad C \vdash u : \sigma}_{\enspace App} \\\\
C \vdash t u : \tau
$

Lambda:

$
C, x : \sigma \vdash t : \tau \\\\
\overline{C \vdash (\lambda x : \sigma, t) : \sigma \rightarrow \tau}^{\enspace Lam}
$

## Lean diagnosis commands
* `#check`: checks the type of something
* `#print`: prints the definition of something
* `#eval`: evaluates something

You can use the placeholder `_`, Lean will help you by telling you what needs to be found.

## Inductive type definitions
For example, arithmethic expressions:

```lean
inductive aexp : Type
| num : ℤ → aexp
| var : string → aexp
| add : aexp → aexp → aexp
| sub : aexp → aexp → aexp
| mul : aexp → aexp → aexp
| div : aexp → aexp → aexp
```

## Function definitions
For example a power function:

```lean
def power : ℕ → ℕ → ℕ
| _ 0 := 1
| m (n+1) := m * (power m n)
```
