+++
title = 'Internet protocols'
+++
# Internet protocols
Protocols — rules to communicate over network

- TCPI/IP on ARPANET in 1982
- works locally (LAN) & on network
- various models of communication, mainly client/server, but also peer-to-peer and others.

IP (internet protocol):

- address in IPv4 is 32 bits
- associated with max 1 device at a time
- written as 4 dot-separated bytes
- transfers data packets from source to destination (like postal service)
- packets created by IP software contain:
    - header with source/destination address, length, etc.
    - data

TCP (transmission control protocol)

- provides guarantee that packet is delivered
- provides 2-way communication
- analogy: telephone status report
- adds ports (numbers) representing destination process on destination computer (with some being standard)
- higher-level protocols like SMTP, FTP, HTTP are built on top of this

UDP (user datagram protocol):

- like TCP
    - builds IP
    - provides ports
- unlike TCP
    - no connection concept
    - no transmission guarantee
- UDP is lightweight, better for one-time messages

DNS (domain name service)

- "phone book"
- maps IP to hostnames (www.example.org)
- top-level domain is the last part (.com, .org, . edu, etc.)

Analogy: IP is a telephone network, TCP is a conversation, UDP is a voicemail message, DNS is the yellow pages/directory assistance
