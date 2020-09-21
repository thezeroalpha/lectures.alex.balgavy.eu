+++
title = "SQL Overview"
+++

# SQL Overview

## Basics

Basic query: `SELECT columns FROM table WHERE condition is true`

The `FROM` clause is like declaring variables that range over tuples of
a relation:

```sql
SELECT  E.ENO, E.TOPIC  -- choose columns ENO, TOPIC
FROM    EXERCISES E     -- table exercises, E being an 'alias' for the current row
WHERE   E.CAT = 'H'     -- where the column CAT contains the value 'H'
```

If name of tuple variable (\'E\' in the code above) is not given
explicitly, the variable will have the name of the relation
(\'EXERCISES\' in the code above).

A reference to attribute A of variable R may be written as `A` if R is
*the only tuple variable* with an attribute named A.

It is almost always an error if there are two tuple variables that
aren\'t linked via join conditions.

Don\'t join more tables than needed.

In some scenarios, we might have to consider more than one tuple of the
same relation to get a result tuple.

Duplicates have to be explicitly eliminated, using `DISTINCT`.

Sufficient condition for superfluous DISTINCT, where K is set of
attributes uniquely determined by result.

1.  Assume WHERE clause is a conjunction. Let K be the set of attributes
    in the SELECT clause.
2.  Add to K attributes A s.t.:
    -   A = c for a constant c is in the WHERE clause
    -   A = B for B ∈ K is in the WHERE clause
    -   if K contains key of a tuple variable, add all attributes of
        that variable
3.  Repeat 2 until K is stable.
4.  If K contains a key of every tuple variable listed under `FROM`,
    then `DISTINCT` is superfluous.

Typical mistakes:

-   missing join conditions
-   unnecessary joins (may slow down query)
-   self joins with incorrect treatment of multiple tuple variables over
    same relation, missing conditions
-   unexpected duplicates
-   unnecessary `DISTINCT`

## Subqueries & non-monotonic constructs

monotonic: if further rows get inserted, the queries yield a superset of
rows

non-monotonic: \'there is no\', \'does not exist\', \'for all\',
\'min/max\'. testing whether or not a query yields an empty result.

example to select students without any homework result:

```sql
SELECT  FIRST, LAST
FROM    STUDENTS
WHERE   SID NOT IN (SELECT  SID
                    FROM    RESULTS
                    WHERE   CAT = 'H')
```

conceptually, the subquery (`SELECT SID...`) is evaluated before main
query.

constructs:

-   `NOT IN`: something is not in result of subquery
-   `NOT EXISTS`: result of subquery is empty
-   \"For all\":
    -   no universal quantifier in SQL, but you can use `EXISTS`. In
        logic, `∀X(φ) ↔ ¬∃ X (¬ φ)`.
    -   common pattern is `∀X (φ₁ → φ₂)` becomes `¬∃ X (φ₁ ∧ ¬ φ₂)`

Comparing values:

-   `ALL`: compare with all values in a set, has to be true for all
-   `ANY`/`SOME`: has to be true for at least some values in a set
    (also, `x IN s` == `x = ANY s`)
-   for both, subquery has to return a single column
-   comparisons with subquery results (`POINTS = (SELECT ...)`) must
    return a single row
