output "kms_arn" {
  value = module.kms.kms_arn
}

output "kms_key_id" {
  value = module.kms.kms_key_id
}

output "kms_alias_arn" {
  value = module.kms.kms_alias_arn
}

output "dynamodb_arn" {
  value = module.dynamodb.dynamodbarn
}

output "dynamodb_id" {
  value = module.dynamodb.dynamodbid
}

output "bucket_domain_name" {
  value = module.s3.bucket_domain_name
}

output "bucket_regional_domain_name" {
  value = module.s3.bucket_regional_domain_name
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}