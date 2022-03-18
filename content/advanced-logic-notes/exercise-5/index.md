+++
title = 'Exercise 5'
template = 'page-math.html'
+++
# Exercise 5
## 2b
Show validity of: [a\*] ↔ φ ∧ [α][α\*]φ
- Take a PDL model M = ((W,R),V) and let x ∈ W
- Implication left-to-right:
    - assume x ⊨ [a\*]φ
    - so for every y ∈ W such that $(x,y) \in R_{\alpha *}$, y ⊨ φ
    - because M is a PDL model, $R_{\alpha \*} = (R_{\alpha})\* = R_{\alpha}^{0} \cup R_{\alpha}^{1} \cup R_{\alpha}^{2} \dots$
    - So $R_{\alpha}^{0} = Id \subseteq R_{\alpha \*}$ so $(x,x) \in R_{\alpha \*}$ so x ⊨ φ.
    - To prove x ⊨ [α][α\*]φ, take u ∈ W such that $(x,u) \in R_{\alpha}^{1}$.
    - Aim to show u ⊨ [α\*]φ
    - Take state v ∈ W such that $(u,v) \in R_{\alpha \*}$
    - We have $(x,u) \in (R_{\alpha} ; R_{\alpha \*}) \subseteq R_{\alpha \*}$
    - So $(x,v) \in R_{\alpha \*}$ so v ⊨ φ (because x ⊨ [α\*]φ)
- Other way is similar.

## 4
### a


$\begin{aligned}
\delta                                                  &= \text{while $\lnot p$ do $b \cup ac$} \\\\
\hat{R}_{\lnot p}                                       &= \\{(2,2), (3,3), (4,4)\\} \\\\
\hat{R}\_{ac}                                           &= R\_{a}; R\_{c} = \\{(1,2), (2,3), (4,3)\\}; \\{(3,1)\\} \\\\
                                                        &= \\{(2,1), (4,1) \\} \\\\
R\_{b \cup ac}                                          &= R\_{b} \cup R\_{ac} = \\{(3,4), (3,2), (2,1) \\} \cup \\{(2,1), (4,1)\\} \\\\
                                                        &= \\{(3,4), (3,2), (2,1), (4,1)\\} \\\\
R\_{\lnot p; b \cup ac}                                 &= \\{ (2,2), (3,3), (4,4) \\}; \\{(3,4), (3,2), (2,1), (4,1) \\} \\\\
                                                        &= \\{(2,1), (3,4), (3,2), (4,1) \\} \\\\
R\_{(\lnot p; b \cup ac)*}: R\_{\lnot p; b \cup ac}^{0} &= \\{(1,1), (2,2), (3,3), (4,4) \\} \\\\
R\_{\lnot p; b \cup ac}^{1}                             &= \\{(2,1), (3,4), (3,2), (4,1)\\} \\\\
R\_{\lnot p; b \cup ac}^{2}                             &= R\_{\lnot p; b \cup ac}^{1} \cup \\{(3,1)\\} \\\\
R\_{p}                                                  &= \\{(1,1)\\} \\\\
R\_{\delta}                                             &= \\{(1,1), (2,1), (4,1), (3,1) \\}
\end{aligned}$


### b
M ?⊨ [δ]p → p
- No.
- For example, 2 ⊨ [δ]p because $(2,1) \in R_{\delta}$ and 1 ⊨ p, but 2 ⊭ p.
