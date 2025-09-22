terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "terraform-state-cost-report-prod"
    key            = "cost-report/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}