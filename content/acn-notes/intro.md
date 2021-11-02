+++
title = 'Intro'
+++

# Intro

Circuit switching:
- physical channel with stream of data from source to destination
- three phases: set up, data transfer, tear down
- data transfer involves no routing
- have to reserve circuits

Packet switching:
- message split into short packets, each handled separately
- one operation - send packet
- packets queued in each router, forwarded to appropriate neighbor

Bandwidth: max rate of data transfer across given network path

Latency: amount of time taken to deliver data from source to destination

Performance metric - flow completion time
- how long does it take to complete traffic flow?
- how long does it take to complete a set of correlated flows?

Network reliability:
- end-to-end argument: "if a function can only be correctly implemented end-to-end, it must be implemented in the end systems."
- fate-sharing principle: to deal with potential failures, store critical system state at nodes which rely on that state. Only way to lose the state is if the node that relies on it fails, at which point it doesn't matter.
  - if you store on network devices, need state to be cleaned up or recreated
- packet vs circuit switching: packet switching is better than circuit switching in terms of *resilience* and *efficiency*. But circuit switching performance is more predictable.
