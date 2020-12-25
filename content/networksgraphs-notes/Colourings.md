+++
title = 'Colourings'
+++
# Colourings
“colouring” is a way of labelling a graph

Edge colourings

- assign colours to edges such that edges incident on same vertex always have different colours
- a simple graph is k-edge colourable if E(G) can be partitioned into sets E1…Ek such that each pair of distinct edges in an E(1..k) isn’t incident to same vertex
- edge chromatic number Χ’(g) is minimal k for which G is edge-colourable
- Χ’(G) = Δ(G) or Δ(G) +1
    - Δ(G) is maximum degree in graph

Vertex colourings

- simple graph..same as edge but with vertex
- Χ(G) chromatic number is minimal k for which G is k-vertex colourable
- Χ(G) ≤ Δ(G) + 1
- for any planar graph G, Χ(G) ≤ 4
    - weaker bound: for any planar G, Χ(G) ≤ 5
    - the proof for weaker bound can be asked
