provider "aws" {
  region = var.region
}

module "bootstrap_backend" {
  source      = "./modules/bootstrap_backend"
  environment = var.environment
}

module "s3" {
  source      = "./modules/s3"
  environment = var.environment
}

module "athena" {
  source      = "./modules/athena"
  bucket_id   = module.s3.bucket_id
  environment = var.environment
}

module "sns" {
  source      = "./modules/sns"
  environment = var.environment
}

module "iam" {
  source      = "./modules/iam"
  environment = var.environment
}

module "lambda" {
  source          = "./modules/lambda"
  athena_db       = module.athena.db_name
  athena_table    = "aws_cost_optimization_report_testing"
  sns_topic_arn   = module.sns.topic_arn
  output_location = "s3://${module.s3.bucket_name}/results/"
  lambda_role_arn = module.iam.lambda_role_arn
  environment     = var.environment
}