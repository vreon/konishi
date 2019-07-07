#!/bin/bash

set -e

helm repo add rimusz https://charts.rimusz.net
helm repo update

helm fetch rimusz/hostpath-provisioner --version 0.2.3 --untar
helm template -n hostpath-provisioner hostpath-provisioner > hostpath-provisioner.yaml
rm -rf hostpath-provisioner

touch kustomization.yaml
kz3 edit add resource hostpath-provisioner.yaml
kz3 edit set namespace kube-system  # Argument to `helm template` didn't seem to work
