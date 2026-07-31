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

echo
echo "🧹 Cleaning up local Terraform cache..."
rm -rf \
    "$BASE_DIR/EKS/terraform-manifests/.terraform" \
    "$BASE_DIR/EKS/terraform-manifests/.terraform.lock.hcl" \
    "$BASE_DIR/vpc-deploy/terraform-manifests/.terraform" \
    "$BASE_DIR/vpc-deploy/terraform-manifests/.terraform.lock.hcl"

echo
echo "✅ EKS and VPC infrastructure destroyed and local Terraform cache cleaned up successfully!"
