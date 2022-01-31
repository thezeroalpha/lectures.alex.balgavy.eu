+++
title = 'Network policies'
+++
# Network policies
By default, pods allow all outbound (egress) and inbound (ingress) connections.
Network policies let you restrict that, and are defined by YAML files.
The Network plugin used in the cluster must support them.

Policies always involve a pod at one or both ends, and are _additive_ (union).
For connection between two pods, you must allow egress from source and ingress to destination.

By default, pod non-isolated for ingress (all inbound allowed).

Pod is _isolated_ for ingress if there is NetworkPolicy that selects the pod and has "ingress" in policyTypes.
Then, only allowed connections are:
- those that come from pod's node
- those allowed by ingress list of some NetworkPolicy that applies to the pod for ingress

policyTypes can be `["Ingress"]`, `["Egress"]`, `["Ingress", "Egress"]`, or none.
This field indicates whether the policy applies to ingress/egress/both.
If no policyTypes specified, ingress is set by default, and egress is set if NetworkPolicy has any egress rules.

## Example: deny all

```yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: web-deny-all
spec:
  podSelector:
    matchLabels:
      app: web
  ingress: []
```

In this example:
- policyTypes not set, so default is ingress
- set of ingress rules is empty, so no entry into pods selected by `podSelector` is allowed

## Example: limit ingress to connections from certain pods
```yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: api-allow
spec:
  podSelector:
    matchLabels:
      app: bookstore
      role: api
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: bookstore
```

In this example:
- application with labels `app=bookstore role=api` can only be accessed from pods with label `app=bookstore`
- policyTypes not specified, so default is ingress

## Example: block traffic from other namespaces, allow from own
```yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  namespace: default
  name: deny-from-other-namespaces
spec:
  podSelector:
    matchLabels:
  ingress:
  - from:
    - podSelector: {}
```

In this example:
- policy applies to default namespace
- `matchLabels` is empty, so applies to all pods in default namespace
- allows ingress from any of selected pods (all in default namespace), all others are denied

## Example: block all egress traffic from a pod
```yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: foo-deny-egress
spec:
  podSelector:
    matchLabels:
      app: foo
  policyTypes:
  - Egress
  egress: []
```

In this case, we get a "bad address" error, because it fails to connect to DNS.
To block all egress except DNS:

```yaml
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: foo-deny-egress
spec:
  podSelector:
    matchLabels:
      app: foo

  policyTypes:
  - Egress
  egress:
  - ports:
    - port: 53
      protocol: UDP
    - port: 53
      protocol: TCP
```
