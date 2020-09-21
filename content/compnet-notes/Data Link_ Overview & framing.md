+++
title = "Data Link: Overview & framing"
+++

# Data Link: Overview & framing
The layer:

- Transfers frames over a single link
- groups bits into frames
- provides services to network layer
- regulates data flow
- handles transmission errors

Possible services

- unacknowledged connectionless (no connection or error recovery) — e.g. ethernet
- acknowledged connectionless (frame is resent if needed) — e.g. 802.11 WiFi
- acknowledged connection-oriented (conn. established, only for unreliable connections)

**Framing**

frames — parts of bit stream with a checksum (computed when sent, recomputed to check for correctness when received)

Framing methods

- byte count
    - first byte is length of frame
    - problem is that if length gets fucked up, so rest of data
- byte stuffing
    - contain a flag byte to delimit frames
    - flag byte at end, flag byte at start
    - need something that isn't used in data (or escaping)
- bit stuffing
    - like byte stuffing, but smaller
    - bit pattern instead of flag byte
    - single bit instead of flag byte
