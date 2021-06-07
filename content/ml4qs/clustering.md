+++
title = 'Clustering'
+++

# Clustering

## Learning setup
Per instance (e.g. instances for each person), or per person (groups of people).

Distance metrics:
- euclidian distance: length of line between two points (hypotenuse of a triangle)
- manhattan distance: summing distances in all dimensions (the two other sides of the triangle, added together)
- minkowski distance is a generalized form
- important to consider scaling of data
- assuming numeric values; for others you can use Gower's similarity:
    - dichotomous (present or not): 1 if both present, 0 otherwise
    - categorical: 1 if both are the same, 0 otherwise
    - numerical: some calculation for scaling. don't know if I actually need to know this.

 Distance metrics for datasets:
 - non-temporal
    - summarize values per attribute over entire dataset into single value (mean, min, max...)
    - estimate parameters of distribution per attributes, and compare those (e.g. normal distribution)
    - compare distributions of values for attribute i with a statistical test (e.g. Kolmogorov Smirnov, take 1-p value as distance metric)
- temporal
    - raw-data based
        - simplest case: assume equal number of points, compute euclidian distance on per point basis
        - if time series are shifted in time, use a lag to compensate (across all attributes), use cross correlation coefficient to choose best value for shift (higher coefficient is better)
        - for frequencies, e.g. people might walk at different frequencies, so use dynamic time warping
            - pairing: time order should be preserved, first and last points should be matched
    - feature-based
    - model-based
        - fit time series model, use those params

## Clustering approaches
Options:
- k-means: take k number of clusters, start with k random points, and cluster closest points (center of cluster is the average)
    - performance metric: silhouette
- k-medoids: use actual points instead of artifical means
- hierarchical:
    - divisive: start with one big cluster, split in each step
        - find dissimilarity of a point, move the most dissimilar out of the cluster
        - select cluster with largest diameter
    - agglomerative: start with one cluster per point, merge
        - merge using single linkage (by minimum distance between two clusters), complete linkage (by maximum distance), or group average, or Ward's criterion (minimize standard deviation)
- subspace: look at subspace in feature space (otherwise with huge number of features, everything might even out)
