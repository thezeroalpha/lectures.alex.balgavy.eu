+++
title = 'Fault tolerance'
+++
# Fault tolerance
A process may crash -- unexpectedly stop executing events.

Assume network is complete -- there's a bidirectional channel between any two processes.
So process crashes never make remaining network disconnected.
Assume crashing of processes can't be observed.

## Consensus
Binary consensus
- initially all processes randomly select 0 or 1
- eventually all alive processes uniformly decide 0 or 1

Assumptions:
- validity: if all processes randomly select same initial value b, then all alive processes decide b
- k-crash consensus: at most k processes may crash

No algorithm for 1-crash consensus always terminates.

b-potent set S of processes: if by only executing events at processes in S, some process in S can decide b

No Las Vegas algorithm for k ≥ N/2 consensus

### Bracha-Toueg crash consensus algorithm
Let k < N/2.
- initially each alive process randomly selects 0 or 1, with weight 1
- in round n, at each alive undecided process p:
    - p sends [n, value(p), weight(p)] to all processes including itself
    - p waits until N-k messages [n, b, w] have arrived (dismisses/stores messages from earlier/future rounds)
        - if w > N/2, then value(p) = b
        - else, value(p) = 0 if most messages voted 0, value(p) = 1 otherwise
        - weight(p) = number of incoming votes for value(p) in round n
    - if w > N/2 for more than k incoming messages, then p decides b
- if p decides b, it broadcasts [n+1, b, N-k] and [n+2, b, n-k] and terminates

Let k < N/2.
This is a Las Vegas algorithm that terminates with probability 1.

## Failure detection
Failure detector at process tracks which process have (or may have) crashed.
Given an upper bound on network latency and heartbeat messages, one can implement a failure detector.
For this setting, terminating crash consensus algorithms exist.

Assume time domain with total order.
- F(t) is set of crashed processes at time t ("failure pattern")
- t1 < t2 ⇒ F(t1) ⊆ F(t2)
- Assume processes can't observe F(t).

H(p, t) is set of processes that p suspects to be crashed at time t ("failure detector history")

Require that failure detectors are complete: from some time onward, each crashed process is suspected by each alive process.

"strongly accurate" failure detector: if only crashed processes are ever suspected
- Assumptions:
    - each alive process broadcasts `alive` every v time units
    - dmax is a known upper bound on network latency

- Process from which no message is received for v + dmax time units has crashed

"weakly accurate": if some process is never suspected by any process
- Processes numbered p0..p(N-1)
- Initially, each process randomly selects 0 or 1.
- In round n:
    - pn (if alive) broadcasts its value
    - each process waits
        - for incoming message from pn, in which case it adopts value of pn
        - or until it suspects that pn has crashed
- After round N-1, each alive process decides for its value.

"eventually strongly accurate": if from some time onward, only crashed processes are suspected
- assumptions:
    - each alive process broadcasts `alive` every v time units
    - there is unknown upper bound on network latency
- each process q initially guesses as network latency dq = 1
- if q receives no message from p for v+dq time units, then q suspects that p has crashed
- if q receives a message from a suspected process p, then p is no longer suspected, and dq = dq+1
- let k ≥ N/2, there is no Las Vegas algorithm for k-crash consensus based on eventually strongly accurate failure detector

"eventually weakly accurate": if from some time onward, some process is never suspected
- let k < N/2, eventually weakly accurate failure detector used for k-crash consensus
- Chandra-Toueg k-crash consensus algorithm
    - each process q records last round lu(q) in which it updated value(q)
    - initially value(q) ∈ {0,1} and lu(q) = -1
    - processes numbered p0..p(N-1)
    - round n coordinated by pc with c = n mod N
    - in round n, each alive process q sends [vote, n, value(q), lu(q)] to pc
    - pc (if alive) waits until N-k such messages arrived, and selects one [vote, n, b, l] with l as large as possible
        - value(pc) = b, lu(pc) = n
        - pc broadcasts [value, n, b]
    - each alive process q waits
        - either until [value, n, b] arrives
            - then value(q) = b, lu(q) = n
            - and q sends [ack, n] to pc
        - or until it suspects pc crashed
            - then q sends [nack, n] to pc
    - if pc receives more than k messages [ack, n], then pc decides b and broadcasts [decide, b]
    - an undecided process that receives [decide, b] decides b
- let k < N/2, the Chandra-Toueg algorithm is an always terminating k-crash consensus algorithm
