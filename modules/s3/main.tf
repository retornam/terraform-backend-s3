data "template_file" "bucketpolicy" {
  template = file("${path.module}/templates/policy.json.tpl")

  vars = {
    bucket = "${var.bucket}-${terraform.workspace}"
  }
}


resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket}-${terraform.workspace}"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kmsarn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Environment = var.environment
    Terraform = true
    workspace = terraform.workspace
  }
}


resource "aws_s3_bucket_public_access_block" "bucketblock" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
