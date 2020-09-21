+++
title = "Kind of a syllabus"
+++

# Kind of a syllabus

Here\'s what you should be able to do for each chapter (directly from
slides).

Data modelling

-   three phases of database design: conceptual, logical, physical
-   basic E/R concepts
    -   entities, attributes, relationships, \'is a\', weak entity sets,
        aggregation
    -   cardinality/participation constraints
-   how UML corresponds with and differs from E/R
    -   differences: basic syntax, aggregation, key specifications
-   how to make a conceptual model given a scenario (UML and ER)

Conceptual to relational model

-   how to translate a conceptual model to a relational model
    -   identifying keys
    -   internal/external keys
    -   (foreign) key constraints
    -   multi-valued attributes
    -   weak entity sets vs. composition
    -   \'is a\'
    -   representing cardinalities
    -   recursive relationships
    -   optimisation: removing relationship tables

Relational model:

-   explain concepts of relational model:
    -   schemas, state, domains
    -   read various notations for relational schema
-   explain applications and problems of null values
-   explain integrity constraints and their importance
-   explain meaning of keys and foreign keys
-   develop simple relational schemas

SQL:

-   write advanced SQL queries (nested, multiple variables)
-   aggregation, grouping, union
-   be comfortable with various join variants
-   evaluated correctness and equivalence of SQL queries (including
    possible presence of duplicate result tuples)

Relational normal forms:

-   work with functional dependencies:
    -   define what they are
    -   detect them in database schemas
    -   decide implication, determine keys
-   explain insert, update, delete anomalies
-   understand, explain, and use BCNF
    -   test a given relation for BCNF
    -   transform a relation into BCNF
-   understand, explain, and use 3NF
    -   test a given relation for 3NF
    -   transform a relation into 3NF
-   understand, explain MVDs and 4NF
-   detect normal form violations on the level of ER
-   explain when and how to denormalise a database schema
-   probably on exam:
    -   compute cover {attribute}+ \-- needed everywhere
    -   determine all minimal keys
    -   find \'canonical\' (minimal) set of FDs:
        -   use for BCNF decomposition \-- splitting
        -   3NF synthesis algorithm
    -   definitions of 4NF and multivalued FDs

Transactions:

-   ACID properties, transactions
-   anomalies: lost update, dirty read, unrepeatable read, phantoms
-   transaction schedules, serializability, conflicts (rw/wr/ww)
-   conflict equivalent, conflict serializability
-   lock based concurrency control: 2 PL (strict, preclaiming)
-   cascading rollbacks, deadlocks, deadlock detection
-   cascadeless, recoverable
-   granularity of locking, intention locks
-   SQL isolation levels: `READ UNCOMMITTED`, `READ COMMITTED`,
    `READ STBILITY`, `SERIALIZABLE`
-   optimistic concurrency approach
-   multiversion concurrency control, snapshot isolation

Database APIs:

-   explain problem of impedance mismatch
-   be able to classify database app interfaces: static, dynamic,
    object-relational mapping
-   discuss advantages/disadvantages of API in terms of object
    navigation and complex query execution
-   understand object-relational mappings: Hibernate for Java, entity
    framework for .NET (but you don\'t have to program on the exam)
    -   relate these to the ANSI SPARC 3-layer model and concepts of
        logical/physical data independence
-   explain advantages of LinQ and how it relates to impedance mismatch
