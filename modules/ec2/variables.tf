variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "name of the key pair"
}

variable "availability_zone" {
  type        = string
  description = "availability zone"
}

variable "subnet_id" {
  type        = string
  description = "ID of the VPC subnet"
}

variable "aws_security_group_id" {
  type        = list(string)
  description = "security group IDs"
}

variable "volume_size" {
  type        = number
  default     = 8
  description = "The size (in GB) of the EBS volume. Defaults to 8GB."
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "demo"
    Environment = "demo"
  }
  description = "tag the resources."
}

variable "security_group_name" {
  type = string
  description = "security group name."
}

variable "vpc_id" {
  type = string
  description = "VPC id."
}

variable "ingress_ports" {
  type = list(number)
  description = "Specify the ports"
}

