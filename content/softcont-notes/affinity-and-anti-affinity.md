+++
title = 'Affinity and anti-affinity'
+++
# Affinity and anti-affinity
Scheduler takes care of placing pods on nodes to consume cluster resources in reasonable way.
But you can control how the scheduler does that by using labesls and selectors.

For example to:
- ensure that certain group of pods ends up on nodes with specific type of hardware (use `nodeSelector` or `nodeAffinity`)
- ensure that REST API and database pod end up on same node to reduce network latency during REST API calls to database (use inter-pod affinity `podAffinity`)
- ensure that two replicas of database pod don't end up on the same node, to increase high availability if a node fails (inter-pod anti-affinity `podAntiAffinity`)

Example:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
  nodeSelector:
    size: large
```


Taints: features of Nodes allowing nodes to repel pods
- add taint with `kubectl taint nodes node1 key1=value1:NoSchedule` (taint effect is `NoSchedule`, so no pod will be scheduled on node1 unless it has a toleration that matches key and label)
  - effects are NoSchedule, PreferNoSchedule, and NoExecute (pod will be evicted from the node if already running on it)
- to remove, `kubectl taint nodes node1 key1=value1:NoSchedule-`

Tolerations: allow specific pod to be scheduled on a node despite of its taint
- toleration "matches" a taint if keys are same + effects are same + operator is Exists or (operator is Equal and values equal)
