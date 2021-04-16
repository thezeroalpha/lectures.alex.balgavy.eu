+++
title = 'Election algorithms & minimum spanning trees'
+++
# Election algorithms
Often leader process needed to coordinate distributed task.
In election algorithm, each computation terminates in configuration where one process is leader.

Assumptions:
- decentralised algorithm, initializers are non-empty set of processes
- all processes have same local algorithms
- process IDs are unique, from totally ordered set

## Chang-Roberts algorithm
directed ring

Initially only initiators active, send message with their ID

Let active process p receive message q
- if q < p, p dismisses the message
- if q > p,  becomes passive, and passes on message
- if q = p, p becomes leader

Passive processes pass on messages.

Complexity:
- worst-case message: O(N²)
- average-case message: O(N·log N)

## Franklin's algorithm
Undirected ring.

Each active process p repeatedly compares own ID with IDs of nearest active neighbors on both sides.

If such a neighbor has larger ID, then p becomes passive.

Initially, initiators are active, noninitiators passive.

Each round, active process p
- sends its ID to its neighbors on either side
- and receives IDs q and r
    - if max{q,r} < p, then p starts another round
    - if max{q,r} > p, then p becomes passive
    - if max{q,r} = p, then p becomes leader

Complexity:
- worst-case message: O(N·log N)

## Dolev-Klawe-Rodeh algorithm
Directed ring.
Comparison of IDs of active process p and its nearest active neighbors q and r is performed at r.

- if max{q,r} < p, then r changes its ID to p, and sends out p
- if max{q,r} > p, then r becomes passive
- if max{q,r} = p, then r announces this ID to all processes.

The process that originally had ID p becomes the leader.

Since message can overtake another message from earlier round, processes maintain round numbers and attach these to their messages.

Complexity:
- worst-case message: O(N·log N)

## Tree election algorithm for acyclic networks
Start with wake-up phase, driven by initiators
- initially, initiators send wake-up message to all neighbors
- when noninitiator receives first wake-up message, it wakes up and sends a wake-up message to all neighbors
- when processes has received a wake-up message from all its neighbors, it starts the election phase

Election phase (local at process p):
- p waits until it received IDs from all neighbors except one, which becomes its parent
- p computes largest ID maxp among received IDs and its own ID
- p sends parent request to its parent, tagged with maxp
- if p receives parent request fromits parent, tagged with q, it computes maxp' (the maximum of maxp and q)
- next p sends info message to all neighbors except its parent, tagged with maxp'
- this info message forwarded through network
- process with id maxp' becomes leader

Complexity:
- message: 2.MN - 2 messages (without wake-up phase)

## Echo algorithm with extinction
Each initiator starts a wave, tagged with its ID

Noninitiators join the first wave that hits them.

At any time, each process takes part in at m ost one wave.

When process p in wave q is hit by wave r:
- if q < r, then p changes to wave r, abandoning all earlier messages
- if q > r, p continues with wave q, dismissing incoming message
- if q = r, then incoming message is treated according to echo algorithm of wave q

If wave p executes a decide event at p, then p becomes the leader.

Complexity:
- worst-case message: O(N·E)

# Minimum spanning trees
Undirected weighted network.

Assume different edges have different weights.

In minimum spanning tree, sum of weights of edges in spanning tree is minimal.

## Fragments
Let F be a fragment, i.e. a connected subgraph of minimum spanning tree M.

Let e be lowest-weight outgoing edge of F.
Then e is in M.

## Kruskal's algorithm
Uniprocessor algorithm for computing minimum spanning trees.
- initially, each node forms separate fragment
- in each step, lowest-weight outgoing edge of fragment is added to spanning tree, joining two fragments

Also works when edges have same weight, though then minimum spanning tree may not be unique.

## Gallager-Humblet-Spira algorithm
Undirected weighted network in which different edges have different weights.

Distributed computation of min spanning tree:
- initially, each process forms a separate fragment
- processes in fragment F together search for lowest-weight outgoing edge ef
- when ef has been found, fragment at other end is asked to collaborate in a merge

Complexity:
- worst-case message: O(E + N·log N)

### Level, name, core edge
Each fragment carries unique name fn and level l.

Its level is maximum number of joins any process in fragment has experienced.

Neighboring fragments F(fn, l) and F' = (fn', l') can be joined:
- l < l' ∧ F →ef F': F ∪ F' = (fn', l')
- l = l' ∧ ef = ef': F ∪ F' = (weight ef, l+1)

Core edge of fragment is last edge that connected two sub-fragments at same level, its end points are core nodes.
Name is the weight.

### Parameters of process
Its state:
- sleep (for noninitiators)
- find (looking for lowest-weight outgoing edge)
- found (reported a lowest-weight outgoing edge to core edge)

Status of its channels:
- basic edge (undecided)
- branch edge (in spanning tree)
- rejected (not in spanning tree)

Name and level of its fragment.

Its parent toward the core edge.

### Initialization
Noninitiators wake up when they receive a connect or test message.

Each initiator, and noninitiator after it has woken up
- sets its level to 0
- sets its lowest-weight edge to branch
- sends (connect, 0) into this channel
- sets its other channels to basic
- sets its state to found

### Joining two fragments
Let fragments F = (fn, l) and F' = (fn', l') be joined via channel pq
- if l < l', then p sent (connect, l) to q
    - q sends (initiate, fn', l', find/found) to p
    - F ∪ F' inherits core edge of F'
- if l = l', then p and q sent (connect, l) to each otehr
    - they send (initiate, weight(p,q), l+1, find) to each other
    - F ∪ F' gets core edge pq

At reception of (initiate, fn, l, find/found), a process stores fn and l, sets its state to find or found, an adopts sender as its parent
- it passes on the message through its other branch edges

### Computing lowest-weight outgoing edge
In case of (initiate, fn, l, find), p checks in increasing order of weight one of its basic edges pq is outgoing, by sending (test, fn, l) to q.

While l > level(q), q postpones processing incoming test message.

Let l ≤ level(q)
- if q is in fragment fn, then q replies reject
    - in this case p and q set pq to rejected
- else, q replies accept

When basic edge accepted, or there are no basic edges left, p stops the search and sets its state to found.

### Reporting to core nodes
- p waits for all its branch edges, except its parent, to report
- p computes minimum λ of (1) these reports and (2)  the weight of its lowest-weight outgoing basic edge (or ∞ if no such channel found)
- p sends (report, λ) to its parent
- if λ < ∞, p stores either branch edge that sent λ, or its basic edge of weight λ

### Termination or changeroot at core nodes
Core nodes receive reports through all their branch edges, including core edge.
- ifemin reported value μ = ∞, the core nodes terminate
- if μ < ∞, the core node that received μ first sends changeroot toward lowest-weight outgoing basic edge (the core edge becomes a regular branch edge)

Ultimately changeroot reaches the process p that reported the lowest-weight outgoing basic edge.

p sets this channel to branch, and sends (connect, level(p)) into it

### Starting join of two fragments
If q receives (connect, level(p)) from p, then level(q) ≥ level(p)

Namely, either level(p) = 0, or q earlier sent accept to p.

- if level(q) > level(p), then q sets qp to branch and sends (initiate, name(q), level(q), find/found) to p
- as long as level(q) = level(p) and qp isn't branch edge, q postpones processing connect message
- if level(q) = level(p) and qp is branch edge, then q sends (initiate, weight(qp), level(q) + 1, find) to p, and vice versa
    - pq becomes core edge

### For election
By two extra messages at very end, core node with largest ID becomes leader.

So this induces an election algorithm for general undirected networks.
We must impose an order on channels of equal weight.
