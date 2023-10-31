resource "aws_db_instance" "rds_instance" {
  identifier                = var.identifier
  allocated_storage         = var.allocated_storage
  instance_class            = var.instance_type
  engine                    = var.engine_type
  engine_version            = var.engine_version
  db_name                   = var.db_name
  username                  = var.master_username
  password                  = var.master_password
  backup_retention_period   = 7
  storage_encrypted         = true
  kms_key_id                = var.kms_key_id
  parameter_group_name      = aws_db_parameter_group.rds_instance.id
  db_subnet_group_name      = aws_db_subnet_group.rds_instance.id
  vpc_security_group_ids    = var.vpc_security_group_ids
  copy_tags_to_snapshot     = true
  skip_final_snapshot       = false
  final_snapshot_identifier = var.identifier
  apply_immediately         = true
  tags                      = var.tags
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
  subnet_ids = [var.subnet_1, var.subnet_2]

  tags = var.tags
}