resource "aws_s3_bucket" "lakehouse_s3" {
  bucket = "${var.project_name}-${var.environment}-lakehouse"
  tags = {
    Environment = var.environment
    Project = var.project_name
  }
}

resource "aws_s3_bucket_versioning" "lakehouse_s3_version" {
    bucket = aws_s3_bucket.lakehouse_s3.id
    versioning_configuration {
      status = "Enabled"
    } 
}