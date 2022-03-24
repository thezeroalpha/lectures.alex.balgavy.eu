+++
title = 'Advanced Logic'
+++
# Advanced Logic
- [Intro to Modal Logic (operators, frames, models, tautologies)](intro-to-modal-logic-operators-frames-models-tautologies/)
- [Semantics: truth and validity, game semantics for formula validity](semantics-truth-and-validity-game-semantics-for-formula-validity/)
- [Bisimulations](bisimulations/)
- [Model transformations (tree unravelling, bisimulation contraction)](model-transformations-tree-unravelling-bisimulation-contraction/)
- [Formula validity using sequents and tableaux](formula-validity-using-sequents-and-tableaux/)
- [Standard translation: mapping basic modal logic to first-order predicate logic](standard-translation-mapping-basic-modal-logic-to-first-order-predicate-logic/)
- [Proof systems and derivation](proof-systems-and-derivation/)
- [Temporal logic](temporal-logic/)
- [Multi-modal logic](multi-modal-logic/)
- [Program correctness](program-correctness/)
- [Propositional dynamic logic (PDL)](propositional-dynamic-logic-pdl/)
- [Epistemic logic](epistemic-logic/)

Worked exercises:

- [Exercise 1](exercise-1/)
- [Exercise 3](exercise-3/)
- [Exercise 4](exercise-4/)
- [Exercise 5](exercise-5/)
- [Homework 1](homework-1/)
- [Some midterm solutions](some-midterm-solutions/)

I drew the graphs on these pages with [Graphviz](https://graphviz.org/), I used [vim-literate-markdown](https://github.com/thezeroalpha/vim-literate-markdown)'s tangling functionality to quickly extract graph code to separate files.
You can install Graphviz and run e.g. `dot < graph.dot -Tsvg > graph.svg` (also accepts input files as parameters).
Or you can install [PlantUML](https://plantuml.com/), surround the code with `@startdot...@enddot`, and run `plantuml -p -Tsvg < graph.puml > graph.svg`.
