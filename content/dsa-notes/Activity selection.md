+++
title = "Activity selection"
+++

# Activity selection

## Problem

Given set of activities with start and finish time, schedule as many as possible so they do not collide.

| i   | 1   | 2   | 3   | 4   | 5   | 6   |
| --- | --- | --- | --- | --- | --- | --- |
| si  | 1   | 3   | 2   | 3   | 6   | 3   |
| fi  | 3   | 4   | 5   | 5   | 7   | 9   |

## Solution
If ordered on finish time, choose activity with earliest finish time.
If ordered on start time, choose activity with latest start time.

here, solution is: { (1,3) , (3,4) , (6,7) }
so activities {1, 2, 5}

Use an iterative greedy algorithm that literally tries adding everything.

## Complexity
ϴ(n). You just go through all items once and you’re done.
