module "ec2" {
  source = "./modules/ec2"
  instance_type = "t2.medium"
  key_name = "skill"
  instance_count = 2
  aws_security_group_id = ["sg-02c4998115571e75b"]
}

output "private_ip" {
  value = module.ec2.private_ip
}

output "public_ip" {
  value = module.ec2.public_ip
}