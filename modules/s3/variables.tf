variable "bucket" {
  type = string
  description = "value for bucket name for s3 bucket"
}

variable "tags" {
  type = map(string)
  default = {
    Name = ""
    Environment = ""
  }
}