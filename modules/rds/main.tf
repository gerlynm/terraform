resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine_type
  engine_version         = var.engine_version
  instance_class         = var.instance_type
  identifier             = var.identifier
  db_name                = var.db_name
  username               = var.master_username
  password               = var.master_password
  parameter_group_name   = aws_db_parameter_group.rds_instance.id
  db_subnet_group_name   = aws_db_subnet_group.rds_instance.id
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = true
  apply_immediately      = true
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
}

resource "aws_db_parameter_group" "rds_instance" {
  name   = var.identifier
  family = var.parameter_family

}

resource "aws_db_subnet_group" "rds_instance" {
  name       = var.identifier
  subnet_ids = [var.aws_subnet_1, var.aws_subnet_2]

  tags = {
    Name = var.identifier
  }
}