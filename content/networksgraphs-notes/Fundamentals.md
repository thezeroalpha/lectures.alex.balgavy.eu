+++
title = 'Fundamentals'
+++
# Fundamentals
**Basic definition**
Graph G: consists of V(G) set of vertices and E(G) set of edges
Edge: consists of vertices u and v, denoted by (u, v)

For vertex u ∈ V(G), neighbour set N(u) is set of vertices adjacent to u

Simple graph: does not have multiple edges between pairs, or loops

Bipartite graph: where you can partition vertices into two subsets, with no edge incident to vertices from same subset

Tree: graph that has no cycles
Degree δ(v): number of edges on node, loops are counted twice.

Degree sequence: list of all vertices’ degrees in a graph. Ordered if it’s in descending order

Handshaking lemma: sum of degrees of all vertices in a graph is twice the number of edges in the graph

**Traversal definitions**
Least to most strict:

- walk: a sequence of vertices and edges (closed or open)
- trail: a walk with no repeating edges (open)
- tour: a walk with no repeating edges, start=end (closed)
- path: a walk with no repeating vertices or edges (open)
- cycle: a walk with no repeating vertices or edges, start=end (closed)

for digraphs, everything’s the same, just directed.

**Degree sequence**

Sequence of numbers is graphic if it’s a degree sequence of a simple graph (could also have other non-simple)

Show that a sequence is graphic — Havel-Hakimi theorem:

- Given sequence: (1, 2, 1, 3, 3, 2, 3, 5)
- Order it descending: (5, 3, 3, 3, 2, 2, 1, 1)
- Systematically remove vertices from start, subtract one from the rest:

    1. (2, 2, 2, 1, 1, 1, 1) — remove ‘5', subtract 1 from the next 5 elements
    2. (1, 1, 1, 1, 1, 1) — remove ‘2', subtract 1 from the next 2 elements'

    3. (1, 1, 1, 1, 0) — remove ‘1', subtract 1 from the next 1 element, reorder

    4. (1, 1, 0, 0) — remove ‘1', subtract 1 from the next 1 element, reorder
    5. (0, 0, 0) — remove ‘1', subtract 1 from the next 1 element, reorder
    6. All ‘0', therefore sequence is graphic.
