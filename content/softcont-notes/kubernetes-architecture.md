+++
title = 'Kubernetes architecture'
+++
## Kubernetes architecture
Control plane
- 1-3+ master nodes: do not run user workloads directly, but manage the cluster
- kube-apiserver: exposes Kubernetes API
- etcd: storage of key-value pairs for Kubernetes config
- kube-scheduler: selects node on which to run new pods
- kube-controller-manager: runs controller processes (Node, Replication, Endpoints, Service Account & Token controllers)
- cloud controller manager: connects cluster to cloud provider's API

Worker nodes
- node/worker/minion: executes user workloads
- kubelet: ensures that pods are running in node as declared by their specs
- kube-proxy: network proxy, maintains network rules on nodes
- pods: groups of containers that share storage/net resources

You interact with Kubernetes using `kubectl`.
Kubectl config is in `~/.kube/config`.

Nodes:
- runs kubelet agent, kube-prxy pod, and network pod
  - allows cluster manage pods that run on node
- network pod: not by default via `kubeadm`, but Calico in `microk8s`

Namespaces:
- used to create virtual clusters (avoid name conflicts, restrict resource usage, establish quotas, add policies)
- K8s creates objects in `default` namespace
- K8s components run in separate namespace -- `kube-system`
- new namespaces can be created with `kubectl create namespace <name>`
- cannot be nested. persistent volumes and nodes are not in a namespace.
