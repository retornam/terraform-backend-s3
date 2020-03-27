resource "aws_dynamodb_table" "table" {
  name           = var.name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.readcapacity
  write_capacity = var.writecapacity
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = var.environment
    Name        = var.name
    Terraform = true
  }
}