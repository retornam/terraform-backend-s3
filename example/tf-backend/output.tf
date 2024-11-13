output "kms_arn" {
  value = module.backend_s3.kms_arn
}

output "kms_key_id" {
  value = module.backend_s3.kms_key_id
}

output "kms_alias_arn" {
  value = module.backend_s3.kms_alias_arn
}

output "dynamodb_arn" {
  value = module.backend_s3.dynamodb_arn
}

output "dynamodb_id" {
  value = module.backend_s3.dynamodb_id
}

output "bucket_domain_name" {
  value = module.backend_s3.bucket_domain_name
}

output "bucket_regional_domain_name" {
  value = module.backend_s3.bucket_regional_domain_name
}

output "bucket_arn" {
  value = module.backend_s3.bucket_arn
}
