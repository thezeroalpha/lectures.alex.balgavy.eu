+++
title = 'Program correctness'
+++
## Program correctness
Prove that a program meets its specification.

Correctness specification: formal description of how program is supposed to behave

Program is correct: its executions satisfy the specification

### Verification - Hoare approach
Prove statements of form `{precondition} program {postcondition}`
- pre/postcondition are formulas
- program is a while-program
- we have proof rules for showing {φ} α {ψ}

Partial correctness: if program starts satisfying φ, and if it halts, then when it halts ψ is satisfied

Total correctness: partially correct, and terminates whenever started while satisfying φ
