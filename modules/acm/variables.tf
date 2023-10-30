variable "domain_name" {
  type = string
}

variable "tags" {
  default = {
    Name        = ""
    Environment = ""

  }
}