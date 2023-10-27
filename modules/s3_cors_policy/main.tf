resource "aws_s3_bucket" "tf_bucket" {
  bucket = var.bucket
  tags = var.tags
}

resource "aws_s3_bucket_policy" "tf_policy" {
  bucket = aws_s3_bucket.tf_bucket.id
  policy = data.aws_iam_policy_document.tf_access.json
}

data "aws_iam_user" "tf_user" {
  user_name = var.username
}

data "aws_iam_policy_document" "tf_access" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_iam_user.tf_user.arn] 
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      aws_s3_bucket.tf_bucket.arn,
      "${aws_s3_bucket.tf_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_cors_configuration" "tf_bucket_cors" {
  bucket = aws_s3_bucket.tf_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = []
  }
}  
