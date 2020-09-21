+++
title = "MAC: Overview & allocation methods"
+++

# MAC: Overview & allocation methods
having multiple users on a channel in a way that can lead to conflicts is a contention system

broadcast channels are multiaccess or random access channels

contention is especially important in LANs, most of all wireless, since they broadcast naturally

MAC sublayer determines how to how to allocate a channel between multiple users

**Static channel allocation**

- chop up its capacity using a muxing scheme (e.g. FDM)
- if N users, bandwidth is split up into N equal-sized portions, one for each user
- no interference between users because each user has a private freq band
- best for small and constant number of users
- if number of senders is large and varying, or bursty traffic, FDM has more problems
- if spectrum is cut up into N regions, the number of users might be <=> N and lead to waste or lack of enough spectrum
- not good for bursty traffic

**Dynamic channel allocation**
Assumptions:

1. Independent traffic — N independent stations, each with a program/user generating frames

2. Single channel — one channel for all communication, all stations transmit and receive on it

3. Observable collisions — if two frames are transmitted at same time, they overlap and the result is garbled: “collision”. All stations can detect that a collision occurred, and the frame must be transmitted again later

4. Continuous/slotted time

    - time may be assumed continuous, so frame transmission can begin at any time
    - time may also be divided into slots, with frame transmissions starting at the beginning of a slot.

5. Carrier sense/no carrier sense

    - carrier sense — stations can tell if channel is in use before using it, no station will try to use the channel while it’s busy
    - no carrier sense — stations just go ahead and transmit and later determine whether they transmitted successfully
