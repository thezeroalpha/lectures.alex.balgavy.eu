+++
title = "Transport: overview"
+++

# Transport: overview
provides end-to-end packet delivery — reliable stream over unreliable network
uses datagrams or virtual circuits

**Transport service primitives**
Berkeley sockets (used in TCP):

- SOCKET — create new comms endpoint

- BIND — associate local address with socket

- LISTEN — announce accepting connections

- ACCEPT — passively establish incoming conn
- CONNECT — actively attempt a conn
- SEND — send data over connection
- RECEIVE — receive data from connection
- CLOSE — release connection
