+++
title = 'Grammars'
+++
# Grammars
A grammar defines the syntax of the input. We can then write a program implementing the rules of that grammar.

For a calculator, a grammar looks like this:

```
Expression:
  Term
  Expression “+” Term
  Expression “-“ Term
Term:
  Primary
  Term “*” Primary
  Term “/“ Primary
  Term “%” Primary
Primary:
  Number
  “(“ Expression “)”
Number:
  floating-point-literal
```
