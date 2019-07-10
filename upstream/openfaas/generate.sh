#!/bin/bash

set -e

helm repo add openfaas https://openfaas.github.io/faas-netes/
helm repo update

helm fetch openfaas/openfaas --version 4.4.0 --untar
helm template --namespace openfaas -n openfaas -f - \
    --set basic_auth=true \
    --set exposeServices=false \
    --set functionNamespace=openfaas-fn \
    --set operator.create=true \
    openfaas > openfaas.yaml <<EOF
ingress:
  enabled: true
  hosts:
  - host: fn.vreon.net
    serviceName: gateway
    servicePort: 8080
    path: /
  annotations:
    certmanager.k8s.io/cluster-issuer: letsencrypt-prod
    kubernetes.io/ingress.class: public
  tls:
  - hosts:
    - fn.vreon.net
    secretName: gateway-tls
EOF
rm -rf openfaas

touch kustomization.yaml
kustomize edit add resource openfaas.yaml
