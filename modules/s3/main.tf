resource "aws_s3_bucket" "tf_bucket" {
  bucket = var.bucket
  tags = var.tags
}