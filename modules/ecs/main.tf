# Create an Amazon ECR repository
resource "aws_ecr_repository" "tf_ecr_repo" {
  name = var.ecr_repo_name
}

data "aws_vpc" "default" {
  default = true
}

# Create an ECS Fargate task definition
resource "aws_ecs_task_definition" "tf_task_definition" {
  family                   = var.task_definition_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "${var.container_name}",
    "image": "${aws_ecr_repository.tf_ecr_repo.repository_url}:latest",
    "cpu": "${var.cpu}",
    "memory": "${var.cpu}",
    "essential": true
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}

# Create an ECS cluster
resource "aws_ecs_cluster" "tf_ecs_cluster" {
  name = var.ecs_cluster
}

# Create an ECS Fargate service
resource "aws_ecs_service" "tf_ecs_service" {
  name            = var.ecs_servive
  cluster         = aws_ecs_cluster.tf_ecs_cluster.id
  task_definition = aws_ecs_task_definition.tf_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets         # Replace with your subnet IDs
    security_groups  = var.security_groups # Replace with your security group IDs
    assign_public_ip = true
  }
}

# Create an Application Load Balancer (ALB)
resource "aws_lb" "tf_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets # Replace with your subnet IDs

  /* access_logs {
    bucket = "my-alb-logs-bucket"
    prefix = "alb-logs"
    enabled = true
  } */
}

# Create a target group
resource "aws_lb_target_group" "tf_target_group" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id # Replace with your VPC ID
}

# Create a listener for the ALB
resource "aws_lb_listener" "tf_listener" {
  load_balancer_arn = aws_lb.tf_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
# Attach ECS service to target group
resource "aws_lb_listener_rule" "tf_listener_rule" {
  listener_arn = aws_lb_listener.tf_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf_target_group.arn
  }

  condition {
    host_header {
      values = var.domain # Replace with your domain
    }
  }
}
