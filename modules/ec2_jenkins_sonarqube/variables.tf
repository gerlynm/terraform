variable "instance_type" {
  description = "instance-type value"
}

variable "key_name" {
  description = "key pair name"
}

variable "tags" {
  default = {
    Name = ""
    Environment = ""
  }
}
