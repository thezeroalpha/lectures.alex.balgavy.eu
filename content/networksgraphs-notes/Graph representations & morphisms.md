+++
title = 'Graph representations & morphisms'
+++
# Graph representations & morphisms
Graph representation

- Adjacency matrix: symmetric. Rows and columns are nodes, cells contain number of edges between nodes
- Incidence matrix: rows are vertices, columns are edges. Cell is 1 if the edge is incident on the vertex.
- Subgraph: H is subgraph of G if V(H) ⊆ V(G) and E(H) ⊆ E(G) and ∀ (u,v) ∈ E(H) there is u,v ∈ V(H)
    - in english: a subgraph of G has a subset of vertices and subset of edges of G

**Homomorphism** is a function ϕ: V(G1) ➝ V(G2) such that for each edge \<u,v> ∈ E(G1) there is an edge <ϕ(u), ϕ(v)> ∈ E(G2)

**Isomorphism** is a *one-to-one function* ϕ: V(G1) ➝ V(G2) such that for each edge \<u,v> ∈ E(G1) there is an edge \<ϕ(u), ϕ(v)> ∈ E(G2). it has to be unique, one-to-one.

- in english: two graphs have essentially the same elements with the same organisation. it’s a structure-preserving mapping.
- Graphs are not isomorphic if:
    - |V(G1)| ≠ |V(G2)|
    - |E(G1)| ≠ |E(G2)|
    - ordered degree sequence of G1 is different from ordered degree sequence of G2
