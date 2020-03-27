variable "environment" {
  type = string
}

variable "region" {
  type = string
  default = "us-west-2"
}

variable "bucket" {
  type        = string
  description = "name of S3 bucket"
}

variable "dynamodb_name" {
  type        = string
  description = "name of dynamodb table"
}

variable "readcapacity" {
  type    = number
  default = 1
}

variable "writecapacity" {
  type    = number
  default = 1
}