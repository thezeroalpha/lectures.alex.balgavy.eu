+++
title = 'Network function virtualization'
+++
## Network function virtualization
Virtualise network functions on top of commodity servers.

Benefits:
- hardware sharing across multiple functions
- more flexible management using software
- cost saving via reduced hardware
- safe to try new features on an operational network/platform

Click: modular architecture or programming network functions
- element: class, input port, output ports, configuration string
- connection and configuration
  - connection: three types of ports (push, pull, agnostic)
  - push/pull connection constraints:
    - connection must have same type on the two ends
    - port must only have one connection
    - element must not have different types on its input/output ports if the element processes packets immediately

Achieving high performance
- NUMA architecture: non-uniform memory access (processor can access its own local memory faster than non-local memory)
  - each network port is accessed by single core
  - each packet is handled by a single core
- multi-queue NICs, allocate one core per queue
- batching: poll multiple packets from NIC instead of one at a time
