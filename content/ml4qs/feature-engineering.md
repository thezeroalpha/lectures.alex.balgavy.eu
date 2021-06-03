+++
title = 'Feature engineering'
+++

# Feature engineering
Creating useful features in different domains.

## Time domain
### Numerical
- want to summarize values of numerical attribute i in a time window
- assume temporal ordering $x_{1}^{i}, \dots, x_{N}^{i}$
- select window size λ
- for each time point t, select proper values $[x_{t-\lambda}^{i}, \dots, x_{t}^{i}]$
- compute new value of feature, per time point, over each of those values

### Categorical
- generate patterns combining categorical values over time
- consider a window size λ
- consider different relationships: succession "(b)", co-occurrence "(c)"
- support: what fraction of all time points does the pattern occur

### Mixed
Make categories from numerical values & apply categorical approach:
- ranges (low, normal, high)
- temporal relations (increasing, decreasing)


### Pattern generation
- only focus on patterns with sufficient support
- start with patterns of single attribute value pairs with sufficient support

## Frequency domain
Consider series of values within a certain window of size λ.
Perform Fourier transformation to see what frequencies we see in the window -- create sinusoid functions with different periods, with a base frequency (lowest frequency with complete sinusoid period).

Get feature values: highest amplitude frequency, normalize.

## Unstructured data - text
Perform number of steps:
- tokenization: identify sentences and words
- lower case everything
- stemming: identify stem of each word, map all variations of word to the stem
- stop word removal: get rid of words like 'the' that are not predictive

Approaches:
- bag of words: count occurrences of n-grams (n consecutive words)
- TF-IDF: frequency of words giving more weight to unique words
- topic modeling: assume the text has some topics associated with words, look at topics instead of words
