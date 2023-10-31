variable "bucket" {
  type = string
  description = "enter the bucket name"
}

variable "username" {
  type = string
  description = "username for the aws account which one need to access the bucket"
}

variable "tags" {
  type = map(string)
  default = {
    Name = ""
    Environment = ""
  }
}