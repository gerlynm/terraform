variable "allocated_storage" {
  description = "size of the storage"
  default = 20
}

variable "engine_type" {
  default = "postgres"
}

variable "engine_version" {
  default = "15.4"
}

variable "instance_type" {
  default = "db.t3.micro"
}

variable "identifier" {
  default = "tf-db"
}

variable "db_name" {
  default = "tf_db"
}

variable "master_username" {
  default = "adminUser"
}

variable "master_password" {
  default = "123456Grainbow*"
}

variable "vpc_security_group_ids" {
  
}

variable "parameter_family" {
  default = "postgres15"
}

variable "aws_subnet_1" {

}

variable "aws_subnet_2" {
  
}