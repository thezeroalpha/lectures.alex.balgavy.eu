+++
title = 'Pod disruption budget'
+++
# Pod disruption budget
Pods may be disrupted because of events:
- involuntary: hardware failure, destruction of node's VM, eviction of pod because node runs out of resources
- voluntary: deleting Deployment, update of Deployment causing a restart, deletion of pod, draining of ndoe

To mitigate involuntary disruption:
- ensure pod requests the resources it needs
- replicate application if you need higher availability
- spread apps across racks (using anti-affinity) or across zones

To deal with voluntary disruption:
- app owners can create PodDisruptionBudget to limit number of Pods of replicates app that are down simultaneously
- makes sense when app owner and cluster admin are different people/roles/vendors
- reduction in number of pods during involuntary disruption will count against the budget
