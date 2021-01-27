+++
title = 'Machine Learning'
+++
# Machine learning
Exam - [cheat sheet](formula-cheat-sheet.pdf) available for formulas!

* [Introduction](introduction)
     * [What is ML?](introduction#what-is-ml)
     * [Supervised ML](introduction#supervised-ml)
         * [Classification](introduction#classification)
         * [Regression](introduction#regression)
     * [Unsupervised ML](introduction#unsupervised-ml)
     * [What isn't ML?](introduction#what-isn-t-ml)
* [Methodology](methodology)
     * [Performing an experiment](methodology#performing-an-experiment)
         * [What if you need to test many models?](methodology#what-if-you-need-to-test-many-models)
         * [The modern recipe](methodology#the-modern-recipe)
         * [Cross-validation](methodology#cross-validation)
     * [What to report](methodology#what-to-report)
         * [Classification](methodology#classification)
             * [What's a good error (5%)?](methodology#what-s-a-good-error-5)
             * [Performance metrics](methodology#performance-metrics)
                 * [Confusion matrix (contingency table)](methodology#confusion-matrix-contingency-table)
                 * [Precision and recall](methodology#precision-and-recall)
         * [Regression](methodology#regression)
         * [Errors & confidence intervals](methodology#errors-confidence-intervals)
     * [The no-free-lunch theorem and principle](methodology#the-no-free-lunch-theorem-and-principle)
     * [Cleaning your data](methodology#cleaning-your-data)
         * [Missing data](methodology#missing-data)
         * [Outliers](methodology#outliers)
         * [Class imbalance](methodology#class-imbalance)
     * [Choosing features](methodology#choosing-features)
     * [Normalisation & standardisation](methodology#normalisation-standardisation)
         * [Normalisation](methodology#normalisation)
         * [Standardisation](methodology#standardisation)
         * [Whitening](methodology#whitening)
     * [Dimensionality reduction](methodology#dimensionality-reduction)
* [Linear models](linear-models)
     * [Defining a model](linear-models#defining-a-model)
     * [But which model fits best?](linear-models#but-which-model-fits-best)
         * [Mean squared error loss](linear-models#mean-squared-error-loss)
         * [Optimization & searching](linear-models#optimization-searching)
             * [Black box optimisation](linear-models#black-box-optimisation)
                 * [Random search](linear-models#random-search)
                 * [Simulated annealing](linear-models#simulated-annealing)
                  * [Parallel search](linear-models#parallel-search)
                  * [Branching search](linear-models#branching-search)
             * [Gradient descent](linear-models#gradient-descent)
             * [Classification losses](linear-models#classification-losses)
                 * [Least-squares loss](linear-models#least-squares-loss)
     * [Neural networks (feedforward)](linear-models#neural-networks-feedforward)
         * [Overview](linear-models#overview)
         * [Classification](linear-models#classification)
         * [Dealing with loss - gradient descent & backpropagation](linear-models#dealing-with-loss-gradient-descent-backpropagation)
     * [Support vector machines (SVMs)](linear-models#support-vector-machines-svms)
     * [Summary of classification loss functions](linear-models#summary-of-classification-loss-functions)
* [Probability](probability)
     * [Probability basics](probability#probability-basics)
         * [Probability theory](probability#probability-theory)
     * [(Naive) Bayesian classifiers](probability#naive-bayesian-classifiers)
     * [Logistic "regression" (classifier)](probability#logistic-regression-classifier)
     * [Information theory](probability#information-theory)
         * [Maximum likelihood](probability#maximum-likelihood)
         * [Normal distributions (Gaussians)](probability#normal-distributions-gaussians)
             * [1D normal distribution (Gaussian)](probability#1d-normal-distribution-gaussian)
             * [Regression with Gaussian errors](probability#regression-with-gaussian-errors)
             * [n-D normal distribution (multivariate Gaussian)](probability#n-d-normal-distribution-multivariate-gaussian)
             * [Gaussian mixture model](probability#gaussian-mixture-model)
         * [Expectation-maximisation](probability#expectation-maximisation)
* [Deep learning](deep-learning)
     * [Deep learning systems (autodiff engines)](deep-learning#deep-learning-systems-autodiff-engines)
         * [Tensors](deep-learning#tensors)
         * [Functions on tensors](deep-learning#functions-on-tensors)
     * [Backpropagation revisited](deep-learning#backpropagation-revisited)
         * [Multivariate chain rule](deep-learning#multivariate-chain-rule)
         * [Backpropagation with tensors - matrix calculus](deep-learning#backpropagation-with-tensors-matrix-calculus)
     * [Making deep neural nets work](deep-learning#making-deep-neural-nets-work)
         * [Overcoming vanishing gradients](deep-learning#overcoming-vanishing-gradients)
         * [Minibatch gradient descent](deep-learning#minibatch-gradient-descent)
         * [Optimizers](deep-learning#optimizers)
             * [Momentum](deep-learning#momentum)
             * [Nesterov momentum](deep-learning#nesterov-momentum)
             * [Adam](deep-learning#adam)
         * [Regularizers](deep-learning#regularizers)
             * [L2 regularizer](deep-learning#l2-regularizer)
             * [L1 regulariser](deep-learning#l1-regulariser)
             * [Dropout regularisation](deep-learning#dropout-regularisation)
     * [Convolutional neural networks](deep-learning#convolutional-neural-networks)
     * [Deep learning vs machine learning](deep-learning#deep-learning-vs-machine-learning)
     * [Generators](deep-learning#generators)
     * [Generative adversarial networks](deep-learning#generative-adversarial-networks)
         * [Vanilla GANs](deep-learning#vanilla-gans)
         * [Conditional GANs](deep-learning#conditional-gans)
         * [CycleGAN](deep-learning#cyclegan)
         * [StyleGAN](deep-learning#stylegan)
         * [What can we do with a generator?](deep-learning#what-can-we-do-with-a-generator)
     * [Autoencoders](deep-learning#autoencoders)
         * [Turning an autoencoder into a generator](deep-learning#turning-an-autoencoder-into-a-generator)
     * [Variational autoencoders](deep-learning#variational-autoencoders)
* [Tree models and ensembles](tree-models-and-ensembles)
     * [Tree models](tree-models-and-ensembles#tree-models)
         * [Decision trees (categorical)](tree-models-and-ensembles#decision-trees-categorical)
         * [Regression trees (numeric)](tree-models-and-ensembles#regression-trees-numeric)
         * [Generalization hierarchy](tree-models-and-ensembles#generalization-hierarchy)
     * [Ensembling methods](tree-models-and-ensembles#ensembling-methods)
         * [Bagging](tree-models-and-ensembles#bagging)
         * [Boosting](tree-models-and-ensembles#boosting)
             * [AdaBoost (binary classifiers)](tree-models-and-ensembles#adaboost-binary-classifiers)
             * [Gradient boosting](tree-models-and-ensembles#gradient-boosting)
         * [Stacking](tree-models-and-ensembles#stacking)
* [Sequences, models for sequential data](models-for-sequential-data)
     * [Sequences](models-for-sequential-data#sequences)
     * [Markov models](models-for-sequential-data#markov-models)
     * [Embedding models](models-for-sequential-data#embedding-models)
     * [Recurrent neural networks](models-for-sequential-data#recurrent-neural-networks)
     * [LSTMs](models-for-sequential-data#lstms)
* [Matrix models](matrix-models)
     * [Recommender systems](matrix-models#recommender-systems)
     * [Matrix factorization](matrix-models#matrix-factorization)
         * [Bias control](matrix-models#bias-control)
         * [The 'cold start' problem](matrix-models#the-cold-start-problem)
     * [Graph models](matrix-models#graph-models)
     * [Validating embedding models](matrix-models#validating-embedding-models)
* [Reinforcement learning](reinforcement-learning)
     * [What is reinforcement learning?](reinforcement-learning#what-is-reinforcement-learning)
     * [Approaches](reinforcement-learning#approaches)
         * [Random search](reinforcement-learning#random-search)
         * [Policy gradient](reinforcement-learning#policy-gradient)
         * [Q-learning](reinforcement-learning#q-learning)
     * [Alpha-stuff](reinforcement-learning#alpha-stuff)
         * [AlphaGo](reinforcement-learning#alphago)
         * [AlphaZero](reinforcement-learning#alphazero)
         * [AlphaStar](reinforcement-learning#alphastar)

[Programming reference](programming-reference)