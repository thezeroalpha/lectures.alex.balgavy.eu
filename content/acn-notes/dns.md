+++
title = 'DNS'
+++

## DNS
resolves hostnames to IP addresses.

DNS query:
- query local DNS server
- if not found, go to root nameserver
- root says to contact TLD nameserver (e.g. "com")
- TLD nameserver says to contact domain nameserver
- domain nameserver gives IP address

DNS types:
- resolution: AAAA (IPv6), A (IPv4)
- nameserver: NS
- alias (canonical hostname): CNAME
- mail server: MX
