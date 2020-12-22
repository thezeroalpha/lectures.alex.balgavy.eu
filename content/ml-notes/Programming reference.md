+++
title = 'Programming reference'
+++
# Numpy & matplotlib
Load external file:
```python
data = numpy.loadtxt('./filepath.csv', delimiter=',')
```

Print information about data:

```python
data.shape
```

Graph two columns of data:

```python
import matplotlib.pyplot as plt
%matplotlib inline
x = data[:,0]
y = data[:,1]
# includes size and transparency setting, specifies third column to use for color
plt.scatter(x, y, s=3, alpha=0.2, c=data[:,2], cmap='RdYlBu_r')
plt.xlabel('x axis')
plt.ylabel('y axis');
```

Histogram plotting:

```python
# bins determines width of bars
plt.hist(data, bins=100, range=[start, end]
```

The identity matrix:

```python
np.eye(2) # for a 2x2 matrix
```

Matrix multiplication:

```python
a * b       # element-wise
a.dot(b)    # dot product
```

Useful references:
* [The official numpy quickstart guide](https://docs.scipy.org/doc/numpy-dev/user/quickstart.html)
* [A more in-depth tutorial, with in-browser samples](https://www.datacamp.com/community/tutorials/python-numpy-tutorial)
* [A very good walk through the most important functions and features](http://cs231n.github.io/python-numpy-tutorial/). From the famous [CS231n course](http://cs231n.github.io/), from Stanford.
* [The official pyplot tutorial](https://matplotlib.org/users/pyplot_tutorial.html). Note that pyplot can accept basic python lists as well as numpy data.
* [A gallery of example MPL plots](https://matplotlib.org/gallery.html). Most of these do not use the pyplot state-machine interface, but the more low level objects like [Axes](https://matplotlib.org/api/axes_api.html).
* [In-depth walk through the main features and plot types](http://www.scipy-lectures.org/intro/matplotlib/matplotlib.html)


# Sklearn
Split data into train and test, on features `x` and target `y`:

```python
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.5)
```

An estimator implements method `fit(x,y)` that learns from data, and `predict(T)` which takes new instance and predicts target value.

Linear classifier, using SVC model with linear kernel:

```python
from sklearn.svm import SVC
linear = SVC(kernel='linear')
linear.fit(x_train, y_train)
```

Decision tree classifier:

```python
from sklearn.tree import DecisionTreeClassifier
tree = DecisionTreeClassifier()
tree.fit(x_train, y_train)
```

k-Nearest Neighbors:

```python
from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(15) # We set the number of neighbors to 15
knn.fit(x_train, y_train)
```

Try to classify new data:

```python
linear.predict(some_data)
```

Compute accuracy on testing data:

```python
from sklearn.metrics import accuracy_score
y_predicted = linear.predict(x_test)
accuracy_score(y_test, y_predicted)
```

Make a plot of classification, with colors showing classifier's decision:

```python
from mlxtend.plotting import plot_decision_regions
plot_decision_regions(x_test[:500], y_test.astype(np.integer)[:500], clf=linear, res=0.1);
```

Compare classifiers via ROC curve:


```python
from sklearn.metrics import roc_curve, auc

# The linear classifier doesn't produce class probabilities by default. We'll retrain it for probabilities.
linear = SVC(kernel='linear', probability=True)
linear.fit(x_train, y_train)

# We'll need class probabilities from each of the classifiers
y_linear = linear.predict_proba(x_test)
y_tree  = tree.predict_proba(x_test)
y_knn   = knn.predict_proba(x_test)

# Compute the points on the curve
# We pass the probability of the second class (KIA) as the y_score
curve_linear = sklearn.metrics.roc_curve(y_test, y_linear[:, 1])
curve_tree   = sklearn.metrics.roc_curve(y_test, y_tree[:, 1])
curve_knn    = sklearn.metrics.roc_curve(y_test, y_knn[:, 1])

# Compute Area Under the Curve
auc_linear = auc(curve_linear[0], curve_linear[1])
auc_tree   = auc(curve_tree[0], curve_tree[1])
auc_knn    = auc(curve_knn[0], curve_knn[1])

plt.plot(curve_linear[0], curve_linear[1], label='linear (area = %0.2f)' % auc_linear)
plt.plot(curve_tree[0], curve_tree[1], label='tree (area = %0.2f)' % auc_tree)
plt.plot(curve_knn[0], curve_knn[1], label='knn (area = %0.2f)'% auc_knn)

plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.0])
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('ROC curve');

plt.legend();
```

Cross-validation:


```python
from sklearn.model_selection import cross_val_score
from sklearn.metrics import roc_auc_score, make_scorer

# The cross_val_score function does all the training for us. We simply pass
# it the complete data, the model, and the metric.

linear = SVC(kernel='linear', probability=True)

# Train for 5 folds, returing ROC AUC. You can also try 'accuracy' as a scorer
scores = cross_val_score(linear, x, y, cv=3, scoring='roc_auc')

print('scores per fold ', scores)
```

Regression:

```python
from sklearn import datasets
from sklearn.metrics import mean_squared_error, r2_score

# Load the diabetes dataset, and select one feature (Body Mass Index)
x, y = datasets.load_diabetes(True)
x = x[:, 2].reshape(-1, 1)

# -- the reshape operation ensures that x still has two dimensions
# (that is, we need it to be an n by 1 matrix, not a vector)

x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.5)

# feature space on horizontal axis, output space on vertical axis
plt.scatter(x_train[:, 0], y_train)
plt.xlabel('BMI')
plt.ylabel('disease progression');

# Train three models: linear regression, tree regression, knn regression
from sklearn.linear_model import LinearRegression
linear = LinearRegression()
linear.fit(x_train, y_train)

from sklearn.tree import DecisionTreeRegressor
tree = DecisionTreeRegressor()
tree.fit(x_train, y_train)

from sklearn.neighbors import KNeighborsRegressor
knn = KNeighborsRegressor(10)
knn.fit(x_train, y_train);

# Plot the models
from sklearn.metrics import mean_squared_error

plt.scatter(x_train, y_train, alpha=0.1)

xlin = np.linspace(-0.10, 0.2, 500).reshape(-1, 1)
plt.plot(xlin, linear.predict(xlin), label='linear')
plt.plot(xlin, tree.predict(xlin), label='tree ')
plt.plot(xlin, knn.predict(xlin), label='knn ')

print('MSE linear ', mean_squared_error(y_test, linear.predict(x_test)))
print('MSE tree ', mean_squared_error(y_test, tree.predict(x_test)))
print('MSE knn', mean_squared_error(y_test, knn.predict(x_test)))

plt.legend();
```

Useful references:
* [The official quickstart guide](http://scikit-learn.org/stable/tutorial/basic/tutorial.html)
* [A DataCamp tutorial with interactive exercises](https://www.datacamp.com/community/tutorials/machine-learning-python)
* [Analyzing text data with SKLearn](http://scikit-learn.org/stable/tutorial/text_analytics/working_with_text_data.html)
