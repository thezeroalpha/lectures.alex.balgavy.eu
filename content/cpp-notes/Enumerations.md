+++
title = 'Enumerations'
+++
# Enumerations
enum (enumeration) — simple user-defined type, specifying its set of values as symbolic constants

by default, values of constants start with 0 and increment by 1 with each constant

you can give a constant a value from which the rest is incremented

e.g.:

```cpp
enum class Month {
  jan=1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
};
```

conversions:

```cpp
Mont int_to_month(int x) {
  if (x < int(Month::jan) || int(Month::dec) < x)
  error(“bad month”);
  return Month(x);
}

int m = 12;
Month mm = int_to_month(m);
```
