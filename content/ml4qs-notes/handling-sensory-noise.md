+++
title = 'Handling sensory noise'
template = 'page-math.html'
+++

Removing noise: outliers, imputing missing values, transforming data.

Outlier: observation point that's distant from other observations
- may be caused by measurement error, or variability

Remove with domain knowledge, or without.
But be careful, don't want to remove valuable info.

Outlier detection:
- distribution based -- assume a certain distribution of data
- distance based -- only look at distance between data points

## Distribution based
### Chauvenet's criterion
Assume normal distribution, single attribute Xi.

Take mean and standard dev for attribute j in the data set:

$\mu = \frac{\sum_{n = 1}^{N} x_{n}^{j}}{N}$

$\sigma = \sqrt { \frac{ \sum_{{n=1}}^{{N}} {\left({{x_{{n}}^{{j}}}  - \mu} \right)^2} }{N} } $

Take those values as parameters for normal distribution.

For each instance i for attribute j, compute probability of observation:

$P(X \leq x_{i}^{j}) = \int_{-\infty}^{x_{i}^{j}}{\frac{1}{\sqrt{2 \sigma^2 \pi}} e^{-\frac{(u - \mu)^{2}}{2 \sigma^2}}} du$

Define instance as outlier when:
- $(1 - P(X \leq x_{i}^{j})) < \frac{1}{c \cdot N}$
- $P(X \leq x_{i}^{j} < \frac{1}{c \cdot N}$

Typical value for $c$ is 2.


### Mixture models
Assuming data follows a single distribution might be too simple.
So, assume it can be described with K normal distributions.

$p(x) = \sum_{k=1}^{K} \pi_{k} \mathscr{N} (x | \mu_{k}, \sigma_{k})$ with $\sum_{k=1}^{k} \pi_{k} = 1 \quad \forall k: 0 < \pi_{k} \leq 1$

Find best for parameters by maximizing likelihood: $L = \prod_{n=1}{N} p(x_{n}^{j})$

For example with expectation maximization algorithm.

## Distance-based
Use $d(x_{i}^{j}, x_{k}^{j})$ to represent distance between two values of attribute j.

points are "close" if within distance $d_{min}$.
points are outliers when they are more than a fraction $f_{min}$ away.

### Local outlier factor
Takes density into account.

Define $k_{dist}$ for point $x_{i}^{j}$ as largest distance to one of its k closest neighbors.

Set of neighbors of $x_{i}^{j}$ within $k_{dist}$ is k-distance neighborhood.

Reachability distance of $x_{i}^{j}$ to $x$: $k_{reach dist} (x_{i}^{j}, x) = \max (k_{dist}(x), d(x, x_{i}^{j}))$

Define local reachability distance of point $x_{i}^{j}$ and compare to neighbors.

## Missing values
Replace missing values by substituted value (imputation).
Can use mean, mode, median.
Or other attribute values in same instance, or values of same attributes from other instances.

## Combining outlier detection & imputation
Kalman filter:
- estimates expected values based on historical data
- if observed value is an outlier, impute with the expected value

Assume some latent state $s_{t}$ which can have multiple components.
Data performs $x_t$ measurements about that state.

Next value of state is: $s_{t} = F_{t} s_{t-1} + B_{t} u_{t} + w_{t}$
- $u_{t}$ is control input state (like sending a message)
- $w_{t}$ is white noise
- $F_{t}$ and $B_{t}$ are matrices

Measurement associated with $s_{t}$ is $x_{t} = H_{t} s_{t} + v_{t}$
- $v_{t}$ is white noise

For white noise, assume a normal distribution.
Try to predict next state, and estimate prediction error (matrix of variances and covariances).
Based on prediction, look at the error, and update prediction of the state.

## Transforming data
Filter out more subtle noise.

Lowpass filter: some data has periodicity, decompose series of values into different periodic signals and select most interesting frequencies.

Principal component analysis: find new features explaining most of variability in data, select number of components based on explained variance.
