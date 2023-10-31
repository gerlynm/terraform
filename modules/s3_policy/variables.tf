variable "bucket" {
  type = string
  description = "enter the bucket name"
}

variable "username" {
  type = string
  description = "username for the aws account"
}

variable "tags" {
  type = map(string)
  default = {
    Name = ""
    Environment = ""
  }
}