+++
title = 'Datacenter transport'
+++
# Datacenter transport
In datacenters, network is extremely high speed and low latency.

In TCP:
- reliable, in-order delivery with seq numbers and acks
- don't overrun receiver (receiving window `rwnd`) and network (congestion window `cwnd`)
  - what can be sent is `min(rwnd, cwnd)`

TCP incast problem: client-facing query might have to collect data from many servers → packet drops because capacity overrun at shared commodity switches

Ethernet flow control:
- overwhelmed ethernet receiver can send "PAUSE" frame to sender, upon which sender stops transmission for certain amount of time
- designed for end-host overruns, not switches
- blocks all transmission at Ethernet level (port level)

Priority-based flow control:
- enhancement over PAUSE frames
- 8 virtual traffic lanes, one can be selectively stoppe. timeout is configurable.
- but only 8 lanes, might lead to deadlocks in large networks, and unfairness

Datacenter TCP (DCTCP):
- pass information about switch queue buildup to senders
- at sender, react by slowing down transmission
- Explicit Congestion Notification: standard way of passing "presence of congestion"
  - part of IP packet header
  - for queue size of N, when queue occupancy goes beyond K, mark passing packet's ECN bit as "yes"
- after threshold K, start marking packets with ECN
  - typical ECN receiver marks acks with ECE flag, until sender acks back with CWR flag bit
  - DCTCP receiver: only mark acks corresponding to ECN packet

TIMELY
- use round trip time (RTT) as indication of congestion signal
- multi-bit, indicating end-to-end congestion through network → no explicit switch support needed to do marking
- assumes ack-based protocol (TCP)
- absolute RTTs not used, only gradient. positive means rising RTT, so queue buildup. negative means opposite.
