resource "aws_sns_topic" "cost_report_alerts" {
  name = "cost-report-alerts-${var.environment}"
  tags = {
    Name        = "Cost Report Alerts"
    Environment = var.environment
    Owner       = "sudheer"
  }
}

output "topic_arn" {
  value = aws_sns_topic.cost_report_alerts.arn
}