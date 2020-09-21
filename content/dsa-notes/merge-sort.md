+++
title = "Merge sort"
template = "page-math.html"
+++

# Merge sort

divide and conquer

algorithm

- sort()
    - stop if sequence contains less than 1 element
    - split sequence into two almost equal length parts
    - sort(subsequences)
    - merge(two sorted sublists)
- merging:
    - loop while both sequences are nonempty
        - compare first elements of both sequences
        - remove smallest, move it to end of output sequence
    - last: if one of sequences is empty, add other to tail of output sequence

        <table>
        <tbody align="center">
        <tr><td colspan="8">1,3,2,5,6,4,8,6</td></tr>
        <tr><td colspan="4">1,3,2,5</td><td colspan="4">6,4,8,6</td></tr>
        <tr><td colspan="2">1,3</td><td colspan="2">2,5</td><td colspan="2">6,4</td><td colspan="2">8,6</td></tr>
        <tr><td>1</td><td>3</td><td>2</td><td>5</td><td>6</td><td>4</td><td>8</td><td>6</td></tr>
        <tr><td colspan="2">1,3</td><td colspan="2">2,5</td><td colspan="2">4,6</td><td colspan="2">6,8</td></tr>
        <tr><td colspan="4">1,2,3,5</td><td colspan="4">4,6,6,8</td></tr>
        <tr><td colspan="8">1,2,3,4,5,6,6,8</td></tr>
        </tbody>
        </table>

*analysis*
merge tree for list with n elements:

- leaves: n
- levels: logn+1
- height: logn
- T(n) = cmerge ⋅ n
- merge is in ϴ(n), work per level is in ϴ(n)
- work total ≈ ϴ(n)(logn+1), because logn+1 layers
- T(n) = nlogn+n

shape of input is unimportant, as best case = worst case
time complexity in recurrence equations:

- divide is ϴ(1)
- conquer is recursive
- combine is ϴ(n)
- so:

    $T(n)=\begin{cases}
    c, & \text{if $n=1$}\\\\
    2T(\frac{n}{2})+cn, & \text{if $n > 1$}
    \end{cases}$

- solving the equation to find time complexity:

    $\begin{aligned}
    T(n) &= 2T(\frac{n}{2})+cn\\\\
         &= 2(2T(\frac{n}{4})+\frac{cn}{2})+cn&&[i=1]\\\\
         &= 4T(\frac{n}{4})+2cn&&[i=2]\\\\
         &= 4(2T(\frac{n}{8})+\frac{cn}{4})+2cn&&[i=3]\\\\
         &= 8T(\frac{n}{8})+3cn&&[i=4]\\\\
         &= \text{etc.}\\\\
         &= 2^iT(\frac{n}{2^i})+cni&&[i=n]
    \end{aligned}$

    $\begin{aligned}
    \text{base } &T(1) = 1\\\\
    \text{so } &\frac{n}{2^i}=1\\\\
    \text{when } &n=2^i &&(\frac{n}{n}=1)\\\\
    \text{hence } &i=\log{n} &&(i\text{ being the depth of the tree})
    \end{aligned}$

- substituting:

    $\begin{aligned}
    2^i\\;T(\frac{n}{2^i})+cni &= 2^{\log{n}}\times T(\frac{n}{2^{\log{n}}})+cn\log{n}\\\\
                               &= n\times c+cn\log{n}
    \end{aligned}$

so T(n) is of shape nlogn. Therefore T(n) is in ϴ(nlogn).
