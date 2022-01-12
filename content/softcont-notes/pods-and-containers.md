+++
title = 'Pods and Containers'
+++
## Pods and Containers
Pod: smallest unit you can deploy to Kubernetes cluster
- generally contains single container
- may contain multiple containers that are strictly related: share same net and storage resources
- may contain one or more init containers, used to initialize application

On the command line, run a pod with:

```sh
kubectl run --image <image-name> <pod-name> --port=<port-on-container-ip> --hostport=<port-on-host-ip>
```

Pod lifecycle has phases:
1. Pending: cluster accepted pod, not all containers running yet.
2. Running: pod bound to node, all containers created, at least one running/starting/restarting.
3. - Succeeded: containers terminated successfully, will not restart.
   - Failed: all containers terminated, at least one with error.
