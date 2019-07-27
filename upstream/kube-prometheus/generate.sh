#!/bin/bash

set -e

[ -d kube-prometheus ] || git clone https://github.com/coreos/kube-prometheus
git -C kube-prometheus reset --hard a5ba4c5116af3a43215a41ed1d9da7a805537067

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
