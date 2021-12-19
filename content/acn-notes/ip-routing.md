+++
title = 'IP routing'
+++

## IP routing
IP addresses have prefix and identifier:
- e.g. 10.0.0.1/24: 24 bits network identifier, rest host identifier
- also subnet mask notation: 255.255.255.0

Routers have tables like this for forwarding:

| Match          | Action |
|----------------|--------|
| 122.38.42.0/24 | port-2 |
| 116.16.0.0/16  | port-1 |
| 139.70.8.0/24  | drop   |

IPv4 packets have fields including:
- TOS: type of service -- two bits used for explicit congestion notification
- total length
- TTL: decreased by one when passing router, packet dropped when TTL is 0
- protocol: transport layer protocol (TCP, UDP)

Generating forwarding tables:
- in same domain: OSPF (link state)
  - routers exchange link-state messages to learn topology
  - each router runs Dijkstra's to compute shortest paths to other routers
  - each router generates forwarding table based on shortest paths
- between domains: BGP (distance vector)


Traffic engineering: network engineering for performance evaluation and optimization
- multiprotocol label switching: add extra header with labels to let you manipulate forwarding
