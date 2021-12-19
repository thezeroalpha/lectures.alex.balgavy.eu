+++
title = 'Machine learning for networking'
+++

## Machine learning for networking
### Video streaming
Dynamic streaming over HTTP (DASH).

Reinforcement learning: reward measures how good an action is, goal is to maximize cumulative reward.

Pensieve: learning-based ABR algorithm
- ABR: adaptive bit rate
- Pensieve learns it through experience
- RL reward is `bitrate - rebuffering - smoothness`
- use large corpus of network traces to train the model

### Network packet classification
Decides action to take based on matched rule.
Solutions:
- hardware-based (e.g. TCAM): fast. but expensive, energy-consuming, hard to scale
- software-based (e.g. decision-tree): scalable, but slow and requires large memory

Existing techniques:
- node cutting: cut space into smaller areas, each area corresponds to leaf in decision tree, match by traveling through decision tree and select rule in matched leaf with highest priority
- rule partitioning: partition space into two parts, build separate decision (sub)tree for each part, match by traveling through decision tree and select rule in matched leaf with highest priority

End-to-end learning: replace decision tree with RL model
- may not need data structure at all
- but cannot guarantee classification correctness, packet inference takes too long, needs specialised hardware

NeuroCuts: use deep reinforcement learning to tackle problem of building decision trees
- action: either cutting node, or partitioning set of rule
- reward: classification time, or memory footprint, or both
- reward delayed and only given when whole tree is built

Naive MDP formulation:
- sequential markov decision process
  - assumes DFS order of building the tree node-by-node
  - action: cut or partition current node
