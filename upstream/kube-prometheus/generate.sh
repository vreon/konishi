#!/bin/bash

set -e

[ -d kube-prometheus ] || git clone https://github.com/coreos/kube-prometheus
git -C kube-prometheus reset --hard 4e846a146f4911067ab28e4011203ac2fc1cb616

(
    pushd kube-prometheus/manifests >/dev/null
    for yaml in *; do
        cat $yaml
        echo '---'
    done
    popd >/dev/null
) > kube-prometheus.yaml

rm -rf kube-prometheus

touch kustomization.yaml
kustomize edit add resource kube-prometheus.yaml
