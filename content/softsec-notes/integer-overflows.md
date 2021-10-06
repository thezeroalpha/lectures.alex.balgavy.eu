+++
title = 'Integer overflows'
template = 'page-math.html'
+++
# Integer overflows
Ints have a fixed size.

For x86-64 Linux:

<table>
<tr><th>type</th><th>bits</th><th>min</th><th>max</th></tr>
<tr><td>signed char</td><td>8</td><td>$-2^{7}$</td><td>$2^{7}-1$</td></tr>
<tr><td>unsigned char</td><td>8</td><td>0</td><td>$2^{8}-1$</td></tr>
<tr><td>short</td><td>16</td><td>$-2^{15}$</td><td>$2^{15}-1$</td></tr>
<tr><td>unsigned short</td><td>16</td><td>0</td><td>$2^{16}-1$</td></tr>
<tr><td>int</td><td>32</td><td>$-2^{31}$</td><td>$2^{31}-1$</td></tr>
<tr><td>unsigned int</td><td>32</td><td>0</td><td>$2^{32}-1$</td></tr>
<tr><td>long</td><td>64</td><td>$-2^{63}$</td><td>$2^{63}-1$</td></tr>
<tr><td>unsigned long</td><td>64</td><td>0</td><td>$2^{64}-1$</td></tr>
</table>

If number doesn't fit, overflow. CPU discards bits that don't fit.
i.e. result is computed modulo 2ⁿ (n = number of bits).

leads to unexpected results in casts, computation, comparison:
- truncation: cast to smaller type, discarding bits
- arithmetic overflow: wrap around
- signedness: negative int interpreted as unsigned
