+++
title = 'The Web - PageRank'
template = 'page-math.html'
+++
# The Web - PageRank
uses hyperlinks to a page (indegrees) as criterion for importance of that page

$rank(p) = (\frac{1-d}{n}+d) \times \sum_{\overrightarrow{<q, p> \in E}} \frac{rank(q)}{\delta_{out}(q)}$

d ∈ [0,1) is a constant damping factor, Google probably uses 0.85

$P[rank = k] \propto \frac{1}{k^{2.1}}$

algorithm:
1. V = {v1, v2, …, vn}. t=0. d ≈ 0.85
2. PR(vi, t) = 1/n for all vi ∈ V
3. for all vi, calculate:
    $PR(v_{i}, t+1) = \frac{1-d}{n} + d \times \sum_{\overrightarrow{<q, p> \in E}} \frac{PR(q, t)}{\delta_{out} (q)}$
1. Increment t of one unit
2. Go to step 2 unless reached max number of iterations or
    $\sum_{v \in V} PR(v, t) - PR(v, t-1)$
is small enough
