+++
title = 'Randomness'
+++
# Randomness
nothing really behaves randomly in a computer, everything is 100% reproducible

but possible combinations of state often make it look as if something behaves unpredictably

if you want real randomness, you need to observe a physical phenomenon (e.g. atmospheric noise)

true randomness is hard to achieve, but pseudo randomness is enough most of the time

`int rand()`
- Pseudorandom generator
- produces a sequence of numbers based on algorithm that humans can’t guess any better than by “chance”
- it’s a stateful function
- returns pseudo-random number between 0 and RAND_MAX
- included through `<iostream>` for some reason
- unless seeded, always returns same sequence of numbers

to seed, use function:
`void srand((unsigned) int seed)`

best to use with time:
`srand((unsigned) time(0))`
