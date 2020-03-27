output "kms_arn" {
  value = aws_kms_key.key.arn
}

output "kms_key_id" {
  value = aws_kms_key.key.key_id
}


output "kms_alias_arn" {
  value = aws_kms_alias.key.arn
}