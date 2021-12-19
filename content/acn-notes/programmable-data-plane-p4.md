+++
title = 'Programmable data plane (P4)'
+++

## Programmable data plane (P4)
All network features are centered around the capabilities of the ASIC, and it takes years for a new one to be developed and deployed.
So, make the ASIC programmable, and let your features tell the ASIC what to support.

PISA: protocol independent switch architecture

P4: domain-specific language for programming protocol-independent packet processors

Architecture specific constructs
- each architecture defines "externs" - blackbox functions whose interface is known
- P4 aims to be target-independent

P4 is C-like, statically typed.

Parser:
- uses state machine to map packets into headers and metadata
- `transition` statements move between states, with final accept/reject states

Control:
- tables: match a key and return an action
- actions: like C functions
- control flow is similar to C, but no loops

Deparser assembles the packet from data structures.
