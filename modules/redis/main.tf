resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.cluster_name
  engine               = "redis"
  node_type            = var.instance_type
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.redis.id
  engine_version       = "7.0"
  port                 = 6379
  security_group_ids   = [var.security_group_ids]
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  apply_immediately    = true
}



resource "aws_elasticache_parameter_group" "redis" {
  name        = var.cluster_name
  family      = "redis7"
  description = "Parameter group for ${var.cluster_name}-redis}"
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = var.cluster_name
  subnet_ids = [var.aws_subnet_1, var.aws_subnet_2]
}