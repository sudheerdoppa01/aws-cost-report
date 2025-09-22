resource "aws_iam_role" "lambda_role" {
  name = "lambda-cost-report-role-prod"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })

  tags = {
    Name        = "Lambda Cost Report Role"
    Environment = "prod"
    Owner       = "sudheer"
  }
}

resource "aws_iam_role_policy_attachment" "lambda_permissions" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/AmazonAthenaFullAccess",
    "arn:aws:iam::aws:policy/AmazonSNSFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ])

  role       = aws_iam_role.lambda_role.name
  policy_arn = each.value
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}