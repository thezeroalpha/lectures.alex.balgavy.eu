+++
title = 'ConfigMaps & Secrets'
+++
# ConfigMaps & Secrets
ConfigMap stores data that's not secret, Secret stores passwords/tokens/certs/etc.

## ConfigMap
Pods get data from ConfigMaps via:
- environment variables declared in spec of container in pod
- CLI arguments passed to container command inside pod
- read-only config files in a volume readable by the pod
- container code that calls Kubernetes API to get data from ConfigMap

Example ConfigMap:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
name: db-config-map
data:
    host1: "domain.com"
```

Example usage:

```yaml
apiVersion: v1
kind: Pod
spec:
    containers:
        - name: some-container
          # ...
          env:
              - name: THE_HOST
                valueFrom:
                    configMapKeyRef:
                        name: db-config-map
                        key: host1
```

## Secret
Data in Secret object not encrypted, only encoded in base 64.

Example:

```yaml
apiVersion: v1
kind: Secret
metadata:
    name: mysecret
type: Opaque
data:
    username: YWRtaW4=
    password: aHVudGVyMg==
```

Using the secret from a pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: the-pod
spec:
    containers:
        - name: acontainer
          # ...
          env:
              - name: USERNAME
                valueFrom:
                    secretKeyRef:
                        name: mysecret
                        key: username
```

### TLS secrets
To config apps with certificates to encrypt connections (like TLS), you have to keep cert private keys secure.
You can use the builtin Secret type `kubernetes.io/tls` to store cert and its associated key in `tls.crt` and `tls.key` fields.
You can create it from the CLI with `kubectl create secret tls my-tls-secret --cert=cert.pem --key=key.pem`.
