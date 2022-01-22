+++
title = 'Helm: Kubernetes package manager'
+++
## Helm: Kubernetes package manager
Introduces Helm chart, which describes contents of all objects in the application using a single package.
A running instance of such a set of Kubernetes objects is a "release".
Helm charts are stored in repos.
Helm must be installed separately from Kubernetes.

From end user POV, on microk8s you do `microk8s enable helm3`, and then use it like a standard package manager (i.e. `list`, `install`, `uninstall`...)

### Creating charts
A chart can include other charts.
A chart contains `Chart.yaml`, a `values.yaml`, and a templates folder.

Start by running `helm create <chart-name>`, which gives you a starting skeleton:
- `Chart.yaml`: mandatory. `type` field can be `application` (deployed standalone), or `library` (deployed as dependencies of other apps).
  - dependencies may include `tags` (list of labels) and `conditions` (one or more YAML paths, and the chart can be enabled/disabled based on their values in the top-level `values.yaml`)
- `templates/`: YAML template files defined with the syntax of Go templates. You can see what's generated with e.g. `helm install --dry-run --debug <chart-path> --generate-name`
- `service.yaml`: uses Helm-specific objects `.Chart` (metadata like name and version) and `.Values` (exposes config that can be set at `helm install` time using `--set yaml.path=value`)
  - `.Values` can come from the chart's `values.yaml` or that of a parent chart, or a values flag passed via `helm install -f newvalues.yaml`, or individual values passed via `helm install --set path=value`

Then, you can install it with `helm install <release-name> <chart-dir>`, and see that it's installed with `helm ls`.

To package it, do `helm package <chart-dir>`.
You can upgrade a release with `helm upgrade <release-name> <chart-package-tgz>`, and downgrade with `helm rollback <release-name> <revision>`.
