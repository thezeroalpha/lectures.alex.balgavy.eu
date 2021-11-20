+++
title = 'Network transport'
+++
# Network transport
## TCP congestion control
Congestion control: determine rate to send data on connection, such that network is efficiently utilized, and sender doesn't overrun network capability

In TCP, end hosts control sending rate, based on ACKs.

Packet conservation: for connection to stay in equilibrium, a new packet should not be put into network until an old packet leaves

Reaching equilibrium quickly: TCP slow-start
- upon receiving ACK, increase congestion window by 1

Packet loss is not good indicator of congestion. Instead, provide a model, estimate parameters for the model based on probing, and decide sending rate using the model.

## Multi-path transport
Multiple paths, e.g. cellular and wifi simultaneously. Higher throughput, failover from one path to another, and seamless mobility.

To not modify apps, present same socket API and expectations.

During TCP 3-way handshake, set option `MP_CAPABLE` in TCP header for multipath.

To add sub-flows, use token hashed from exchanged key, and use HMAC (code) for auth based on exchanged keys.
Associate sub-flows with existing connection.

Middleboxes: network equipment that apply special operations on path of network packets.
- examples: firewall, NAT
- some inspect TCP traffic and check sequence numbers
- so, need to have per-flow sequence numbers

All sub-flows share same receive buffer and use same receive window.

MPTCP congestion control goals:
- be fair to TCP at bottleneck links: take as much capacity as TCP at bottleneck link
- use efficient paths: each connection should send all traffic on least-congested paths, but keep some traffic on alternative paths as probe
- perform as well as TCP

Congestion control mechanism:
- congestion window for each sub-flow
- increase window for sub-flow for each ACK on that path
- halve window for each drop on that path

## HTTP
### HTTP/1
1 round trip to set up TCP, 2 for TLS1.2.

After setup, only one request/response possible at a time, so Head-of-Line (HoL) blocking.

### HTTP/1.1
Avoids HoL blocking using multiple TCP connections, allowing concurrent requests/responses.

### HTTP/2
Multiple streams (each for object) multiplexed on same TCP connection.

Even multiple domains can share same TCP connection.

Supports priority of streams, using dependency tree.

But still has HoL blocking on _TCP_ connection -- packet retransmission for one object delays transmissions of others.

## QUIC
Protocol to make streaming faster.

No round trip to known server, or if crypto keys not new. And connections survive change of IP address.
Uses multiple streams over UDP.
