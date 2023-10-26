variable "bucket" {
  description = "enter the s3 bucket name"
}

variable "region" {
  default = "us-east-1"
}

variable "dynamodb_table" {
  description = "specify the dynamodb table name"
}

variable "tags" {
  default = {
    Name        = "example"
    Environment = "dev"
  }
}