resource "aws_lightsail_instance" "lightsail_instance" {
  name = var.instance_name
  availability_zone = var.az
  blueprint_id = var.os
  bundle_id = var.bundle_id
  key_pair_name = "LightsailDefaultKeyPair"
}