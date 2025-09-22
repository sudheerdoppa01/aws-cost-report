resource "aws_athena_database" "cur_db" {
  name   = "cur_db_prod"
  bucket = var.bucket_id
}

output "db_name" {
  value = aws_athena_database.cur_db.name
}