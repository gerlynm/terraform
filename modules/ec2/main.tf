resource "aws_instance" "tf_instance" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags
    count = var.instance_count
    vpc_security_group_ids = var.aws_security_group_id
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_eip" "tf-eip" {
  count = var.instance_count
  instance = aws_instance.tf_instance[count.index].id
}
