+++
title = "Rod cutting"
template = "page-math.html"
+++

# Rod cutting

Problem:
Rod of length n, table of prices. Determine maximum possible revenue.

<table>
<tr> <td>i</td> <td>1</td> <td>2</td> <td>3</td> <td>4</td> </tr>
<tr> <td>p</td> <td>1</td> <td>5</td> <td>8</td> <td>9</td> </tr>
</table>

Solution:
Total 2n-1 possibilities of cutting.

Create a table:

| i   | 1   | 2   | 3   | 4   |
| --- | --- | --- | --- | --- |
| Max profit |     |     |     |     |

$C(i)=\max{\{V_k+C(i-k)\}}\\;|\\;_{1 \leq k \leq i}$

Then solve:

$\begin{aligned}
C(1) &= 1\\\\
C(2) &= \begin{cases}V_1+C(1)=1+1=2\\\\ V_2=5\end{cases} \\\\
5 &> 2 \\\; \therefore 5 \\\\
C(3) &= \begin{cases}V_1+C(2)=1+5=6\\\\ V_2=C(1)=5+1=6\\\\ V_3=8\end{cases} \\\\
8 &> 6 \therefore 8 \\\\
C(4) &= \begin{cases}V_1+C(3)=1+8=9\\\\ V_2+C(2)=5+5=10\\\\ V_3+C(1)=8+1=9\\\\ V_4=9\end{cases} \\\\
10 &> 9 \therefore 10
\end{aligned}$

| i   | 1   | 2   | 3   | 4   |
| --- | --- | --- | --- | --- |
| Max profit | 1   | 5   | 8   | 10  |

Highest profit is 10.
- Optimal solution for $C(4) = V_2 + C(2)$
- Optimal solution for $C(2) = V_2$

Profit of 10 can be reached by cutting rod into two pieces of size 2.

Worst-case complexity: recursive algorithm gives $T(n)=2^n$

DP gives $T(n)=O(n^2)$ after solving $\sum_{j=1}^{n}j$

Extending:

“Density is pi/i. Greedy algorithm always takes highest density. Explain why it doesn’t always work.”

e.g. rod of length for, 2+2 is best solution.

| i   | 1   | 2   | 3   | 4   |
| --- | --- | --- | --- | --- |
| p   | 0.1 | 3   |     | 0.1 |
| p/i | 0.1 | 1.5 |     | 0.025 |

$\begin{aligned}p_2+p_2&=6\\\\
\therefore p_3+p_1 &< 6\\\\
p_3+0.1&<6\\\\
p_3&<5.9
\end{aligned}$

Greedy takes based on density

$\begin{aligned}\frac{p_3}{3}&>1.5\\\\
p_3&>4.5\\\\
\therefore 4.5<&p_3<5.9\\\\
\text{e.g. } p_3&=4.8
\end{aligned}$


| i   | 1   | 2   | 3   | 4   |
| --- | --- | --- | --- | --- |
| p   | 0.1 | 3   | 4.8 | 0.1 |
| p/i | 0.1 | 1.5 | 1.6 | 0.025 |

Greedy takes 4.8+0.1=4.9, which is less than 3+3=6 from DP approach.
