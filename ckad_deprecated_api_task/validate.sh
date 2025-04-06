#!/bin/bash

DEPLOYMENT_NAME="deprecated-nginx"

kubectl get deployment "$DEPLOYMENT_NAME" -o jsonpath='{.apiVersion}' | grep -q "apps/v1" && kubectl rollout status deployment "$DEPLOYMENT_NAME" && echo "Validation Passed: Deployment is running with the correct API version." || echo "Validation Failed: Deployment is not running or API version is incorrect."
