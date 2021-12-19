+++
title = 'Data center transport'
+++

## Data center transport
TCP incast problem:
- datacenter application runs on multiple servers
- use a scatter-gather work pattern (client requests data from a bunch of servers, all servers respond)
- commodity switches usually have shallow buffers → queue capacity overrun at switch when data comes back to client
- collision leads to packet loss, which is recognized by servers after a timeout, at which point all servers start again at the same time

Ethernet flow control: pause frame
- overwhelmed ethernet receiver can send "PAUSE" frame to sender
- upon receiving PAUSE frame, sender stops transmission for some amount of time
- but, not designed for switches, and blocks all transmission at port-level

Priority-based flow control
- 8 virtual traffic lanes, one can be selectively stopped
- timeout is configuration
- but, only 8 lanes, unfairness, and deadlocks in large networks

### DCTCP
- pass information about switch queue buildup to senders
- at sender, react by slowing down transmission

Explicit congestion notification
- standardized way of passing presence of congestion
- part of IP packet header, supported by most commodity switches
- for queue size of N: when queue occupancy goes beyond K, mark passing packet's ECN bit as "yes"

DCTCP main idea
- switch: marks with ECN after the threshold K
- ECN receiver: marks ACKs with ECE (ECN echo) flag, until sener ACKs back using CWR (congestion window reduce) flag
- DCTCP receiver: marks ACKs corresponding to ECN packet
- sender: estimate packets that are marked with ECN in a running window

### TIMELY
Use round trip time (RTT) as indication of congestion
- RTT is multi-bit, no explicit switch support required to do marking
- assumes that: TX NIC can generate completion timestamps, RX NIC can generate ACKs in hardware, at switches ACKs go through high-priority queue

Key concept:
- use gradient of RTTs
- positive → rising RTT → queue buildup
- negative → decreasing RTT → queue depletion
