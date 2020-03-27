variable "bucket" {
  description = "name of the bucket to use for terraform"
}


variable "environment" {
  description = "environment  [development, staging, production]"
  default     = "production"
}


variable "kmsarn" {
  description = "arn of the kms key to use for encryption"
}