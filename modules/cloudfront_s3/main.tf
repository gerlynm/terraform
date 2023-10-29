resource "aws_s3_bucket" "tf-bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

data "aws_iam_policy_document" "tf-bucket-policy-document" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.tf-bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.tf-bucket-oai.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.tf-bucket.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.tf-bucket-oai.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "tf-bucket-policy" {
  bucket = aws_s3_bucket.tf-bucket.id
  policy = data.aws_iam_policy_document.tf-bucket-policy-document.json
}


resource "aws_cloudfront_origin_access_identity" "tf-bucket-oai" {
  comment = "origin identity for ${var.bucket_name}"
}

resource "aws_cloudfront_distribution" "tf-cdn-distribution" {
  origin {
    domain_name = aws_s3_bucket.tf-bucket.bucket_regional_domain_name
    origin_id   = "${var.bucket_name}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.tf-bucket-oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.root_object
  wait_for_deployment = false
  aliases             = [var.domain]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.bucket_name}"
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  custom_error_response {
    error_code         = 404
    response_page_path = "/index.html"
    response_code      = 200
  }

  tags = {
    Environment = var.bucket_name
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}