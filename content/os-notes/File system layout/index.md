+++
title = 'File system layout'
+++
# File system layout
on real disk, there are number of partitions (primary, extended, subpartitions). each partition can hold different filesystem

![](680ce86101ebb0f5559e3c485512297d.png)

one partition is flagged as 'active' partition.
MBR has boot code to locate active primary partition and execute boot block

partitions: primary, extended, and subpartitions

## How to store files on disk

contiguous allocation:

- files as contiguous stream of bytes
- but prone to fragmentation, requires max file size

block-based (logically contiguous, but actually stored anywhere on disk):

- linked list
    - by keeping in-band metadata, end up with strange block size (2 or 4 kb data, with some bytes to hold pointer)
    - good for sequential access patterns, but random...not so much
    - pointers are pointing to blocks on disk (NOT memory)
    - ![](4cec0a62f74e7cce20c9970d024cf93b.png)
- file allocation table (FAT)
    - move in-band metadata out of band
    - the table is stored in kernel memory
    - holds starting points of files
    - every row refers to a block of memory
    - worked well for a while, but for modern sizes it is not possible to hold the table in memory
    - ![](9574c3243ae1aec42c16a87811967973.png)
- I-nodes
    - just a FUCKTON of indirections
    - ![](989ec9c9f66e3d39587fe99eefeeb1f6.png)

## How to implement directories
![](d6e774bac420b1585709a558b8aba44f.png)
 ![](0d30522d012c79b891b3120ed9c2f8b3.png)

FAT layout:

- PBR stores "boot block"
- reserved is later used for filesystem info
- FAT #: preallocated file allocation table
- preallocated root dir (FAT12/FAT16)
- clusters are addressable blocks (FAT has chains indexed by starting cluster)
- ![](555ca3a94b042070cc8360acf834fd98.png)

UNIX dir entry:

- dir entry stores only name and inode number
- attributes are stored in inode
- one inode per file, first inode is root
- links:
    - hard link -- if 10 hard links to a file, then a single file with 10 dir entries pointing to that file (inode)
    - soft (symbolic) link -- if 10 soft links to a file, literally 10 files. can point to anything, but if file gets deleted, the link is dead.
- where are the inode stored? it depends, as always.

 ![](1ce3484b2773ce6c1c6283327e880159.png)
![](0db1d8b55f787cdbab5a378ac5038ad0.png)
![](fc97a31fa9f8ded5eaa7caf1ad4720dc.png)

how to manage disk space

- linked list vs bitmap (linked list actually works really well here)

![](4ea0e1f1384708f15599dc2e8ac8c858.png)
