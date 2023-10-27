variable "bucket" {
  description = "value for bucket name for s3 bucket"
}

variable "tags" {
  default = {
    Name = ""
    Environment = ""
  }
}