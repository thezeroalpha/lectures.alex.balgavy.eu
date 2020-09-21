+++
title = "Haskell"
+++

# Haskell
Application by juxtaposition (F M):

```haskell
head [1,2]
```

Partial application:

```hs
sum = foldr (+) 0
```

Anonymous function (λx.x):

```hs
\x -> x
```

Infinite lists:

```hs
ones = 1:ones   -- define an infinite list
head ones       -- => 1
```

Lazy evaluation does leftmost outermost.

If it wasn't lazy, innermost would fuck shit up:

```
head (1:ones) → head (1:1:ones) → head (1:1:1:ones) → ... → crap
```
