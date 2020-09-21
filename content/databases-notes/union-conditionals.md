+++
title = "Union, conditionals"
+++

# Union, conditionals

`UNION` combines results of two queries. there\'s no other way to make
one result column to draw from different tables/columns. subqueries must
return tables with same number of columns and compatible data types.
`UNION` eliminates duplicates, `UNION ALL` concatenates and keeps
duplicates.

Condition expressions can be used for stuff like:

```sql
SELECT CASE WHEN CAT = 'H' THEN 'Homework'
            WHEN CAT = 'M' then 'Midterm'
            WHEN CAT = 'F' THEN 'Final'
            ELSE 'Unknown category' END,
        ENO, POINTS
FROM STUDENTS S, RESULTS R
WHERE S.SID = R.SID
AND S.FIRST = 'Ann' AND S.LAST = 'SMITH'
```

To replace a null value, you can do the following (same result):

-   `CASE WHEN x IS NOT NULL THEN x ELSE y END`
-   `COALESCE (x, y)`
