# e2e-test-setup

## Install KIND

You only need to do this once.

```console
curl -LO https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64 \
  && sudo install kind-$(uname)-amd64 /usr/local/bin/kind
```

## Create a Cluster matching our e2e setup

```console
curl -fsSL https://github.com/appscodelabs/e2e-test-setup/raw/master/run.sh | bash
```

## Delete cluster

```console
kind delete cluster
```
