resource "aws_s3_bucket" "cost_report_data" {
  bucket        = "aws-cost-report-data-${var.environment}"
  force_destroy = true
  tags = {
    Name        = "AWS Cost Report Data"
    Environment = var.environment
    Owner       = "sudheer"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.cost_report_data.bucket
}

output "bucket_id" {
  value = aws_s3_bucket.cost_report_data.id
}