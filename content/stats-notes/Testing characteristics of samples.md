+++
title = 'Testing characteristics of samples (goodness-of-fit, independence, homogeneity)'
template = 'page-math.html'
+++

# Testing characteristics of samples (goodness-of-fit, independence, homogeneity)

## Goodness-of-fit

Checks if observed freq. distribution fits a claimed distribution.
Sample size n with k different categories.

Hypotheses:
- $H_{0}$: frequency counts agree with claimed distribution
- $H_{A}$: frequency counts do not agree with the claimed distribution

$O_{i}$ is observed frequency count of category *i*. $E_{i} = n \times p_{i}$ is the expected frequency count.

Test statistic is:
$\chi^{2} = \sum_{i=1}k\frac{(O_{i} - E_{i})^{2}}{E_{i}}$

and has approximately a chi-square distribution with k − 1 degrees of freedom under the null hypothesis.

Critical value:

- reject null hypothesis if $\chi_{2} > \chi^{2}_{k-1, \alpha}$
- P value: reject null hypothesis if $P(\chi^{2} \geq x^{2}) < \alpha$

test is right-tailed since we need large values of test statistic (even if hypothesis is undirected).

## Test of independence

When: two variables in a *single sample*

you have a contingency table with r row categories and c column categories. checking to see if columns and variables are dependent.

H0: row and column variables are independent
HA: row and column variables are dependent

test statistic:

$\chi^2 = \sum_{cells} \frac{(O-E)^{2}}{E}$

has under H0 approximately a chi-square distribution with (r − 1)(c − 1) degrees of freedom.

reject null hypothesis if $\chi^{2} > \chi^{2}_{(r-1)(e-1), \alpha}$

## Test of homogeneity

When: comparing two or more samples to see if they have the same proportions of characteristics.

r different populations (rows) and c different categories (columns) of some variable checking for proportions of a characteristic in the populations.

H0: different populations have same proportions of some characteristics

HA: different populations don’t have the same proportions of some characteristics.

test statistic:

$\chi^{2} = \sum_{cells} \frac{(O-E)^2}{E}$

has under H0 approximately a chi-square distribution with (r − 1)(c − 1) degrees of freedom.

reject H0 if observed $\chi^{2} > \chi^{2}_{(r-1)(e-1),\alpha}$

## Fisher’s exact test for 2-by-2 contingency table

either:

- H0: row and column variables are independent
- HA: occurrence of “first column category” is more common in group of “first row category” than in group of “second row category”

or:

- H0: populations have same proportion of one characteristic
- HA: the proportion of the characteristic is bigger/smaller in one population

test statistic: frequency count in cell (1,1) has under H0 and given marginals a hypergeometric distribution

parameters n = (first row total), N = (grand total), and k = (first column total)

guess we don’t need to know how to do this manually.
