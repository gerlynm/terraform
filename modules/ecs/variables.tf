variable "ecr_repo_name" {
  type = string
}

variable "task_definition_name" {
  type = string
}

variable "cpu" {
  type = number
  default = 256
}

variable "memory" {
  type = number
  default = 512
}

variable "container_name" {
  type = string
}

variable "ecs_cluster" {
  type = string
}

variable "ecs_servive" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "alb_name" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "domain" {
  type = list(string)
}
