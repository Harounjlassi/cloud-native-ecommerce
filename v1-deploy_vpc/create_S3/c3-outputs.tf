output "bucket_name" {
    value = aws_s3_bucket.demo_bucket.bucket
    description = "bucket name"    
}

output "bucket_id" {
    value = aws_s3_bucket.demo_bucket.id
    description = "bucket id"    
}