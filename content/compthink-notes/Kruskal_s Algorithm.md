+++
title = "Kruskal's Algorithm"
+++
# Kruskal's Algorithm
Used to find minimum spanning tree
Faster in sparse graphs, does not need the graph to be connected.

Steps:
1. Removes all loops and parallel edges except one with least weight.
2. Create edge table.
3. Sort all the edges in increasing order of their weight.

4. Pick the smallest edge. Check if it forms a cycle with the spanning tree formed so far. If cycle is not formed, include this edge. Else, discard it.

5. Repeat step #4 until there are (V-1) edges in the spanning tree.
