output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.example_bucket.arn
}
