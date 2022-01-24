+++
title = 'Systems Architecture'
+++

# Systems Architecture

1. [Intro: Laws of Computing](empirical-laws-of-computing)

2. Digital Logic

    - Boolean Algebra
        - [Representation of data (algebra, truth tables)](representation-of-data)
        - [Logic function synthesis](synthesis-of-logic-functions)
        - [Minimisation using Karnaugh maps](karnaugh-maps)
    - Logic gates
        - [Basic (AND, OR, NOT, XOR)](basic-logic-gates)
        - [Universal (NAND, NOR)](universal-gates)
    - Combinatorial circuits (output depends only on current input)
        - [Decoders](decoders)
        - [Multiplexers](multiplexers)
    - Sequential circuits (output also depends on previous inputs - system state)
        - [Flip-flops](flip-flops)
            - SR Latch
            - Gated SR Latch
            - Gated D latch
            - T flip-flop
            - Master-slave flip-flop
        - [Registers, shift registers](registers-and-shift-registers)
        - [Counters](counters)

3. Digital Data

    - [Positional numbering system](positional-numbering-system)
    - [Conversion between bases](conversion-between-bases)
    - [Numeric representations of data types](numeric-representations-of-data-types)
        - Integers arithmetic
            - [Addition & subtraction with signed integers](addition-subtraction-with-signed-integers)
            - [Addition/subtraction logic unit](addition-subtraction-logic-unit)
            - [Multiplication of signed integers](multiplication-of-signed-integers)
        - Floating point arithmetic
            - [Adding/subtracting floating point values](adding-subtracting-floating-point-values).
            - [Multiplying/dividing floating point values.](multiplying-dividing-floats)

4. ISAs

    1. [Memory locations & addresses](memory-locations-addresses)

    2. [Memory operations & instructions](memory-operations-instructions)

    3. [Addressing modes](addressing-modes)

    4. [Subroutines & the Stack](subroutines-the-stack)

5. Basic processing unit

    1. [Instruction execution](instruction-execution)

    2. [Hardware components](hardware-components)

    3. [Data path & instructions](data-path-instructions)

6. Pipelining

    1. [The Basic Concept](the-basic-concept)

    2. Hazards

        1. [Data dependencies](data-dependencies)

        2. [Memory delays](memory-delays)

        3. [Branch delays](branch-delays)

    3. [Superscalar operation](superscalar-operation)

7. IO

    1. [Buses](buses)

    2. [Accessing I/O devices](accessing-i-o-devices)

    3. Basic approaches:

        - [Program-controlled](program-controlled-i-o)
        - [Interrupts](interrupts)

8. Memory

    1. [Basic concepts](basic-concepts)

    2. [Internal organisation of memory chips](internal-organisation-of-memory-chips)

    3. [Memory types](memory-types)

    4. [Direct Memory Access (DMA)](direct-memory-access-dma)

    5. [Memory Hierarchy](memory-hierarchy)

    6. [Cache memory](cache-memory)

    7. [Mapping functions](mapping-functions)

    8. [Performance considerations](performance-considerations)

9. Large-scale systems (parallel processing & performance)

    1. [Multithreading](multithreading)

    2. [Vector (SIMD) processing & GPUs](vector-simd-processing-gpus)

    3. [Shared-memory multiprocessors](shared-memory-multiprocessors)

    4. [Cache coherence](cache-coherence)

    5. [Parallel programming](parallel-programming)
