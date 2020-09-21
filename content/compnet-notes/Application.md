+++
title = "Application"
+++

# Application
DNS — Domain Name System

- high-level names
- namespace, hierarchical addressing
- managed by ICANN
- top-level domains (com, edu, me, ch, etc.) with subdomains
- query name servers to translate name address to IP address
- domains have associated DNS database resource records
- example with recursive and iterative queries:

    1. A asks for rooster.vu.nl
    2. Machine queries local name server, which does recursive query

        1. Query root name server for rooster.vu.nl, replies with address of .nl name server

        2. Query .nl name server for rooster.vu.nl, replies with address of vu.nl name server

        3. Query vu.nl name server for rooster.vu.nl, replies with IP address of rooster.vu.nl

    3. Return IP address to browser

DHCP

- MAC addresses are built into NICs, but not IP addresses
- a machine sends DHCP DISCOVER to DHCP server asking for an IP, the server replies with a DHCP OFFER and an available address

Email (SMTP protocol)

- message contains
    - envelope: transport info, priority, security level, and more. encapsulates whole message, get it to correct recipient
    - header: control info for user agents
    - body: for human recipient
- message formats
    - RFC 5322: basic ASCII messages
    - MIME (extensions)
        - adds content type and other headers to allow stuff other than plaintext
        - e.g. text/html, application/javascript, multipart
        - to encode binary into ASCII (only thing supported by mail servers), use base64 encoding
        - lmao this design, it’s like you add more duct tape to attach new features
- message transfer
    - mail submission uses SMTP with AUTH extension
    - message transfer between mail transfer agents uses SMTP, only one hop
        - message transfer agent queries name server for IP of second message transfer agent
        - then sends to that IP address using SMTP
    - final delivery with IMAP or POP3
        - POP3 — mail is downloaded, also not as secure
        - IMAP — mail remains on the server, large improvements over POP3

Worldwide Web (HTTP protocol)

- uses persistent connection with multiple HTTP requests over same TCP connection
- does not use IP addresses with ports, but URLs
- also uses MIME types (parses text/html, sends other MIME types to a specific app or plugin)

CDNs (Content Delivery Networks)

- a type of caching to increase system

Peer-to-peer

- users create own infrastructure by connecting to each other
- BitTorrent is very popular example — get torrent file, get peers from tracker, then trade chunks with peers
- distributed hash tables
    - can decentralise the tracker part of BitTorrent, with a small amount of info to store per node
    - example — Chord
        - ring of 2m places
        - every place can hold a user
        - compute your location in ring using hash(IP)
        - peers for torrent t are stored at user successor(hash(t))

Streaming (audio/video)

- analog-to-digital converter produces digital audio from analog signal by sampling
- digital audio compression can be lossy or lossless
- digital video compression — e.g. JPEG changes RGB to YCbCr (Y is luminance, CbCr are chrominances), MPEG compresses over a sequence of frames with Image and Predictive/Bidirectional frames
- and a lot of extra stuff
