variable "name" {
  description = "the name of the dynamodb table"
  type        = string
}


variable "environment" {
  type        = string
  description = "the environment the dynamodb table is in"
}

variable "readcapacity" {
  type        = string
  description = "the read capacity of the dynamodb tbale"
  default     = 1
}

variable "writecapacity" {
  type        = string
  description = "the write capacity of the dynamodb table"
  default     = 1
}