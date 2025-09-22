resource "aws_sns_topic" "cost_report_alerts" {
  name = "cost-report-alerts-prod"

  tags = {
    Name        = "Cost Report Alerts"
    Environment = "prod"
    Owner       = "sudheer"
  }
}

output "topic_arn" {
  value = aws_sns_topic.cost_report_alerts.arn
}