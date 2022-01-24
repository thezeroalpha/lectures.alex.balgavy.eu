+++
title = 'Accessing I/O Devices'
+++
# Accessing I/O Devices
I/O means input/output — e.g. input from switch/microphone, output to speaker/motor/whatever

components of a computer system communicate through interconnection network (circuits)

each I/O device appears to processor as addressable locations

implemented as bit storage flip-flops in the form of registers (“I/O registers”)

I/O devices and memory share same address space — “memory-mapped I/O)
this means that any instruction which accesses memory can access the device

## I/O device interface

a device is connected to interconnection network using a circuit — “device interface”

provides means for data transfer, exchange of status & control info
