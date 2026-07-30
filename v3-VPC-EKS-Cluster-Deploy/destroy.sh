#!/bin/bash

set -e

BASE_DIR="$(dirname "$0")"

echo "======================================"
echo "Destroying EKS..."
echo "======================================"
terraform -chdir="$BASE_DIR/EKS/terraform-manifests" destroy -auto-approve

echo "======================================"
echo "Destroying VPC..."
echo "======================================"
terraform -chdir="$BASE_DIR/vpc-deploy/terraform-manifests" destroy -auto-approve

echo "Infrastructure destroyed successfully!"
