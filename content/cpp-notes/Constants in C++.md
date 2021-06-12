+++
title = 'Constants in C++'
+++
# Constants in C++
Why?

If you know that a value will always be the same, the compiler can use that fact for optimisations. For example — it will always have the same size in memory, so the computer can use that memory for other things.

Two options
- `const` — declares an object as constant. Immutable once initialised.
- `constexpr` — constant at compile-time
