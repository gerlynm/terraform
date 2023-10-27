variable "instance_type" {
  description = "enter the instance type of ec2 instance"
}

variable "key_name" {
  description = "enter the key pair of ec2 instance"
}

variable "tags" {
  default = {
    Name = ""
    Environment = ""
  }
}

variable "instance_count" {
  description = "how many instance need to create"
}

variable "aws_security_group_id" {
  description = "security group id"
}