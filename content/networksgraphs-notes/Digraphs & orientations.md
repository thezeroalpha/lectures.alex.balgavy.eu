+++
title = 'Digraphs & orientations'
+++
# Digraphs & orientations
Directed graphs:

- to convert graph to digraph, represent each edge with two equally weighted arcs
- digraph D consists of sets V(D) vertices and A(D) arcs
- arc \<u,v> joins vertex u (tail) to head v
- has indegree and outdegree, where the sum of all outdegrees is the same as the sum of all indegrees, which equals the number of arcs in D.
- adjacency matrix is not symmetric
- strict if ∀ u,v: (A[u,v]) ≤ 1 and A(u,u)=0
    - in english: no duplicate edges between vertices, no loops

Connectivity with digraphs:

- strongly connected: there is a directed path "there and back" between any two vertices
- weakly connected: the underlying graph is connected (i.e. if all edges were made undirected, the graph would be connected)
- strongly connected digraphs form strongly connected components
- vertex v is reachable from u if there is a path (u,v)
- algorithm for reachability:
    - Rt(u) is the set of reachable vertices from u, found after t steps.
    - steps:

        1. Set t ← 0 and R0(u) ← {u}
        2. Construct set Rt+1(u) ← Rt(u) Uv ∈ Rt(u) Nout(v)

        3. If Rt+1(u) = Rt(u), stop: R(u) ← Rt(u). Else, increment t and repeat step 2.

Orientations

- orientation of a simple graph is a digraph where you give every edge a direction
- there is strongly connected orientation iff λ(G) ≥ 2
