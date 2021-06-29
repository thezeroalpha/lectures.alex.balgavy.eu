+++
title = 'Supervised learning'
+++

# Supervised learning
Learn functional relationship ("unknown target function") from an observation to a target.

Assume unknown conditional target distribution p(y|x).
If we calculate f(x), add noise from noise distribution (Bernoulli/categorical for discrete target, normal for continuous).

1. Separate dataset into training, validation, test.
2. Learn function that fits our observed data in training set
    - should stratify training set if unbalanced (e.g. oversample)
3. Evaluate generalizability of function on test set
4. Stop learning process based on validation set.
5. If small dataset, use cross validation.

Error measure:
- assume hypothesis for target function h. How far is h from f (risk), what is its value per point (loss).
- approximate it using the data we have
- in sample error: error made on training set
- out of sample error: error that you make on all the other possible elements
- we try to minimize in sample error

Model selection:
- select hypothesis with lowest in-sample error on validation set
- watch out for overfitting, don't use too many features
- PAC ("probably approximately correct") learnable -- formal definition of an "almost perfect" model
- VC dimension: the max number of input vectors (points) that can be shattered (model can represent every possible labelling)
- all hypothesis sets with finite VC-dimension are PAC learnable

## Predictive modeling without notion of time
1. Think about the learning setup (what do you want to learn)
2. Don't overfit, select features with forward and backward selection, consider regularization (punishing more complex models)
    - forward selection: iteratively add most predictive feature
    - backward selection: iteratively remove least predictive feature
    - regularization: add term to error function to punish more complex models


