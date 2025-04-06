#!/bin/bash
INGRESS_API_VERSION=$(kubectl get ingress myapp-ingress -o jsonpath='{.apiVersion}')
if [ "$INGRESS_API_VERSION" == "networking.k8s.io/v1" ]; then
  echo "Success: Ingress is using networking.k8s.io/v1"
  exit 0
else
  echo "Error: Ingress is not using networking.k8s.io/v1, current value: $INGRESS_API_VERSION"
  exit 1
fi

kubectl delete ingress myapp-ingress --ignore-not-found
kubectl delete deployment deprecated-nginx --ignore-not-found
kubectl delete service deprecated-nginx --ignore-not-found