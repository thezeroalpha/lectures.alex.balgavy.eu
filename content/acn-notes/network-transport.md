+++
title = 'Network transport'
+++
# Network transport
## TCP congestion control
Congestion control: determine rate to send data on connection, such that network is efficiently utilized, and sender doesn't overrun network capability

In TCP, end hosts control sending rate, based on ACKs.

Packet conservation: for connection to stay in equilibrium, a new packet should not be put into network until an old packet leaves

Reaching equilibrium quickly: TCP slow-start
- upon receiving ACK, increase congestion window by 1

Packet loss is not good indicator of congestion. Instead, provide a model, estimate parameters for the model based on probing, and decide sending rate using the model.
