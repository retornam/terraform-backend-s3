locals {
  bucket_policy = templatefile("${path.module}/templates/policy.json.tpl", {
    bucket = "${var.bucket}-${terraform.workspace}"
  })
}


resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket}-${terraform.workspace}"
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
    Terraform   = true
    workspace   = terraform.workspace
  }
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = local.bucket_policy
}
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


# terraform destroy does not delete the S3 Bucket ACL but does remove the resource from Terraform state.
# see docs link for more info
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl
resource "aws_s3_bucket_ownership_controls" "oc" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "private" {
  depends_on = [aws_s3_bucket_ownership_controls.oc]

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}


resource "aws_s3_bucket_public_access_block" "bucketblock" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
