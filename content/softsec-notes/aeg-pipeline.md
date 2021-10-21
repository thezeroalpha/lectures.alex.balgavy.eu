+++
title = 'AEG pipeline'
+++
# AEG pipeline
AEG: automated exploit generation

Multiple stages:
1. find bugs: 0-day, n-day
2. vulnerability specification: what kind? Inputs? depends on something?
3. primitives generator: read, write, massage...
4. surface explorer: power of primitive, constraints, reach (which bytes end up in interesting places)
5. side effects: any bad effects?
6. compiler for gadgets in binary
7. resulting exploit
