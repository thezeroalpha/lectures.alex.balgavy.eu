+++
title = "Aggregations"
+++

# Aggregations

A view declaration registers a query (not the result) under an
identifier

Simple aggregation functions: COUNT, SUM, AVG, MAX, MIN

Restrictions:

-   aggregations can\'t be nested
-   aggregations can\'t be used in the `WHERE` clause
-   if aggregation function is used, and there\'s no `GROUP BY`,
    attributes can\'t appear in the `SELECT`

Null values and aggregations

-   usually, they\'re ignored before the aggregation
-   `COUNT(*)` counts null values. it counts rows, not attribute values

GROUP BY partitions tuples of a table into groups, based on value
equality for the GROUP BY attributes. It can never produce empty groups.
Aggregation functions are applied to groups separately. Sequence of
GROUP BY is not important.

`HAVING` is a way to filter out groups based on some property. E.g.
`HAVING SUM(POINTS) >= 18`. `HAVING` should *only* contain aggregation
functions, not single attributes.
