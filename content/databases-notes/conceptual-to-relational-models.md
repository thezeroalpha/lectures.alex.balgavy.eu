+++
title = "Conceptual to relational models"
+++

# Conceptual to relational models

entity sets and relationship sets are represented as tables

-   name of table is name of entity/relationship set
-   columns (unique names) usually correspond to attributes

a strong entity set becomes a table with columns for the attributes.

a weak entity set becomes table with:

-   columns for the attributes
-   columns for the primary keys of the identifying entity

many-to-many relationship set becomes table with:

-   columns for attributes of relationship
-   columns for primary keys of participating entity sets

many-to-(zero or one) relations can be represented by adding extra
attribute/column to the many-side with primary key of one-side

for one-to-one relationship sets, either side can have the key of the
other.

if participation is partial (0..1), replacing table by an attribute will
lead to null values for those that don\'t participate.

if participation is total, foreign key should be `NOT NULL`.

tables for relationship sets linking weak entity sets to identifying
entity set can always be eliminated.o

when translating sets to tables:

-   every table should have a primary key
-   declared foreign key references for each relationship
-   declared whether foreign keys are nullable
-   declared unique if appropriate

composite attributes are flattened out by creating separate column for
each component attribute.

multi-valued attribute A of entity set E is represented by separate
table with:

-   columns for primary key of E
-   column for attribute value
-   each single value of multi-valued attributes gets its own row

Is-a to relational model:

-   Method 1: hierarchy of tables
    -   table for higher-level entity set
    -   table for each lower-level entity set (includes primary key of
        higher-level entity set & local attributes)
-   Method 2: many tables
    -   form table for each entity set with all local & inherited
        attributes
    -   if specialisation is total, we don\'t need table for generalised
        entity - table for generalised entity can be defined as view
        containing union of specialisation tables
-   Method 3: one table with null values
    -   form a single table with all local and specialized attributes

recursive association: translates to foreign key that refers to the same
table

-   requires separate table with two foreign keys to parent table
