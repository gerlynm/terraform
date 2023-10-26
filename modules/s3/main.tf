resource "aws_s3_bucket" "example" {
  bucket = var.bucket-Name

  tags = {
    Name        = var.bucket-tags-Name
    Environment = var.bucket-Environment
  }
}