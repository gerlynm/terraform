module "vpc" {
  source           = "./modules/vpc"
  cidr             = "10.0.0.0/16"
  vpc-name         = "common"
  igw-name         = "igw-common"
  pubrt-name       = "PublicRouteTable"
  pvtrt-name       = "PrivateRouteTable"
  pubsubnet1-name  = "PublicSubnet1"
  pub-subnet1-cidr = "10.0.1.0/24"
  pub-subnet1-az   = "us-east-1a"
  pubsubnet2-name  = "PublicSubnet2"
  pub-subnet2-cidr = "10.0.2.0/24"
  pub-subnet2-az   = "us-east-1b"
  pvtsubnet1-name  = "PrivateSubnet1"
  pvt-subnet1-cidr = "10.0.3.0/24"
  pvt-subnet1-az   = "us-east-1a"
  pvtsubnet2-name  = "PrivateSubnet2"
  pvt-subnet2-cidr = "10.0.4.0/24"
  pvt-subnet2-az   = "us-east-1b"
}

module "sg" {
  source             = "./modules/sg"
  aws_security_group = "postgres-rds-sg"
  sg_ingress_ports   = [80, 443]
  vpc_id             = module.vpc.vpc_id
}

module "rds" {
  source                 = "./modules/rds"
  vpc_security_group_ids = [module.sg.sg_id]
  aws_subnet_2           = module.vpc.private_subnet1_id
  aws_subnet_1           = module.vpc.private_subnet2_id
  identifier             = "sampledb"
}