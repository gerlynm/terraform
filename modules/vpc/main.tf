resource "aws_vpc" "common_vpc" {
  cidr_block = var.cidr  

  tags = {
    Name = var.vpc-name
  }
}

resource "aws_internet_gateway" "common_igw" {
  vpc_id = aws_vpc.common_vpc.id

  tags = {
    Name = var.igw-name
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.common_vpc.id

  tags = {
    Name = var.pubrt-name
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.common_vpc.id

  tags = {
    Name = var.pvtrt-name
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.common_vpc.id
  cidr_block              = var.pub-subnet1-cidr  
  availability_zone       = var.pub-subnet1-az 
  map_public_ip_on_launch = true

  tags = {
    Name = var.pubsubnet1-name
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.common_vpc.id
  cidr_block              = var.pub-subnet2-cidr  
  availability_zone       = var.pub-subnet2-az  
  map_public_ip_on_launch = true

  tags = {
    Name = var.pubsubnet2-name
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id    = aws_vpc.common_vpc.id
  cidr_block = var.pvt-subnet1-cidr  
  availability_zone = var.pvt-subnet1-az  

  tags = {
    Name = var.pvtsubnet1-name
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id    = aws_vpc.common_vpc.id
  cidr_block = var.pvt-subnet2-cidr  
  availability_zone = var.pvt-subnet2-az  

  tags = {
    Name = var.pvtsubnet2-name
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  depends_on = [aws_internet_gateway.common_igw]
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.common_igw]
}

resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.common_igw.id
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
