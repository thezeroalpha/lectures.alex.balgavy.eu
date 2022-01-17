+++
title = 'Networking'
+++
# Networking
Switches: operate at data link layer (layer 2)
- can see available interfaces with `ip link`
- can see IP address of every interface with `ip addr`

Routers: operate at layer 3
- can route packets across different networks
- show routing table with `ip route`
- add new route with `ip route add <target-subnet-cidr> via <ip-addr>`

Create and list network namespaces with `ip netns`.

Linux Bridge lets you connect all namespaces to an interface that works like a vritual switch:
- `sudo ip link add my-bridge type bridge`
- `sudo ip link set dev my-bridge up`

## Kubernetes network model
Constraints:
- every pod has own IP address
- containers within pod share pod IP, can communicate with each other via localhost
- pods on node can communicate with all pods on all nodes without NAT
- agents on a node can communicate with all pods on that node

You may impose restrictions on the model using Kubernetes Network Policies.

Container Network Interface (CNI): formalises responsibilities of Container Runtime (creating network namespace and running plugins)

Pods can be:
- routable: pod IP known outside of cluster, so unique on broader network
- not routable: IP not know outside of cluster, connection to outside requires SNAT to change source IP to IP address of node, return packets mapped automatically
  - no connections from outside cluster to pod possible, except with Kubernetes Services or Ingress

### Kubernetes Services
- each pod has own IP, pods are not permanent so that IP may change over time
- services define logical set of pods (maybe with selector based on labels) and specify how to access them

You can access a service:
- using environment variables (client pod creates identifying environment variables automatically, check with `printenv`)
- using CoreDNS

#### ClusterIP
Service only reachable within cluster, default
- defines IP only visible inside cluster, and port it listens on
- requests to this port and ClusterIP forwarded to `targetPort` of pods that the service defines as targets
- good for e.g. making backend pods accessible to frontend pods
- load balances incoming requests to all target pods

Example definition using selector:

```yaml
apiVersion: v1
kind: Service

metadata:
    name: fancy-api-service

spec:
    type: ClusterIP
    ports:
        - protocol: TCP
          port: 8081
          targetPort: 80
    selector:
        app: fancy-api
```

Apply with `kubectly apply -f filename.yaml`, then check with `kubectl get svc`.

Creating a service using a selector _also_ automatically adds an Endpoint object.

You can create a service without a pod selector, e.g. if you need to target a pod in a different cluster.

#### NodePort
exposes service on each Node's IP at static port, automatically creates ClusterIP

Multiple pods:
- if in same node, NodePort acts as load balancer and distributes incoming traffic
- if in multiple nodes, NodePort listens on same nodePort on each node IP address

#### LoadBalancer
exposes service externally using external load balancer, automatically creates NodePort and ClusterIP
- on public cloud, implementation provided by service. if not, can use e.g. MetaLB

### Ingress
Layer 7 load balancer, operates at app layer using HTTP, can route decision based on full content of message.
Useful when you have multiple services you want to expose externally.

To use it:
1. Install Ingress Controller
   - e.g. NGINX Ingress controller, Google HTTPS Load Balancer
2. Create Ingress Resources

### CoreDNS
Provides nameserver for Kubernetes.
Nameserver can be referenced from Unix machine if it has an entry in `/etc/resolv.conf`

To resolve a hostname, use `nslookup` and `dig`.

In microk8s, run `microk8s enable dns` to add CoreDNS.

Stores its config in a file called `Corefile`; in Kubernetes, it's a ConfigMap.


## Network Policies
Implemented by Network Plugin (e.g. Calico).

By default, pods accept traffic from any source in Cluster.
With Network Policies that select a Pod, the Pod is restricted by the union of the policies' ingress and egress rules (order of application of policies doesn't matter, it's a union).

## Calico
Two types of CNI plugins:
- CNI network plugins: responsible for adding/deleting pods to/from Kubernetes pod network
- CNI IPAM plugins: responsible for allocating and releasing IPs for pods as they are created/deleted
