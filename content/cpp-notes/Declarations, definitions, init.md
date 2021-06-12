+++
title = 'Declarations, definitions, init'
+++
# Declarations, definitions, init
Each definition is a declaration, but not each declaration is also a definition.

## Declarations
- a declaration is a statement that introduces a name into a scope
- declare variables/functions before use
- declarations say how something can be used, not how it’s implemented
- in function declaration, named parameters are not necessary, but useful

## Definitions
- a definition fully specifies the entity declared
- sets aside memory for the variable

## Initialisation
ways of initialising:

- = syntax — `double d = 2;`
- () syntax — `vector<int> v(10);`
    - specifies number of elements
- {} syntax — `vector<int> v{1,2,3};`
    - gives a “vector literal"

with const, initialisation is mandatory
