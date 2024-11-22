provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  for_each                = toset(var.bucket_names)
  bucket                  = each.value
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
