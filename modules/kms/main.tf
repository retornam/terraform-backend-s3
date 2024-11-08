resource "aws_kms_key" "key" {
  description             = "terraform-kms-key"
  enable_key_rotation     = true
  deletion_window_in_days = 30

  tags = {
    Name        = var.name
    Environment = var.environment
    Terraform   = true
  }
}


resource "aws_kms_alias" "key" {
  name          = "alias/terraform-${var.name}"
  target_key_id = aws_kms_key.key.key_id
}
