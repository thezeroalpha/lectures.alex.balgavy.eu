+++
title = 'Direct Memory Access (DMA)'
+++
# Direct Memory Access (DMA)
A special control unit to manage the transfer of blocks directly between main memory and devices

does functions normally carried out by processor when accessing main memory

its operation is under control of an operating system routine, but transfers data without intervention

to transfer a block of words:

1. Processor sends to DMA controller: starting address, num of words in block, direction of transfer
2. DMA controller performs requested operation
3. When complete, informs processor by raising an interrupt
