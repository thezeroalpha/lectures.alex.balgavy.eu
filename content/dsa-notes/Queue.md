+++
title = "Queue"
+++

# Queue

## Queue

- FIFO
- enqueue to end, dequeue from start
- implement using circular array
    - Q.head is front of queue
    - Q.tail is end of queue
    - if is empty, Q.head == Q.tail
    - check for overflow/underflow and rap appropriately

## Priority queue

- keys are totally ordered, most important element is served first
- min-priority: minimum is most important
- max-priority: maximum is most important
- add: insert(priority queue, element) — O(logn)
- increase-key: increases key of an element to a given key
- maximum: gives element with max key
- extract-max: removes and returns element with max key — O(logn)
- implement with a heap:
    - either max-heap or min-heap, depending on the type of queue needed
    - max/min can be in ϴ(1) by returning first element of max/min-heap
