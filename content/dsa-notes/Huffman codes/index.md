+++
title = "Huffman codes"
+++

# Huffman codes

lossless encoding of characters, the ones that occur more frequently have a shorter encoding

e.g. encode “mississippi”

to generate a tree:
1. Build a table of values with frequencies:

    <table>
    <tr><td> m   </td><td> i   </td><td> s   </td><td> p   </td></tr>
    <tr><td> 1   </td><td> 4   </td><td> 4   </td><td> 2   </td></tr>
    </table>

1. Repeat until tree is complete: take two smallest nodes from list, create a new node that is sum of two smallest, add the two smallest as children (right > left), then add the parent node back into the list.

    ![screenshot.png](b135949e77632135c4030b62d87c7b90.png)  ![](f2219781d767bfb5463d415c5c4db2c5.png)  ![](17f4bc951d880b7d2ef5d08a4480d254.png)
    ![](a5ed3f890b17603f71c18a197523fbae.png)  ![](c9c5e43a5e315bd28e089e69355a204f.png)

1. Assign weights to left-right branches — left is 0, right is 1.

    ![](450eb15212318b83ae0db5f6ef700e4e.png)

1. Traverse tree to generate a code for each character:

    <table>
    <th>letter</th><th>code</th>
    <tr><td> a   </td><td> 1100 </td></tr>
    <tr><td> b   </td><td> 1101 </td></tr>
    <tr><td> c   </td><td> 100 </td></tr>
    <tr><td> d   </td><td> 101 </td></tr>
    <tr><td> e   </td><td> 111 </td></tr>
    <tr><td> f   </td><td> 0   </td></tr>
    </table>

## Complexity
with a min-heap-based min-priority queue, in O(nlogn)
