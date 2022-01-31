+++
title = 'Controlling access to Kubernetes API'
+++
# Controlling access to Kubernetes API
Access to Kubernetes resources goes through 3 phases: authentication, authorization, admission control.

Authentication: confirming identity of users
- service account
  - namespaced, created directly in Kubernetes, used by processes inside pods
  - every namespace has its own "default" service account
  - you can grant specific permissions to service accounts using a Role
  - you can create a new service account using a YAML file; a new Secret (token) will be created automatically:

    ```yaml
    apiVersion :v1
    kind: ServiceAccount
    metadata:
      name: my-service-account
    ```
  - use a service account in a pod by specifying its name in `spec.serviceAccount`
- normal user
  - global to cluster, may come form corporate database, used by human
  - no Kubernetes API for creating User objects

Authorization:
- Role Based Access Control (RBAC): individual users have rights to perform specific tasks
  - in Microk8s, use `microk8s enable rbac`
  - uses `rbac.authorization.k8s.io` API group to drive auth decisions
  - declares four Kubernetes objects:
    - Role: namespace resource, applies to specific namespace that it belongs to
      ```yaml
      kind: Role
      apiVersion: rbac.authorization.k8s.io/v1
      metadata:
        namespace: default
        name: pod-reader
      rules:
      - apiGroups: [""] # indicates the core API group
        resources: ["pods"]
        verbs: ["get", "watch", "list"]
      ```

    - ClusterRole: not namespaced, can be used to apply permissions to multiple namespaces or entire cluster
    - RoleBindings, ClusterRoleBindings: bind Roles/ClusterRoles to actual users, groups, userids, and service accounts.
      ```yaml
      kind: RoleBinding
      apiVersion: rbac.authorization.k8s.io/v1
      metadata:
        name: read-pods
        namespace: default
      subjects:
      - kind: User
        name: lara
        apiGroup: rbac.authorization.k8s.io
      roleRef:
        kind: Role
        name: pod-reader
        apiGroup: rbac.authorization.k8s.io
      ```
   - you can check permissions with e.g. `kubectl auth can-i list pod --namespace default --as lara1`
- Attribute Based access Control: access rights granted to users through policies which combine attributes together
- Node: node authorization authorizes API requests made by kubelets to perform specific API operations
- WebHook: event notification via HTTP POST, web app POSTs message to URL when certain things happen
