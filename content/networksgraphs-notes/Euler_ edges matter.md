+++
title = 'Euler: edges matter'
+++
# Euler: edges matter
mnemonic: Euler starts with E, so edges matter.

Euler tour

- traverses each edge exactly once, start=end
- A connected graph has Euler tour iff all vertices have even degrees
- Fleury’s algorithm for Euler tour:

    1. Trail P consists of single vertex u
    2. While E(P) ≠ E(G) do:
        1. Let v be last vertex added to P
        2. choose an edge <v,w> in (G-E(P)).

            - <v,w> is only allowed to be a cut edge if there is no other option.

        3. add it to P

- Hierholzer’s algorithm for Euler tour
    - First, find a closed trail from some vertex
    - for each vertex *u* that has adjacent edges that are not part of the trail, find a closed trail on that vertex (starting and ending in *u*), then add the trail to the tour
    - [surreal video explaining this](https://www.youtube.com/watch?v=3k5_oooad8U)

Euler trail

- traverses each edge exactly once, but is open
- connected graph G has Euler trail iff it has exactly 2 vertices of odd degree

Chinese postman problem (also, Bridges of Konigsberg)

- problem:
    - in weighted graph, each edge has real-valued weight
    - all edges are passed at least once, total travelled dist is minimal
    - find closed walk of minimal length
- Solution:
    - let G be connected, weighted graph
    - Let v1, …, v2k be odd degree vertices in G
    - Algorithm:

        1. For each pair of distinct odd-degree vertices vi and vj, find minimum-weight path Pij

        2. Construct weighted complete graph on 2k vertices in which vertex vi and vj are joined by an edge having weight w(Pij)

        3. Find set E of k edges {e1, …, ek} such that:

            - the sum of their weights is minimal
            - no two edges are incident on same vertex

        4. For each edge e ∈ E, with e=<vi, vj>, duplicate edges of Pi,j in graph G

        5. Find Euler tour in resulting graph
