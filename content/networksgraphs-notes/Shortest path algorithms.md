+++
title = 'Shortest path algorithms'
+++
# Shortest path algorithms
Arcs in digraphs may carry negative weights. if there’s a cycle of negative weight, there are no shortest paths. Otherwise, there might be.

Dijkstra’s (non-negative weights)

- used for link-state routing
- fails if there are negative weights
- to implement efficiently, you need Fibonacci heap data structure
- the goal is shortest path to a node from every other node
- algorithm (given that c is goal):

    1. Svisited = {}, Hunvisited = {a,b,…}, Cgoal(0, F)

        - add goal to visited, remove from unvisited
        - S = {c}
        - H = {a,b,d,e,f,g,h}
        - find neighbours of added node that have edges pointing to it — b(1,c), e(2,c)
        - choose lowest weight edge, add that node into visited set — b(1,c)
        - current distances:
            - b(1,c)

    2. S = {b,c}, H = {a,d,e,f,g,h}

        - find neighbours of added node that have edges pointing to it —a(2,b),c(1,b)
        - c is visited, no other neighbours, so select a.
        - add a to set, update distance.
        - distance to c = b(1,c) + (distance a=>b) = b(1,c)+a(2,b) = a(3,c)
        - current distances:
            - b(1,c)
            - a(3,c)

    3. S = {a,b,c}, H = {d,e,f,g,h}

        - find neighbours of added node that have edges pointing to it —b(2,a), d(1,a)
        - b is visited, no other neighbours, so select d.
        - add d to set, update distance.
        - distance to c = a(3,c) + (distance d=>a) = a(3,c) + d(1,a) = d(4,c)
        - current distances:
            - b(1,c)
            - a(3,c)
            - d(4,c)

    4. S = {a,b,c,d}, H = {e,f,g,h}

        - etc.

Bellman-Ford algorithm

- allows weights to be negative
- max n-1 iterations (with checking for negative cycle)
- computes shortest path in rounds. each round tells you how many edges you can walk to reach the goal.
- [this one is best explained with a video, which shows how to fill in one of the rows (you just have to make one row for each node)](https://www.youtube.com/watch?v=obWXjtg0L64&index=8&list=PL8WcC83XRlKJHk_bQLE-mEQRvdpflxHG2)
