#!/bin/bash

set -e

helm repo add harbor https://helm.goharbor.io
helm repo update

helm fetch harbor/harbor --version 1.2.1 --untar
helm template -n harbor -f - \
    --set chartmuseum.enabled=false \
    --set clair.enabled=false \
    --set notary.enabled=false \
    --set externalURL=https://vcr.vreon.net \
    --set expose.ingress.hosts.core=vcr.vreon.net \
    --set expose.tls.secretName=harbor-tls \
    --set persistence.persistentVolumeClaim.registry.size=20Gi \
    --set harborAdminPassword=$(cat secrets/harbor-admin-password) \
    --set secretKey=$(cat secrets/secret-key) \
    --set core.secret=$(cat secrets/core-secret) \
    --set jobservice.secret=$(cat secrets/jobservice-secret) \
    --set registry.secret=$(cat secrets/registry-secret) \
    harbor > harbor.yaml <<EOF
expose:
  ingress:
    annotations:
      cert-manager.io/cluster-issuer: letsencrypt-prod
      kubernetes.io/ingress.class: public
EOF

rm -rf harbor

touch kustomization.yaml
kustomize edit add resource harbor.yaml
