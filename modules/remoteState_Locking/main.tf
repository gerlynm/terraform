resource "aws_s3_bucket" "tf-bucket" {
  bucket = var.bucket
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "tf-bucket-versioning" {
  bucket = aws_s3_bucket.tf-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "tf-dynamodb" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags
}

module "backend_config" {
  source = "../backend"
  
}