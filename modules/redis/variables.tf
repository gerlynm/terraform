variable "cluster_name" {
  default = "summma"
}

variable "instance_type" {
  default = "cache.t2.medium"
}

variable "security_group_ids" {
  default = "sg-0f64fa3b097202da6"
}

variable "aws_subnet_1" {
  default = "subnet-0b41fa52a78287816"
}

variable "aws_subnet_2" {
  default = "subnet-06968ce5e05476977"
}
