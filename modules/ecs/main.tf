# Create an Amazon ECR repository
resource "aws_ecr_repository" "my_ecr_repo" {
  name = "my-ecr-repo"
}

data "aws_vpc" "default" {
  default = true
}

# Create an ECS Fargate task definition
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-task"
  container_definitions    = jsonencode([
    {
      "name"      : "my-container",
      "image"     : "${aws_ecr_repository.my_ecr_repo.repository_url}:latest",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true
    }
  ])
}

# Create an ECS cluster
resource "aws_ecs_cluster" "my_ecs_cluster" {
  name = "my-ecs-cluster"
}

# Create an ECS Fargate service
resource "aws_ecs_service" "my_ecs_service" {
  name            = "my-ecs-service"
  cluster         = aws_ecs_cluster.my_ecs_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  
  network_configuration {
    subnets          = ["subnet-0c92761fcad57a20e", "subnet-0ede47596eee8fb38"]  # Replace with your subnet IDs
    security_groups  = ["sg-0fd039f5daa34b4d6"]     # Replace with your security group IDs
    assign_public_ip = true
  }
}

# Create an Application Load Balancer (ALB)
resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-0c92761fcad57a20e", "subnet-0ede47596eee8fb38"]  # Replace with your subnet IDs

 /* access_logs {
    bucket = "my-alb-logs-bucket"
    prefix = "alb-logs"
    enabled = true
  } */
}

# Create a target group
resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id  # Replace with your VPC ID
}

# Create a listener for the ALB
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    status_code      = "200"
    content_type     = "text/plain"
    message_body     = "OK"
  }
}

# Attach ECS service to target group
resource "aws_lb_listener_rule" "my_listener_rule" {
  listener_arn = aws_lb.my_alb.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }

  condition {
    host_header {
      values = ["my-domain.com"]  # Replace with your domain
    }
  }
}
