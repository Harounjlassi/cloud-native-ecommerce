#!/bin/bash

set -e

BASE_DIR="$(dirname "$0")"

echo "======================================"
echo "Deploying VPC..."
echo "======================================"
#terraform -chdir="$BASE_DIR/vpc-deploy/terraform-manifests" init
terraform -chdir="$BASE_DIR/vpc-deploy/terraform-manifests" apply -auto-approve

echo "======================================"
echo "Deploying EKS..."
echo "======================================"
#terraform -chdir="$BASE_DIR/EKS/terraform-manifests" init
terraform -chdir="$BASE_DIR/EKS/terraform-manifests" apply -auto-approve

echo "Deployment completed successfully!"
