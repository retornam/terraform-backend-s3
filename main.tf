data  "aws_region" "current" {}

module "kms" {
  source = "./modules/kms"
  environment    = var.environment
}


module "s3" {
  source = "./modules/s3"
  bucket = var.bucket
  environment   = var.environment
  kmsarn = module.kms.kms_arn
}

module "dynamodb" {
  source        = "./modules/dynamodb"
  name          = var.dynamodb_name
  readcapacity  = var.readcapacity != "" ? var.readcapacity : 1
  writecapacity = var.writecapacity != "" ? var.writecapacity : 1
  environment          = var.environment
}