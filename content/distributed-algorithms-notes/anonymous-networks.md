+++
title = 'Anonymous networks'
+++
# Anonymous networks
Anonymous network: processes and channels have no unique ID

Many reasons:
- transmitting/storing is too expensive
- they don't want to reveal ID
- they don't have unique hardware ID

## Election
There is no election algorithm for anon rings that always terminates.

An execution is fair if each event that's applicable in infinitely many configurations occurs infinitely often in computation.
- each election algorithm for anon rings has fair infinite execution

Probabilistic algorithm: process flips a coin and performs event based on the outcome
- Las Vegas: if probability that terminates is greater than zero & all terminal configurations are correct
- Monte Carlo: always terminates, probability that a terminal configuration is correct is greater than zero

### Itai-Rodeh algorithm
Given anonymous directed ring.

Adopt Chang-Roberts algorithm:
- each initiator sends out ID, random from {1...N}
- largest ID is only one making a round trip
- each message supplied with hop count
    - message that arrives at its source has hop count N
- if several processes select same ID, they start new election round, with higher round number

Steps:
- in round 0, initiators active, noninitiators passive
- let p be active. at start of election round n:
    - p randomly selects id(p)
    - and sends [n, id(p), 1, false] = [round, ID, num hops, bool has encountered another process with same ID]
    - if p receives:
        - n' > n, or n' = n and i > id(p)
            - then p becomes passive and sends (n', i, h+1, b)
        - n' < n, or n' = n and i < id(p)
            - then p dismisses the message
        - hops < N
            - then p sends (n, id(p), hops+1, true)
        - bool true, hops N
            - then p proceeds to round n + 1
        - bool false, hops N
            - then p becomess the leader
- passive processes pass on messages, increasing hop count by 1

Complexity:
- average-case message: O(N·log N)

### Election in arbitrary anon networks
Echo algorithm with extinction, with random selection of IDs, can be used for election in anon undirected networks, in which *all processes know network size*.

In round 0, initiators active, noninitiators passive.

Each active process selects random ID, and starts a wave, tagged with its ID and round number 0.

Let process p in wave i of round n be hit by wave j of round n':
- if n' > n, or n' = n and j > i
    - then p adopts wave j of round n', and treats message according to echo algorithm
- if n' < n, or n' = n and j < i
    - then p dismisses the message
- if n' = n and j = i
    - then p treats the message according to echo algorithm

Each message sent upwards in constructed tree reports size of it subtree.
All other messages report 0.

When process *decides*, it computes size of constructed tree.
- if tree covers network, it becomes the leader
- else, selects new ID, initiates new wave in the next round

No Las Vegas algorithm to compute size of anon ring (⇒ no Las Vegas algorithm for election in anon ring *if processes don't know ring size*)

### Itai-Rodeh ring size algorithm
Each process p has estimate est(p) of ring size.
Initially est(p) = 2.

p initiates estimate round at start of algorithm, and at each update of est(p).

Each round, p selects random id(p) in {1..R}, sends [est(p), id(p), 1], and waits for message [est, id, h]
- est < est(p)
    - then p dismisses message
- est > est(p)
    - h < est
        - then p sends [est, id, h+1], and est(p) = est
    - h = est
        - then est(p) = est + 1
- est = est(p)
    - h < est
        - then p ends [est, id, h+1]
    - h = est and id ≠ id(p)
        - then est(p) = est + 1
    - h = est and id = id(p)
        - then p dismisses the message

Complexity:
- worst-case message: O(N³)

### IEEE 1394 election algorithm
IEEE 1394 standard is serial multimedia bus, connecting digital devices which can be added/removed dynamically.
Anonymous because transmitting/storing IDs is too expensive.
Network size is unknown to process.
Tree algorithm for undirected acyclic networks is used.
Networks that contain cycle give a timeout.

- when process has one possible parent, it sends parent request to this neighbor
    - if accepted, an ack is sent back
- last two parentless processes can send parent requests to each other simultaneously ("root contention")
    - each of them randomly decides to either immediately send another request, or wait some time before request
