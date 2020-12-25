+++
title = 'Cheat sheet of stuff I always forget'
+++
# Cheat sheet of stuff I always forget
γ = 0.5772

Harary:

- forming a harary graph Hk,n:
    - if k is odd and n is odd — make each vertex adjacent to (k-1)/2. then index nodes by integers mod n, and connect node to integer+(n-1)/2 for 0≤integer≤(n-1)/2
    - yes, one node will have an even degree — the one labelled (n-1)/2

ranked embedding — choose an arbitrary vertex u, rank other vertices by distance from u, put vertices on separate lines based on ranking

Euler’s formula for planar graphs:

- n-m+r=2
- n vertices, m edges, r regions

condition for planar graph: m ≤ 3v-6

a graph is a tree if:

- n vertices, n-1 edges
- there is exactly one path between any two vertices
- every edge is a cut edge (a loop is never a cut edge, a cycle has no cut edges)

ε(u) — eccentricity. longest shortest path from u and to any other vertices
rad(G) — radius. minimum eccentricity

clustering — when many neighbours of vertex are also each other’s neighbours
defined by:
![](b4b87ec0ce315950a62924d62df888ee.png)
where mv is number of links between neighbours of v.

network transitivity τ(G) = nΔ(G) / ntriple(G)

vertex centrality of u cE(u) = 1 / ε(u)
betweenness centrality of u cB(u) = sum |S(x,u,y)| / |S(x,y)| for x≠u≠y

- S(x,y) — set of shortest paths between x and y
- S(x,u,y) — shortest paths passing through u, S(x,u,y) ⊆ S(x,y)

closeness of u cc(u) = 1 / (sum d(u,v) for all v in G)

**Random graphs**
ER(n,p):

- n vertices, edge exists with probability p
- expected clustering coefficient is p
- phase transition around p=1/n — a gigantic connected component appears

![](c431ee85c43c929032eb392cded1616a.png)

WS(n,k,p):

- construct Hn,k , replace edges with probability p
- “small world” — high clustering coefficients
    - CC(G) ≈ 0.75 for G ∈ WS(n,k,0)

BA(n, n0, m):

- n vertices, m edges
- preferential attachment (a new node is more likely to connect to nodes with high degrees) leads to hubs
- P(v is linked to u) = ![](d71e93e105d62545e21d174c115bcae8.png)

**Communities**

proximity prestige: (fraction of vertices that can reach v) / (average distance of those vertices to v)

a signed graph (edges labelled +/-) is balanced if all its cycles are positive (product of edge labels is positive)

signed graph is balanced iff its vertices can be partitioned into two disjoint subsets such that:

- each negative edge joins the subsets, and
- each positive edge joins vertices in the same subset

affiliation networks are naturally bipartite, with two sets (Va actors, Ve events)
