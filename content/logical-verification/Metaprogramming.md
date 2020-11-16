+++
title = 'Metaprogramming'
+++
# Metaprogramming
You can extend Lean with custom tactics/tools; this is metaprogramming.

## Tactics, tactic combinators
Combinators help if you have to do the same thing multiple times, or recover from failures.

- `repeat`: applies argument repeatedly on all goals until it can't be applied any further
- `iterate`: applies argument repeatedly on first goal until it fails, and then stops
- `<|>` ('orelse'): tries first argument, and if it fails, applies second argument
- `all_goals`: applies argument once to each goal, succeeds only if succeeds on all goals
- `any_goals`: applies argument once to each goal, succeeds if succeeds on any goal
- `try`: transforms argument into tactic that never fails (i.e. try it and if you fail it's ok)
- `solve1`: if argument doesn't prove the goal, fail

## The metaprogramming monad
`meta` lets a function call other metafunctions.
Tactics have access to:
- list of goals as metavariables (`tactic.target`, `tactic.get_goals`)
- the elaborator to elaborate expressions and find their type
- the environment with all declarations and inductive types (`tactic.local_context`, `tactic.get_local ``hypothesis`)
- the attributes (e.g. the list of `@[simp]` rules)

You can print stuff with `tactic.trace`.
`run_cmd` can run a tactic.

For example, we can rewrite `assumption` which looks through all hypotheses in the context and succeeds if it finds one that works with the goal.

```lean
meta def exact_list : list expr → tactic unit
| [] := tactic.fail "no matching hypothesis in environment"
| (h :: hs) :=
    do { tactic.trace "trying",
        tactic.trace h,
        tactic.exact h }
    <|> exact_list hs

meta def my_assumption : tactic unit :=
do
    hs ← tactic.local_context,
    exact_list hs
```

The framework revolves around five main types:
- `tactic`: manages proof state, global context, etc
- `name`: represents structured name
- `expr`: represents expression (term) as abstract syntax tree
    - `expr.var` gets variables based on De Bruijn indices
    - `expr.lam` is a lambda expression
    - `expr.sort` are 'universes' (`Sort 0` is `Prop`, `Sort 1` is `Type`, etc)
    - `expr.local_const` is hypothesis
    - `expr.pi` is used for pi binders (e.g. ∀)
- `declaration`: represents constant declaration, definition, axiom, or lemma
- `environment`: stores all declarations and notations that make up global context

Unelaborated expressions (pre-expressions) omit some information, elaborated expressions have everything.

We can create literal expressions:
- expressions with single backtick must be fully elaborated
- expressions with two backticks are pre-expressions
- expressions with three backticks are pre-expressions without name checking

Similar for names:
- names with single backtick are not checked for existence
- names with two backticks are resolved and checked

Antiquotation lets you embed existing expression into larger expression, using prefix `%%` and name from current context.
You can also use them in pattern matching, like `(%%a + %%b = %%c) ← tactic.target`
