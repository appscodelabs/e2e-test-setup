# e2e-test-setup

For our e2e tests on GitHub actions, we are using [KIND](https://kind.sigs.k8s.io) (Kubernetes IN Docker). This creates a single master and 2 worker node cluster using only Docker.

## Install KIND

You only need to do this once.

```console
curl -LO https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64 \
  && sudo install kind-$(uname)-amd64 /usr/local/bin/kind

# this directory is used to provision hostpath PVCs
mkdir -p /mnt
```

## Create a Cluster matching our e2e setup

```console
curl -fsSL https://github.com/appscodelabs/e2e-test-setup/raw/master/run.sh | bash
```

## Delete cluster

```console
kind delete cluster
```

## How to pass cloud credentials to e2e tests in GitHub actions

[![How to pass cloud credentials to e2e tests in GitHub actions](https://img.youtube.com/vi/8QtXBaGY9q4/0.jpg)](https://www.youtube-nocookie.com/embed/8QtXBaGY9q4)
