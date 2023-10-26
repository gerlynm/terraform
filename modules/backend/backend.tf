terraform {
  backend "s3" {
    bucket         = "jerriitesters3bucket.in"
    key            = "statefile/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test"
  }
}