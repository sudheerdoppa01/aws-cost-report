resource "aws_s3_bucket" "tf_state" {
  bucket        = "terraform-state-cost-report-${var.environment}"
  force_destroy = true
  tags = {
    Name        = "Terraform State Bucket"
    Environment = var.environment
    Owner       = "sudheer"
  }
}

resource "aws_dynamodb_table" "tf_lock_table" {
  name         = "terraform-locks-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "Terraform Lock Table"
    Environment = var.environment
    Owner       = "sudheer"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.tf_state.bucket
}

output "lock_table_name" {
  value = aws_dynamodb_table.tf_lock_table.name
}