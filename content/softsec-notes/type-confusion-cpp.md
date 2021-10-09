+++
title = 'Type confusion (C++)'
+++
# Type confusion (C++)
C++ provides classes, like structs that tie data to functions.
Class instance known as 'object'.

Stack objects have constructor and destructor automatically called.

Heap objects managed with new/delete which call constructor/destructor.

Typecasts:
- `reinterpret_cast`: no checks, assumes programmer know what they're doing
- `static_cast`: compile-time check, allows any cast that might be valid (including parent-to-child)
- `dynamic_cast`: run-time check, ensures runtime type is consistent with compile-time type

Type confusion: object may be cast to wrong type, members read and written according to the wrong type
