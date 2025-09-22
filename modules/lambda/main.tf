resource "aws_lambda_function" "cost_report_lambda" {
  function_name = "cost-report-lambda-prod"
  role          = var.lambda_role_arn
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"

  filename         = "${path.module}/../../lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/../../lambda.zip")

  environment {
    variables = {
      ATHENA_DB       = var.athena_db
      ATHENA_TABLE    = var.athena_table
      SNS_TOPIC_ARN   = var.sns_topic_arn
      OUTPUT_LOCATION = var.output_location
      REGION          = "us-east-1"
    }
  }

  tags = {
    Name        = "Cost Report Lambda"
    Environment = "prod"
    Owner       = "sudheer"
  }
}