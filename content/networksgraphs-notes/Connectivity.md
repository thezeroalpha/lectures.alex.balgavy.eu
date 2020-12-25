+++
title = 'Connectivity'
template = 'page-math.html'
+++
# Connectivity

- vertices u,v are connected if there is a (u,v) path between them
- graph is connected if all pairs of vertices are connected
- graph is k-connected if κ(G) ≥ k
- graph is k-edge-connected if λ(G) ≥ k
- graph is optimally connected if λ(G) = κ(G) = min { δ(v) | v ∈ V(G) }
- a component of G is a connected subgraph that isn’t contained in another connected subgraph of G

Vertex & edge cuts

- V* ⊂ V(G) is vertex cut if removing vertices V* disconnects the graph
- E* ⊂ E(G) is edge cut if removing edges E* disconnects the graph
- κ(G) is size of minimal vertex cut for G — the amount of vertices needed to disconnect G
- λ(G) is size of minimal edge cut for G — the amount of edges needed to disconnect G
- $\kappa_{G} \leq \lambda (G) \leq \min_{v \in V(G)} {\delta (v)}$
    - in english, min vertex cut ≤ min edge cut ≤ smallest degree in graph

Menger’s theorem:

- Let G be a connected graph, with u and v two non-adjacent vertices.
- formal: “The minimum size of a vertex cut disconnecting nonadjacent vertices u ≠ v equals the maximum size of a vertex-independent set P(u,v). The minimum size of an edge cut disconnecting vertices u ≠ v equals the maximum size of an edge-independent set P(u,v)."
- in english: the min number of vertices you need to remove to split vertices u and v into different components of the graph == the max number of paths from u to v that don’t share vertices. same shit for edges.
- [This is a good video explanation.](https://www.youtube.com/watch?v=dUAeleBMRCQ)

Harary graphs:

- k-connected graphs, of the form Hk,n
- forming a harary graph Hk,n:
    - place n vertices around a circle
    - if k is even — make each vertex adjacent to k/2 neighbours in each direction around circle
    - if k is odd and n is even — make each vertex adjacent to (k-1)/2 neighbours in each direction, and diametrically opposite vertex
    - if k is odd and n is odd — make each vertex adjacent to (k-1)/2. then index nodes by integers mod n, and connect node to integer+(n-1)/2 for 0≤integer≤(n-1)/2
        - yes, one node will have an even degree — the one labelled (n-1)/2
