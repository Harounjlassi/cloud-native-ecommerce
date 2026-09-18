#!/bin/bash
set -e

echo "============================================================"
echo "STEP-3: Create RetailStore AWS Dataplane using Terraform"
echo "============================================================"
cd 3_Data_Plane_terraform-manifests_AWS/1_RetailStore_AWS_Data_Plane
terraform init 
terraform apply -auto-approve

echo
echo "RetailStore AWS Dataplance (RDS MySQL, RDS PostgreSQL, Elasticcache, SQS) creation completed successfully!"
