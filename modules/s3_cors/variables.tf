variable "bucket" {
  type = string
  description = "bucket name"
}

variable "tags" {
  type = map(string)
  default = {
    Name = ""
    Environment = ""
  }
}