+++
title = 'Vector (SIMD) processing & GPUs'
+++
# Vector (SIMD) processing & GPUs
many programs use loops to operate on vectors of data, so many instructions are executed

single-instruction multiple-data (SIMD) — use multiple ALUs to operate on multiple data in parallel using a single instruction (as long as operations performed in parallel are independent)

vector registers hold data for vector instructions — have number of elements L (vector length), determines number of operations that can be done in parallel (multiple ALUs)

## Vectorisation

in a high-level language, loops working with arrays of numbers are vectorisable if the operations on every pass are independent of all other passes

a vectorising compiler can recognise those loops and generate vector instructions

they’re used for stuff like computer graphics and digital signal processing

## GPUs (Graphics Processing Units)

their main purpose in life is to speed up calculations on a large number of floating-points

a large chip has hundreds of simple cores with floating-point ALUs to do a lot of work in parallel

a video card has both a GPU and a dedicated memory for it
they have a special instruction set and hardware architecture
