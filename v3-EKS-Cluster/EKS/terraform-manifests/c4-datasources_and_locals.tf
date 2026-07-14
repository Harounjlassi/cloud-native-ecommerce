
# Localvalues used throughout the EKS configuration
# Helpss enforce naming consistency and REeduce duplication

locals {
  # Business division or team name from variable
  owners = var.business_division  

  # Environment name such as dev, staging, prod (from variable)
  environment = var.environment_name  

  # Standardized naming prefix: "<division>-<env>"
  name = "${local.owners}-${local.environment}"  

  # Full EKS cluster name used for resource naming and tagging
  eks_cluster_name = "${local.name}-${var.cluster_name}" 
}
