resource "aws_athena_database" "cur_db" {
  name   = "cur_db_${var.environment}"
  bucket = var.bucket_id
}

output "db_name" {
  value = aws_athena_database.cur_db.name
}