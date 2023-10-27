resource "aws_s3_bucket" "tf_bucket" {
  bucket = var.bucket
}

resource "aws_s3_bucket_cors_configuration" "tf_bucket_cors" {
  bucket = aws_s3_bucket.tf_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}  
