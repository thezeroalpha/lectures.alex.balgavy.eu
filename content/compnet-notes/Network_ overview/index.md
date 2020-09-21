+++
title = "Network: overview"
+++

# Network: overview
The layer answers:

- how to get from A to B
- how to prevent network congestion
- how to provide quality of service
- how to connect multiple networks together

layers below it don't know about end-to-end delivery
layers above it don’t know about the network topology
nobody knows anything about routing — it’s the network layer’s job

**Service types — connectionless v.s. connection-oriented**

|     |     |
| --- | --- |
| Connectionless | Connection-oriented |
| - routers use algorithms for routing to send each packet individually<br>- used by IP<br>![screenshot.png](977fa69a218c8c5fe8fa78bc3753dbef.png) | - fixed route decided when a connection is made<br>- all packets go along that route<br>- sometimes used by ISPs on top of IP<br>![screenshot.png](b7ac2763ed0fea80dab306f88fbec76d.png) |
