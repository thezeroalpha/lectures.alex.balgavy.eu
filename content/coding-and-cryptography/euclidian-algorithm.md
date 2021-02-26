+++
title = 'Euclidian algorithm'
template = 'page-math.html'
+++

# Euclidian algorithm
Use this if you want the gcd of two polynomials.

Iterative, at each step K is the iteration counter, Q is the quotient, and R is the remainder. S and T give you the multiplication factors.

Let's say we want gcd of f(x) and g(x), with deg(f) ≥ deg(g):

<table>
<tr>    <th>K</th>    <th>Q</th>              <th>R</th>                   <th>S(x)</th>               <th>T(x)</th> </tr>
<tr>    <td>0</td>    <td>-</td>              <td>f(x)</td>                <td>1</td>                  <td>0</td> </tr>
<tr>    <td>1</td>    <td>f(x) / g(x)</td>    <td>g(x)</td>                <td>0</td>                  <td>1</td> </tr>
<tr>    <td>2</td>    <td>g(x) / R₂</td>      <td>rem( f(x)/g(x) )</td>    <td>q₁ s₁ + s₀</td>         <td>q₁ t₁ + t₀</td> </tr>
<tr>    <td>3</td>    <td>R₂ / R₃</td>        <td>rem( g(x)/R₂ )</td>      <td>q₂ s₂ + s₁</td>         <td>q₂ t₂ + t₁</td> </tr>
<tr>    <td>4</td>    <td>R₃ / R₄</td>        <td>rem( R₂/R₃ )</td>        <td>q₃ s₃ + s₂</td>         <td>q₃ t₃ + t₂</td> </tr>
<tr>    <td></td>     <td></td>               <td><b>0</b></td>            <td>⇒ R₄ is the gcd</td>    <td></td> </tr>
</table>

This solves the equation r(x) = t(x) f(x) + s(x) g(x) as R₄ = t₄ f + s₄ g.

