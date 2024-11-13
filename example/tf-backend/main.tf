module "backend_s3" {
  source        = "git::https://github.com/retornam/terraform-backend-s3.git?ref=main"
  environment   = "production"
  region        = "us-west-2"
  bucket        = "dot"
  name          = "dot-terraform-statefile"
  readcapacity  = 2
  writecapacity = 2
}
