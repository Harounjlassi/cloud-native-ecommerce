# Output Block
#output "s3_bucket_name" {
#  value = aws_s3_bucket.demo_bucket.bucket
#}

#output "s3_bucket_id" {
#  value = aws_s3_bucket.demo_bucket.id
#}

#output "s3_bucket_arn" {
#  value = aws_s3_bucket.demo_bucket.arn
#  description = "S3 Bucket ARN"
#}


output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the created VPC"
}

output "public_subnet_ids" {
  value       = [for s in aws_subnet.public : s.id]
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = [for s in aws_subnet.private : s.id]
  description = "List of private subnet IDs"
}

output "public_subnet_map" {
  value       = { for az, subnet in aws_subnet.public : az => subnet.id }
  description = "Map of AZ to Public Subnet ID"
}
