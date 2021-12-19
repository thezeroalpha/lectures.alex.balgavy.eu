+++
title = 'Network transport'
+++

## Network transport
### Congestion control
determine rate to send data, such that sender doesn't overrun network capability, and network is efficiently used
- switches have packet queue, packets dropped if not enough space in queue
- TCP sends data across network as fast as possible, but not faster
  - end hosts control sending rate based on ACKs
  - packet conservation principle: for connection in equilibrium, new packet shouldn't be put into network until an old packet leaves

self-clocking: new packets sent when packet leaves, at bottleneck rate.

quickly reaching equilibrium: TCP slow start
- upon receiving ACK, increase congestion window by 1
- timeout or 3 duplicate ACKs assumed to be packet drop

adapt to available space: additive increase multiplicative decrease (AIMD)
- congestion window increased by 1, but decreased by half of window size

BBR: congestion-based congestion control
- models network, estimates maxBW (bandwidth) and minRTT (round tirp time) on every ACK
- control sending rate based on model
- uses a state machine

### Multi-path transport
Benefits: higher throughput, failover, seamless mobility

For unmodified apps, present same socket API and expectations, establish TCP connections in the normal way. Single flow by default, add sub-flows if possible.

MPTCP
- to add new sub-flow, use token hashed from key exchanged in handshake, HMAC for authentication.
- start sending packets with new IP/port pair, associate sub-flows with exiting connection

Middleboxes: network equipment that apply special operations on path of network packets (e.g. firewall, NAT)
- some check TCP sequence numbers
- solution: use per-flow sequence number

MPTCP congestion control:
- be fair to TCP at bottleneck links: take as much capacity as TCP, no matter how many paths it's using
- use efficient paths: each congestion should send all traffic on least-congested paths, but keep some traffic on alternative paths as probe
- perform as well as TCP
- don't oscillate
- so, maintains a congestion window for each sub-flow, using a formula that I hope we don't need to know

### HTTP
HTTP/1
- 1 round trip to set up TCP connection
- 2 round trips to set up TLS 1.2 connection
- after setup, requests/responses flow over connection, one at a time
  - head-of-line (HoL) blocking on HTTP connection

HTTP/1.1: avoid HoL blocking
- multiple TCP connections allow multiple objects to be fetched through concurrent HTTP requests/responses

HTTP/2: stream multiplexing
- multiple streams (each for an object) multiplexed on same TCP connection
- even multiple domains can share same TCP connection
- supports stream priority set by client

### QUIC
new streaming protocol to make streaming faster

HTTP/3 over QUIC:
- 0 round trip to known server, or if crypto keys not new
- connections survive IP address change
- after setup, HTTP requests/responses flow over connection via QUIC streams
