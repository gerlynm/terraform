variable "instance_name" {
  description = "lightsail instance name"
}

variable "availability_zone" {
  description = "availability zone"
}

variable "blueprint_id" {
  description = "operating system"
}

variable "bundle_id" {
  description = "bundle id"
}

variable "key_pair_name" {
  default = "LightsailDefaultKeyPair"
}

variable "tags" {
  default = {
    Name        = ""
    Environment = ""
  }
}