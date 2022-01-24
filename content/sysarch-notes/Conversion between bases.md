+++
title = 'Conversion between bases'
+++
# Conversion between bases
## If one radix is power of other radix
Start right, take groups of size *ratio of powers* (e.g. hex to octal — 16 (2⁴) to 8 (2³) — 4 to 3 —convert to binary, group by 3s)

Ex:

| Binary (2¹) | grouping (1/3) | Octal (2³) |
| --- | --- | --- |
| 10100101001 | 010 100 101 001 | 2 4 5 1 |

## If not:
- Binary to decimal — multiply & add up powers of 2
- Decimal to binary — identify powers of 2 OR repeatedly divide by 2
