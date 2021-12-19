+++
title = 'Local network: Ethernet, ARP'
+++
## Local network: Ethernet, ARP
Switched ethernet: ethernet segments connected with switches, which work on link layer

Switch creates Ethernet segments and forwards frames between segments based on MAC address

MAC address is 6 bytes, unique among all network adapters, managed by IEEE

Ethernet frame contains destination and source MAC addresses.

Link layer switches forward/broadcast/drop frames based on switch table, operate transparently to hosts.

Generating the table:
- learn new interface mappings from incoming frames
- if destination unknown, broadcast on all interfaces except the source

Packet transmission:
- store-and-forward: packets received in full, only then forwarded
- cut-through: packet receiving and sending done at the same time

Avoid loops in network by computing a logical spanning tree, and rebuilding the tree on failure.

Traffic isolation with VLANs -- subsets of ports.

ARP: obtaining destination MAC address from a host
- query: whoever has an IP address, respond with your MAC address
- reply comes only from that host and contains MAC address

NAT: maps an IP address space into another
