resource "aws_s3_bucket" "bucket" {
  bucket = "gusta-terraform-bucket-test2026"

  tags = local.common_tags

}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}