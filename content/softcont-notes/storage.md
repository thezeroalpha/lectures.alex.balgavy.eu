+++
title = 'Storage'
+++
# Storage
## Volumes
Pod hosts containers with a writable layer, which is lost if the container crashes.
Volumes provide sharable storage that survives crashes, are attached to lifecycle of pod (not container).

A volume is directory that's accessible to containers in a pod.

Types of volumes:
- emptyDir: created when pod assigned to node, exists as long as pod is running on the node. Initially empty. When a pod is removed from a node, data in it is deleted. Safe across crashes. Stored on the node storage.
- hostPath: allows containers to access path in filesystem of node on which the pod runs, owned by root:root. With multiple nodes not very useful, because not clear on which node the hostPath storage will be used.
- nfs: Network File System. Not provided by Kubernets, must install your own NFS server. Can be shared between pods and mounted by multiple writers simultaneously.

## Persistent Volumes
Decoupled from that of pods, i.e. created independently from pods.
Persistent Volume Claims express storage requirements of an app, and Kubernetes binds Persistent Volume Claims to Persistent Volumes.

PVs can be provisioned:
- statically: created in advance by an admin, ready to be consumed by PVCs.
- dynamically (based on StorageClasses): when none of static PVs matches the PVC, the cluster may try to dynamically provision a volume that matches (admin has to enable DefaultStorageClass admission controller on API server)

Reclaiming: what happens to storage and data after you delete PVC:
- retain: when PVC deleted, PV is not.
- delete: when PVC deleted, PV and data is also deleted
- recycle: deprecated.
