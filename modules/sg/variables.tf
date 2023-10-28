variable "aws_security_group" {
  description = "secuity group name"
}

variable "vpc_id" {
  type = string
  description = "vpc id in which vpc sg need to create"
}

variable "sg_ingress_ports" {
  description = "ports to set in inbound rules"
  type        = list(number)
}

variable "tags" {
  default = {
    Name        = ""
    Environment = ""
  }
}