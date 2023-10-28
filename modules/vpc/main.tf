resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags                 = var.tags
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id
  tags   = var.tags
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = var.tags
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = var.tags
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.pub-subnet1-cidr
  availability_zone       = var.pub-subnet1-az
  map_public_ip_on_launch = true

  tags = var.tags
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.pub-subnet2-cidr
  availability_zone       = var.pub-subnet2-az
  map_public_ip_on_launch = true

  tags = var.tags
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.pvt-subnet1-cidr
  availability_zone = var.pvt-subnet1-az

  tags = var.tags
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.pvt-subnet2-cidr
  availability_zone = var.pvt-subnet2-az

  tags = var.tags
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  depends_on = [aws_internet_gateway.tf_igw]
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.tf_igw]
  tags       = var.tags
}

resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tf_igw.id
}

resource "aws_route" "private_subnet_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "public_subnet1_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet2_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}
