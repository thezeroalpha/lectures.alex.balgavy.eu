+++
title = 'Workload resources and controllers'
+++
## Workload resources and controllers
Instead of running individual pods, you create workload resources that manage set of pods based on a declared desired state.

When you submit workload resource, K8s control plane configures corresponding controller.
Controllers run control loops, where controller periodically makes sure that status of resource corresponds to declared desired state.

Most Kubernetes objects have two fields:
- spec: desired object state
- status: current object state

Deployment: suitable for stateless apps, like web servers. can have one or more containers.
- you can scale a deployment with `kubectl edit`, or `kubectl scale deployment <name> --replicas=n`
- autoscaling can happen based on conditions, e.g. `kubectl autoscale deployment <name> --min=7 --max=8 --cpu-percent=60`
  - this creates a HorizontalPodAutoscaler (hpa).

ReplicaSet: maintains desired number of instances of a pod defined by a template
- in general you can instead specify desired number of replicas in a Deployment

DaemonSet: ensures pods run on each node of the cluster, even if nodes added at later time
- for example, to collect a log on each node of the cluster. one tool for that is Fluentd

Job: ensures that specific task completes even if pod that should run the task fails
- if a node where the pod is running fails, the scheduler launches the pod on another noe
- can run pods sequentially or in parallel

CronJob: causes pod to execute at specific times determined by `schedule` parameter (like `cron`)

Garbage Collector: responsible for deleting objects when their parent no longer exists
- in foreground: parent marked for deletion, then all objects with `blockOwnerDeletion: true` are deleted, then the parent is deleted
- in background: first parent deleted, then all children found and deleted.
