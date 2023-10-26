resource "aws_s3_bucket" "example" {
  bucket = var.bucket
  tags   = var.tags
}

resource "aws_dynamodb_table" "name" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags
}