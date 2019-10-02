#!/bin/bash

set -xeou pipefail

SCRIPT_ROOT=${SCRIPT_ROOT:-https://github.com/appscodelabs/e2e-test-setup/raw/master}

configfile=$(mktemp /tmp/kind-config.XXXXXX)
curl -fsSL ${SCRIPT_ROOT}/kubernetes/kind.yaml > $configfile

function cleanup() {
  rm -rf $configfile
}
trap cleanup EXIT

kind create cluster --config $configfile --name kind --wait 300s
export KUBECONFIG="$(kind get kubeconfig-path)"
echo
echo "waiting for nodes to be ready ..."
kubectl wait --for=condition=Ready nodes --all --timeout=5m
kubectl get nodes
echo
echo "installing local-path provisioner ..."
kubectl delete storageclass --all
kubectl apply -f https://github.com/rancher/local-path-provisioner/raw/v0.0.11/deploy/local-path-storage.yaml
kubectl wait --for=condition=Ready pods -n local-path-storage --all --timeout=5m
kubectl apply -f ${SCRIPT_ROOT}/kubernetes/storageclass/standard.yaml
