#!/bin/bash

set -e

helm repo add loki https://grafana.github.io/loki/charts
helm repo update

helm fetch loki/loki --version 0.10.0 --untar
helm template --namespace loki -n loki loki > loki.yaml
rm -rf loki

helm fetch loki/promtail --version 0.8.1 --untar
helm template --namespace loki -n promtail \
    --set loki.serviceName=loki \
    promtail > promtail.yaml
rm -rf promtail

touch kustomization.yaml
kustomize edit add resource loki.yaml
kustomize edit add resource promtail.yaml