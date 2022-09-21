resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "sprint6-cr-pvc-artifacts-tf"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.artifact_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.artifact_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}