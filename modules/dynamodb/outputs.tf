output "dynamodbarn" {
  value = aws_dynamodb_table.table.arn
}

output "dynamodbid" {
  value = aws_dynamodb_table.table.id
}