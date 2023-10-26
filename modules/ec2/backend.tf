terraform {
  backend "s3" {
    bucket         = "www1.jerriitest" 
    key            = "test/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}