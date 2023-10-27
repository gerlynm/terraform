variable "bucket" {
  description = "enter the bucket name"
}

variable "username" {
  description = "username for the aws account which one need to access the bucket"
}

variable "tags" {
  default = {
    Name = ""
    Environment = ""
  }
}