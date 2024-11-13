terraform {
  backend "s3" {
    bucket         = "dot-default"
    key            = "state/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    kms_key_id     = "alias/terraform-dot-terraform-statefile"
    dynamodb_table = "dot-terraform-statefile"
  }
}
