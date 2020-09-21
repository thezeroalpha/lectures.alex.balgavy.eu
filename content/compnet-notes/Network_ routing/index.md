+++
title = "Network: routing"
+++

# Network: routing
**Routing — from point A to point B**
Important properties (there is often a trade-off):
1. Correctness
2. Simplicity
3. Robustness
4. Stability
5. Fairness
6. Efficiency

Methods of routing

- Distance vector routing
    - send distance vector to neighbours (distance to all nodes)
    - use incoming distance vectors to build a routing table:

![screenshot.png](01fa6d1e957a499ffa8f1941a6d59d59.png)

    - however, when a machine fails, it leads to a count to infinity problem
- Link state routing
    - routers only send packets with info about direct neighbours
    - these packets are flooded (sent to everyone)
    - routers build overview of network using those packets, with a shortest path algorithm (Dijkstra)

![screenshot.png](1d4ae13f6dc2207b606de35707c729b5.png)

- no count to infinity problem, but more complicated
- Hierarchical routing
    - route to groups of nodes instead of individual nodes
    - good for large networks

![screenshot.png](6c186bbc88a8d4c2a2549881d5024f2b.png)
