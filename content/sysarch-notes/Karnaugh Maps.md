+++
title = 'Karnaugh maps'
+++
# Karnaugh maps
## Given a truth table:

|     | x₁ | x₂ | x₃ | ƒ₁ |
| --- | --- | --- | --- | --- |
| m₁  | 0   | 0   | 0   | 1   |
| m₂  | 0   | 0   | 1   | 1   |
| m₃  | 0   | 1   | 0   | 0   |
| m₄  | 0   | 1   | 1   | 1   |
| m₅  | 1   | 0   | 0   | 0   |
| m₆  | 1   | 0   | 1   | 0   |
| m₇  | 1   | 1   | 0   | 0   |
| m₈  | 1   | 1   | 1   | 1   |

## Make a table such as this:
Adjacent cells can only differ in one bit!

| A/BC | 00  | 01  | 11  | 10  |
| --- | --- | --- | --- | --- |
| 0   | m₁: 1 | m₂: 1 | m₄: 1 | m₃: 0 |
| 1   | m₅: 0 | m₆: 0 | m₇: 0 | m₈: 1 |

Then choose groups of 1s of size 2ⁿ. They should be as big as possible. Then you see what changes within the groups, and if a bit changes to its complement so that it cancels out to 1, you don’t have to include it.
