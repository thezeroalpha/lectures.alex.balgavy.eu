+++
title = 'Routing'
+++

# Routing
Guiding a packet in network to its destination.

Routing table at node u stores for each v a neighbor w of u.
Packets with destination v that arrive at u re passed to w.

## Chandy-Misra shortest path algorithm
Undirected weighted network with positive weights.
Centralised algorithm to compute shortest paths to initiator u₀.

Initially:
- dist(u₀, u₀) = 0
- dist(v, u₀) = ∞ for othe nodes
- parent(v, u₀) = ⊥ for all v

u₀ sends message ⟦0⟧ to its neighbors

node v receives ⟦d⟧ from neighbor w. if d + wt(v, w) < dist(v, u₀), then
- dist(v, u₀) = d + wt(v, w) and parent(v, u₀) = w
- v sends ⟦dist(v, u₀)⟧ to its neighbors (except w)

Termination detection by e.g. Dijkstra-Scholten

Complexity:
- worst-case message; exponential
- worst-case messag efor minimum-hop: O(N²·E)

...

## Merlin-Segall shortest path algorithm
Centralised algorithm to compute shortest paths to initiator u₀.

Initially, dist(u₀, u₀) = 0, dist(v, u₀) = ∞ for other nodes, and parent(v, u₀) values form sink tree with root u₀.

Each round, u₀ sends ⟦0⟧ to its neighbors.
1. let node v receive ⟦d⟧ from neighbor w.
    - if d + wt(v, w) < dist(v, u₀), then dist(v, u₀) = d + wt(v, w)
        - v stores w as future value for parent(v, u₀)
    - if w = parent(v, u₀), then v sends ⟦dist(v, u₀⟧ to its neighbors except parent(v, u₀).
2. When a v ≠ u₀ has received message from all neighbors, it sends ⟦dist(v, u₀)⟧ to parent(v, u₀) and updates parent(v, u₀).

u₀ starts a new round after receiving a message from all neighbors.

Complexity:
- message: Θ(N²·E)

Topology changes:
- number attached to distance messages
- when edge fails or becomes operational, adjacent nodes send message to u₀ via sink tree
- when u₀ receives such a message, it
    - rebuilds sink tree
    - starts new set of N-1 rounds, with higher number

## Floyd-Warshall all-pairs shortest path algorithm
Initially, S = ∅ (S is explained in the next section).

While S doesn't contain all nodes, a pivot w ∉ S selected:
- d[S ∪ {w}] computed from d[S]
- w is added to S

When S contains all nodes, d[S] is standard distance function.

Complexity:
- time: Θ(N³)

## Toueg's algorithm
Computes for each pair (u,v) a shortest path from u to v

dS(u, v), with S set of nodes, denotes length of shortest path fro u to v with all intermediate nodes in S
- d[S](u, u) = 0
- d[∅](u, v) = wt(u, v) for two different nodes connected by an edge
- d[∅](u, v) = ∞ for two different nodes not connected by an edge
- d[S ∪ {w}](u, v) = min{ d[S](u, v), d[S](u, w) + d[S](w, v)} if w not in S

When S contains all nodes, d[S] is the standard distance function

Assume each node knows the IDs of all nodes

Initially at each node u:
- S(u) = ∅
- dist(u, u) = 0 and parent(u, u) = ⊥
- for each other node,
    - either dist(u, v) = wt(u, v) and parent(u, v) = v if there is an edge uv,
    - or dist(u, v) = ∞ and parent(u, v) = ⊥


At w-pivot round, w broadcasts its values dist(w, v) for all nodes v.

If parent(u, w) = ⊥, for a node u ≠ w at the w-pivot round, then dist(u, w) = ∞, so dist(u, w) + dist(w, v) ≥ dist(u, v) for all nodes v.

Hence the sink tree toward w can be used to broadcast dist(w)

If u is in sink tree toward w, it sends ⟦request, w⟧ to parent(u, w), to let it pass on dist(w).

If u isn't in sink tree towards w, it proceeds to next pivot round, with S(u) = S(u) ∪ {w}

Consider any node u ni sink tree toward w:
- if u ≠ w, it waits for values dist(w, v) from parent(u, w)
- u forwards values dist(w, v) to neighbors that send ⟦request, w⟧ to u
- if u ≠ w, it checks for each node v whether dist(u, w) + dist(w, v) < dist(u, v)
    - if yes, dist(u, v) = dist(u, w) + dist(w, v) and parent(u, v) = parent(u, w)
- finally, u proceeds to next pivot round, with S(u) = S(u) ∪ {w}

Complexity:
- message: O(N²)

## Distance-vector routing
Network in which nodes/links may fail or be added.
Such a change is eventually detected by its neighbors.

If topology change is detected, a node sends its entire routing table to its neighbors.
Each node locally computes shortest paths.

## Link-state routing
Nodes periodically send link-state packet, with
- node's edges and their weights (based on latency, bandwidth)
- sequence number (increases with each broadcast)

- Link-state packets are flooded through the network
- Nodes store link-state packets to obtain view of the entire network
- sequence numbers avoid old info overwriting new info
- each node locally computes shortest paths, e.g. with Dijkstra's

When node recovers from crash, its sequence number starts at 0
- so packets carry time-to-live (TTL) field
- after this time, info from packet may be discarded by packet with lower sequence number
- to reduce flooding, each time a link-state packet is forwarded, its TTL field decreases
    - when it becomes 0, the packet is discarded

## Autonomous systems
RIP protocol uses distance-vector routing

OSPF protocol uses link-state routing

These routing algorithms don't scale to the internet because of sending whole routing tables, or flooding.
So, internet divided into autonomous sytems, where each system uses RIP or OSPF.

Border Gateway Protocol routes between autonomous systems.
- border routers broadcast updates of their routing tables (like Chandy-Misra)
- border router updates its routing table
    - because it detects topology change
    - or because of update in routing table of neighbor

You can still get deadlock, if you fill up memory at the nodes.

## Slow-start with TCP
TCP protocol provides reliable packet delivery.

To avoid congestion, nodes maintainn congestion window for each of their edges.
This is the max number of unacknowledged packets on this edge.

Congestion window grows linearly with each received ack, up to some threshold.

With each lost data packet, the congestion window is reset to initial size (TCP Tahoe) or halved (TCP Reno)
