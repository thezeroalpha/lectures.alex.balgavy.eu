+++
title = 'Random graphs'
template = 'page-math.html'
+++
# Random graphs
Ok at this point I’m starting to give up on life.

Erdos-Renyi graphs (random graphs)

- ER(n,p) graph
- n vertices, random number of edges
- edge between a pair of vertices exists with probability p
- small avg shortest path length, low clustering coefficient
- expected clustering coefficient is p
    - binomial distribution:

$P[\delta (u) = k] = \binom{n-1}{K} p^k (1-p)^{n-1-k}$

since there are n-1 vertices to link with u.

- for large G ∈ ER(n,p) the average shortest path length d̄(G) tends to:

    $\frac{\ln{n} - \gamma}{\ln{\delta}} + 0.5 \qquad \gamma \approx 0.5572$

- phase transition around p=1/n — a gigantic connected component appears

Watts-Strogatz graphs (“small world”)

- V = { v1, v2, v3, …, vn }. choose n >> (even k) >> ln(n) >> 1.
- to build:

    1. construct Hn,k
    2. consider each edge \<u,v>

        - with probability p, replace it by \<u,w>
        - w≠v, w randomly chosen from V \ N(u)

    3. result is WS(n,k,p)

- many vertices will be close to each other
- weak links are the long ones that cross the ring
- high clustering coefficients
    - CC(G) ≈ 0.75 for G ∈ WS(n,k,0)
- average shortest path length for WS(n,k,0)

    $\hat{d}(u) \approx \frac{n}{2k}$

Scale-free networks

- very few high-degree vertices
- degree distribution follows power law

    $P[\delta (u) = k] \alpha ∝ k^{-a}$ (usually 2 < a < 3)

- function $f$ is scale-free if $f(bx) = C_{b} f(x)$ with Cb a constant
- scale-free function has the same shape everywhere
- built using growth process with preferential attachment (a new node is more likely to connect to nodes with high degrees)
- hubs make them vulnerable to targeted attacks
- example — BA graphs (below)

Barabasi-Albert graphs (scale-free, dynamical growth, random graphs)

- BA(n, n0, m)
- n vertices, m edges
- start with n0 nodes at t=0, on every step add node with m (≤ n0) edges
- constructing a graph
    - start with n0 nodes, no edges
    - while vertices < n

        1. add a new node v

        2. add edges to all other nodes, each with probability proportional to δ(u)

        3. for constant c ≥ 0, add c × m edges between vertices excluding v. probability for each edge <x,y> is proportional to δ(x)×δ(y)

- P(v is linked to u) = $\frac{\delta (u)}{\text{sum } \delta (\text{all other nodes})}$

- power law distribution:

    $P[\delta (u) = k] = \frac{2m^2}{k^3} \propto k^{-3}$

- there’s a bunch of complicated formulas connected to this so I’ll just hope they don’t show up
- clustering coefficient depends on sequence
- average shortest path lengths are shorter than ER because of vertices with high degree (“hubs”)
- tunable clustering — you might add more edges to one node, based on a probability
