+++
title = 'Continuous probability distribution'
template = 'page-math.html'
+++
# Continuous probability distribution

## Normal distribution

Notation:
$X \sim N(\mu, \sigma^{2})$

Percentile rules:
- 68%: within one standard deviation from mean
- 95%: within two standard deviations from mean
- 99.7%: within three standard deviations from mean

To find P(X ≤ x):
1. Find z score for x: $z = \frac{x - \mu}{\sigma}$
2. Look up the cumulative probability for z.
3. P(X ≤ x) = P(Z ≤ z). So that’s your answer.

Z scores come from distribution $Z \sim N(0,1)$

Also: P(X > x) = 1 - P(X ≤ x)

### Central limit theorem

If you take sample size n ≥ 30, sample mean has approx normal distribution:

$\bar{X} \sim N(\mu, \frac{\sigma}{\sqrt{n}})$

useful sometimes: $\frac{\sigma}{\sqrt{n}} = \sqrt{\frac{\sigma^{2}}{n}}$

If the population is already normally distributed, the sample is always normally distributed for any n.

### How do you know if something is normal?

Use a QQ plot. Put sample quantiles on y axis, theoretical quantiles on x axis.
If there’s a linear correlation, sample is normal.
In general, you can use QQ plots to compare two distributions/samples.
