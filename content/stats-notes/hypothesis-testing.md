+++
title = 'Hypothesis testing'
template = 'page-math.html'
+++

# Hypothesis testing

If σ is known, use Z scores. If not, use T scores and $s_{n}$ (or if sample size is below 30).

## The steps

1. Choose population parameter
2. Formulate null and alternative hypotheses. Choose significance level.

    - H0: parameter = some value
    - HA: depends, can be two-tailed or one-tailed
        - one-tailed: param < value or param > value
        - two-tailed: param ≠ value

3. Collect data.

4. Choose test statistic (based on parameter) and identify its distribution under H0

5. Calculate value of test statistic.
6. Find p-value, or critical region based on significance.

    - watch out for the critical region. if one-tailed test, have to divide significance by 2 first.

1. Decide whether or not to reject the null hypothesis:

    - p-value:
        - if p-value ≤ significance, reject
        - otherwise, fail to reject
    - critical values:
        - if Z-score or T-score not in critical region, fail to reject
        - otherwise, reject

**YOU NEVER ACCEPT HYPOTHESES**

## Errors in testing

|     |     |     |
| --- | --- | --- |
|     | H0 true | H0 false |
| reject H0 | Type I | fine |
| not reject H0 | fine | type II |

- P(Type I error) = α (significance level)
- P(Type II error) = β (depends on sample size and actual population parameter)

## Proportion test

test statistic:

$Z = \frac{\hat{P}_{n} - p}{\sqrt{\frac{p(1-p)}{n}}}$

## Mean test

**Test statistic iff σ known:**

$Z = \frac{\bar{X}_{n} - \mu}{\frac{\sigma}{\sqrt{n}}}$

has standard normal distribution under null hypothesis.

**Test statistic otherwise:**

basically just replace σ with its estimator $\frac{s_n}{\sqrt{n}}$

$T = \frac{\bar{X}_{n} - \mu}{\frac{s_n}{\sqrt{n}}}$

has t-distribution with n−1 degrees of freedom under null hypothesis.

**Confidence interval (1−α) for μ:**


$\text{lower, upper} = \bar{x}\_{n} \pm t\_{n-1, \alpha/2} \times \frac{s_n}{\sqrt{n}}$

What does $t_{n-1, \alpha / 2}$ mean? Well, we need a t-score, with n−1 degrees of freedom. Divide significance by 2 because α is the full area (both tails) and since we’re adding/subtracting a t-score, we want to find the score corresponding to the area in one tail.

## Two samples

### Dependent

dependent: values in one sample are related to values in the other sample, or form natural matched pairs

to test, we look at the *difference* of means.

null hypothesis can be either no difference, or that difference is a certain value. alternative hypothesis can basically be whatever.

calculate the differences for each x, then have a sample mean of differences $\bar{D}$ and standard deviation of differences $s_{d}$.

test statistic:

$T_{d} = \frac{\bar{D} - (\mu_{1} - \mu_{2})}{\frac{s_{d}}{\sqrt{n}}}$

which under null hypothesis has t-distribution with n−1 degrees of freedom.

### Independent

independent: no relationship between two samples

#### Assuming equal σ

if sample randomly drawn from same population, we assume that σ₁ = σ₂.

test statistic:

$T\_{2}^{eq} = \frac{(\bar{X}\_{1} - \bar{X}\_{2}) - (\mu\_{1} - \mu\_{2})}{\sqrt{\frac{s^{2}\_{p}}{n\_{1}} + \frac{s^{2}\_{p}}{n\_{2}}}}$

the pooled sample variance is:

$s\_{p}^{2} = \frac{(n\_{1} - 1) s\_{1}^{2} + (n\_{2} - 1) s\_{2}^{2}}{n\_{1} + n\_{2} - 2}$

#### Not assuming equal σ

test statistic:

$T\_{2} = \frac{(\bar{X}\_{1} - \bar{X}\_{2}) - (\mu\_{1} - \mu\_{2})}{\sqrt{\frac{s\_{1}^{2}}{n\_{1}} + \frac{s\_{2}^{2}}{n\_{2}}}}$

which under null hypothesis has t-distribution with $\bar{n}$ degrees of freedom. $\bar{n}$ at the exam is the smallest of the two sample sizes.

## Two proportions

H0: p1 = p2

test statistic:

$z\_{p} = \frac{(\hat{p}\_{1} - \hat{p}\_{2})}{\sqrt{\frac{\bar{p} (1-\bar{p})}{n\_{1}} + \frac{\bar{p}(1-\bar{p})}{n\_{2}}}}$

(1−α) CI for p1−p2:

$(\hat{p}_{1} - \hat{p}_{2}) \pm E$ where

$E = z\_{\alpha / 2} \times \sqrt{\frac{\hat{p}\_{1} (1-\hat{p}\_{1})}{n\_{1}} + \frac{\hat{p}\_{2} (1-\hat{p}\_{2})}{n\_{2}}}$

P(Type I error) = α (significance level)
