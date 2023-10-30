variable "instance_type" {
  type        = string
  description = "The EC2 instance type to be used for the virtual machine."
}

variable "key_name" {
  type        = string
  description = "The name of the key pair used for SSH authentication to the EC2 instance."
}

variable "availability_zone" {
  type        = string
  description = "The AWS availability zone in which to deploy the resources."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the VPC subnet where the EC2 instance will be launched."
}

variable "aws_security_group_id" {
  type        = list(string)
  description = "A list of security group IDs for controlling inbound and outbound network traffic."
}

variable "volume_size" {
  type        = number
  default     = 8
  description = "The size (in GB) of the EBS volume to attach to the EC2 instance. Defaults to 8GB."
}

variable "tags" {
  type = map(string)
  default = {
    Name        = "demo"
    Environment = "demo"
  }
  description = "A map of key-value pairs to tag the AWS resources created."
}

variable "security_group_name" {
  type = string
  description = "The name of the security group to associate with the EC2 instance. Specify the security group by its name."
}

variable "vpc_id" {
  type = string
  description = "The ID of the VPC where the EC2 instance will be deployed. Select the specific VPC for the instance deployment."
}

variable "ingress_ports" {
  type = list(number)
  description = "A list of numbers representing ingress ports to open in the security group. Specify the ports that should be accessible for incoming traffic."
}

