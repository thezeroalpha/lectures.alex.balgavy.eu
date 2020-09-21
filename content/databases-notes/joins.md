+++
title = "Joins"
+++

# Joins

Types:

-   `[INNER] JOIN`: usual join, eliminates tuples without a partner
-   `LEFT JOIN`: preserves rows of left table
-   `RIGHT JOIN`: preserves rows of right table
-   `FULL JOIN`: preserves rows of both tables
-   `CROSS JOIN`: Cartesian product in all combinations

Join predicates:

-   NATURAL: yields comparison of columns with same name
-   USING (A1, \..., An) appended
