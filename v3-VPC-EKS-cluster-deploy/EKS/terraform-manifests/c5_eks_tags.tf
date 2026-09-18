
# Public Subnet Tags for EKS Load Balancer Support
resource "aws_ec2_tag" "eks_subnet_tag_public_elb" {
  for_each    = toset(data.terraform_remote_state.vpc.outputs.public_subnet_ids)
  resource_id = each.value
  
  # Indicates this subnet is suitable for public (internet-facing) ELBs.
  key         = "kubernetes.io/role/elb"
  
  # AWS/EKS expects the value "1" to enable this role.
  value       = "1"
}


# Add the cluster ownership tag to every public subnet.
resource "aws_ec2_tag" "eks_subnet_tag_public_cluster" {
  for_each    = toset(data.terraform_remote_state.vpc.outputs.public_subnet_ids)
  resource_id = each.value
  key         = "kubernetes.io/cluster/${local.eks_cluster_name}"
  
  # "shared" means the subnet can be shared with multiple cluster resources.
  value       = "shared"
}


# Private Subnet Tags for EKS Internal LoadBalancer Support

# Add the "kubernetes.io/role/internal-elb" tag to every private subnet.
resource "aws_ec2_tag" "eks_subnet_tag_private_elb" {
  for_each    = toset(data.terraform_remote_state.vpc.outputs.private_subnet_ids)
  resource_id = each.value
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}


# Add the cluster ownership tag to every private subnet.
resource "aws_ec2_tag" "eks_subnet_tag_private_cluster" {
  for_each    = toset(data.terraform_remote_state.vpc.outputs.private_subnet_ids)
  resource_id = each.value
  key         = "kubernetes.io/cluster/${local.eks_cluster_name}"
  value       = "shared"
}
