+++
title = "Dijkstra’s algorithm"
template = "page-math.html"
+++

# Dijkstra’s algorithm

Problem

Shortest path from single source to all others (unlike Computer Networks, which was between two nodes)

Solution
S = {}, Q = {all vertices}
distance to every node is infinity, path to every node is nil

extract the one with shortest distance from Q (source)
add it to S
for each neighbour of extracted node (relax function):

- if its distance is greater than weight of going to it,
- update its distance to (distance of extracted node + weight of edge to neighbour)
- update its path to the extracted node

Complexity
initialize in ϴ(|V|)
init S in constant time
init Q: build priority queue using insert
while loop:

- |V| times extract-min
- |V| times update of S (constant time)

for loop executed in total |E| times with inside update key of v

depends on how priority queue is implemented:

- array: extract-min takes |V| steps, so algorithm in $O(|V|^2+|E|)=O(|V|^2)$
- heap: extract-min in O(log|V|), so algorithm in $O((|V|+|E|)\log{|V|})=O(|E|\log{|V|)$ (more edges than vertices)
