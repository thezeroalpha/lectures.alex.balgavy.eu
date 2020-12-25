+++
title = 'Trees'
+++
# Trees
Tree definitions:

- is a connected, simple, acyclic graph
- a tree T ⊆ G is a spanning tree of G if it covers all vertices
- sink tree — spanning tree optimised for all (v,u)-paths

Theorems/lemmas:

- for any connected G with n vertices, m edges: n ≤ m+1
- a connected G, n vertices, n-1 edges is a tree
- simple graph G is a tree if there is exactly one path between any two vertices
- connected G is a tree iff every edge is a cut edge (a loop is never a cut edge, a cycle has no cut edges)
- a spanning tree is minimal if sum of weights of edges is minimal
- T is spanning tree of G. if e ∈ (E(G) \ E(T)), then T ∪ {e} contains a cycle
- G is weighted connected graph. V1, V2 are nonempty partitions, e is an edge with min weight connecting V1-V2. Then there is a minimum spanning tree containing e.
- G is weighted graph with distinct edge weights, T is its MST, S is a subtree of T, e is lowest-weight outgoing edge of S (incident to exactly one vertex in S). then e ∈ E(T).

Constructing minimum spanning trees (Kruskal):
1. Remove all loops and parallel edges, except one with smallest weight
2. Create edge table in ascending order of weight

3. Pick smallest edge. If it creates a cycle in the graph, discard it. Otherwise, include it.

4. Repeat step 3 until there are n-1 edges in the three. This is the minimum spanning tree.

Prim-Jarnik algorithm:
1. Select any vertex as first of T

2. Consider which edge connects vertices in T to vertices outside T. Pick the one with minimum weight. Add edge and vertex to T.

3. Repeat step 2 until T has every verrtex of G.
