+++
title = 'Intro'
+++

## Intro
Circuit switching: physical channel carrying stream of data, no routing

Packet switching: message in short packets, each handled separately, packets store/queued in routers and forwarded to appropriate neighbor

Network performance metrics:
- bandwidth: max rate of data transfer across given network path
- latency: amount of time it takes to deliver data from source to destination

Network reliability considerations:
- end-to-end argument: if a function can only be correctly implemented end-to-end, it must be implemented in the end systems.
- fate-sharing principle: store critical system state at nodes which rely on that state, so the only way to lose that state is if the node that relies on it fails, in which case it doesn't matter
- packet vs. circuit switching: packet is better than circuit in terms of resilience and efficiency, circuit is better than packet in terms of predictable performance
