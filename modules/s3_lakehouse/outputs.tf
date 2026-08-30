output "s3_bucket_name" {
  description = "Nombre del bucket"
  value = aws_s3_bucket.lakehouse_s3.bucket
}
output "s3_bucket_arn" {
  description = "ARN del bucket s3 creado antes"
  value = aws_s3_bucket.lakehouse_s3.arn
}