+++
title = 'StatefulSet'
+++
# StatefulSet
Alternative to Deployment for stateful application.
Manages set of pods created from same template, and desired number of replicas.

Unlike Deployment, StatefulSet ensures unique and easy way of identifying each pod, and creation of pods in specific order.
Contains also a PersistentVolumeClaim template.

Requires Headless Service - a Service where ClusterIP is None (so not handled by kube-proxy).
