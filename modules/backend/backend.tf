terraform {
  backend "s3" {
    bucket         = "<bucket-name>"
    key            = "<path>/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "<table_name>"
  }
}