variable "bucket" {
  description = "The name of the S3 bucket to be created."
}

variable "region" {
  default = "us-east-1"
  description = "The AWS region where resources will be created. Default is us-east-1."
}

variable "dynamodb_table" {
  description = "specify the dynamodb table name"
}

variable "tags" {
  description = "A map of tags to be applied to AWS resources. Default tags are provided for 'Name' and 'Environment'."
  default = {
    Name        = "tf"
    Environment = "dev"
  }
}