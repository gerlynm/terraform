variable "identifier" {
  type        = string
  description = "db name"
}

variable "allocated_storage" {
  type        = number
  description = "size of the storage"
  default     = 20
}

variable "engine_type" {
  type    = string
  default = "postgres"
}

variable "engine_version" {
  type    = string
  default = "15.2"
}

variable "instance_type" {
  type    = string
  default = "db.t3.micro"
}

variable "db_name" {
  type = string
}

variable "master_username" {
  type = string
}

variable "master_password" {
  type = string
}

variable "kms_key_id" {
  type = string

}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "parameter_family" {
  type    = string
  default = "postgres15"
}

variable "subnet_1" {
  type = string
}

variable "subnet_2" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    Namae       = ""
    Environment = ""
  }
}