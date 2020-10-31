+++
title = "State Space Representations Intro"
+++
# State Space Representations Intro
* real world is complex, state space must be _abstracted_ for problem solving
    * abstract states map to sets of real states
    * abstract action maps to combination of real actions
    * abstract solution = set of real paths that are solutions in real world
* there may be multiple different state space representations

Problem-solving agent uses this representation:
1. what are actions to move between states?
2. what are appropriate states & initial states?
3. what is the cost of an action?
4. goal: what are the successful world states?
5. search: determine possible sequences of actions leading to goal, choose 'best' sequence
6. execute: give solution, perform actions

State space representation (example - vacuum cleaner):
* start with real-life problem
* formulate abstract problem (states, actions)
* formulate concrete (clean house) & algorithmic goal (be in state 7 and 8)
* find solution (sequence of actions to get to state 7 or 8)
* execute plan (clean house according to abstract solution)

