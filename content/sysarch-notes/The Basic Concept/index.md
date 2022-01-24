+++
title = 'The basic concept'
+++
# The basic concept
pipelining — a way of organising concurrent activity in a computer system, where instructions move through the components in an “assembly line” style

multiple operations happening at the same time

![screenshot.png](screenshot-22.png)

information (register addresses, immediate data, operations) is held in interstage buffers

in a five-stage pipeline:

![screenshot.png](screenshot-23.png)

but this is an ideal case. if the destination register for instruction Iᵢ is the source register for instruction Iᵢ₊₁, problems happen.

pipeline has to stall because of the data hazard
