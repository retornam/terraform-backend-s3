variable "environment" {
  type = string
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "bucket" {
  type        = string
  description = "name of S3 bucket"
}

variable "name" {
  type        = string
  description = "name for the KMS key as well as DynamoDB table"
}

variable "readcapacity" {
  type    = number
  default = 1
}

variable "writecapacity" {
  type    = number
  default = 1
}
