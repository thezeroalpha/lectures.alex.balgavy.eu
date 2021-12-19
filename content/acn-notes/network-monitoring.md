+++
title = 'Network monitoring'
+++

## Network monitoring
Tasks:
- which path id my packet take?
- which rules on the switch did the packet follow?
- how long did the packet queue at each switch?
- who did the packet share the queue with?

In-band network telemetry: leverage programmability of switches to insert monitoring info into packet header along network path

Heavy hitters: network flows that are larger (in number of packets, or bytes) than some fraction *t* of total packets seen on the link or some top *k* flows by size

Space-saving algorithm: counter-based algorithm that uses O(k) counters to track k heavy flows
- properties:
  - no flow counter in the table is ever underestimated
  - min value in the table (`val_r`) is an upper bound on the overestimation error of any counter
  - any flow with true count higher than average table count will always be present in the table
- if flow has appeared in table: hash to flow key, increment corresponding counter
- if flow not contained in table: find the min counter in the table, replace the key with the current flow key, increment the counter

Universal streaming:
- there exists universal approach to estimate G-sum when function `g(*)` is non-decreasing such that g(0) = 0 and g(x) does not monotonically grow faster than x²
- universal sketch construction can be used to estimate G-sum with high probability using poly-logarithmic memory

Item i is a g-heavy hitter if changing its frequency `f_i` significantly affects its G-sum
