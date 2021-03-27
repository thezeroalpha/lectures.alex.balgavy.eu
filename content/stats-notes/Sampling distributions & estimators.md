+++
title = 'Sampling distributions & estimators'
template = 'page-math.html'
+++

# Sampling distributions & estimators

sampling distribution of sample mean: probability distribution of random variable $\bar{X}_{n}$

sampling distribution of sample proportion: probability distribution of $\hat{P}_{n}$

a sample proportion is $\frac{\text{number of successes}}{\text{total number of observations}}$

$\hat{P}_{n} \sim N(p, \frac{p(1-p)}{n})$, with p the number of successes

## Confidence intervals

a way to estimate stuff. e.g. a 95% confidence interval means we are 95% confident that this interval has a true value of μ.

$CI = \bar{x}_{n} \pm z \frac{s_n}{\sqrt{n}} $

Z is the Z-score for the confidence level you want (find this with a table).
The margin of error is whatever you add to/subtract from the sample mean.

To get $s_{n}$, you can use the central limit theorem.
