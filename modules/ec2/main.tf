data "aws_ami" "ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.aws_security_group_id
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = var.tags
}

resource "aws_volume_attachment" "volumeAttachment" {
  volume_id   = aws_instance.instance.root_block_device.0.volume_id
  instance_id = aws_instance.instance.id
  device_name = "/dev/sda1"
}

resource "aws_eip" "eip" {
  instance = aws_instance.instance.id
}

resource "aws_security_group" "sg" {
  name = var.security_group_name
  vpc_id      = var.vpc_id
  tags = var.tags

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
