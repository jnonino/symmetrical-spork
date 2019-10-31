# ---------------------------------------------------------------------------------------------------------------------
# Locals
# ---------------------------------------------------------------------------------------------------------------------
locals {
  container_name = var.name_preffix
  log_configuration = {
    logDriver = "awslogs"
    options = {
      "awslogs-region"        = var.region
      "awslogs-group"         = module.aws_cw_logs.logs_path
      "awslogs-stream-prefix" = "ecs"
    }
    secretOptions = null
  }
  healthcheck = {
    command     = [ "CMD-SHELL", "curl -f http://localhost/ || exit 1" ]
    retries     = 3
    timeout     = 5
    interval    = 30
    startPeriod = 20
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS Cloudwatch Logs
# ---------------------------------------------------------------------------------------------------------------------
module aws_cw_logs {
  source    = "cn-terraform/cloudwatch-logs/aws"
  version   = "1.0.3"
  logs_path = var.log_group_path
  profile   = var.profile
  region    = var.region
}

# ---------------------------------------------------------------------------------------------------------------------
# Networking
# ---------------------------------------------------------------------------------------------------------------------
module networking {
  source          = "cn-terraform/networking/aws"
  version         = "2.0.3"
  name_preffix    = var.name_preffix
  profile         = var.profile
  region          = var.region
  vpc_cidr_block  = "192.168.0.0/16"
  availability_zones                          = [ "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d" ]
  public_subnets_cidrs_per_availability_zone  = [ "192.168.0.0/19", "192.168.32.0/19", "192.168.64.0/19", "192.168.96.0/19" ]
  private_subnets_cidrs_per_availability_zone = [ "192.168.128.0/19", "192.168.160.0/19", "192.168.192.0/19", "192.168.224.0/19" ]
}

# ---------------------------------------------------------------------------------------------------------------------
# ECS Cluster
# ---------------------------------------------------------------------------------------------------------------------
module ecs-cluster {
  source  = "cn-terraform/ecs-cluster/aws"
  version = "1.0.2"
  name    = var.name_preffix
  profile = var.profile
  region  = var.region
}

# ---------------------------------------------------------------------------------------------------------------------
# ECS Task Definition
# ---------------------------------------------------------------------------------------------------------------------
module td {
  source            = "cn-terraform/ecs-fargate-task-definition/aws"
  version           = "1.0.7"
  name_preffix      = var.name_preffix
  profile           = var.profile
  region            = var.region
  container_name    = local.container_name
  container_image   = var.container_image
  container_port    = var.container_port
  log_configuration = local.log_configuration
  healthcheck       = local.healthcheck
}

# ---------------------------------------------------------------------------------------------------------------------
# ECS Service
# ---------------------------------------------------------------------------------------------------------------------
module ecs-fargate-service {
  source              = "cn-terraform/ecs-fargate-service/aws"
  version             = "1.0.5"
  name_preffix        = var.name_preffix
  profile             = var.profile
  region              = var.region
  vpc_id              = module.networking.vpc_id
  task_definition_arn = module.td.aws_ecs_task_definition_td_arn
  container_name      = local.container_name
  container_port      = module.td.container_port
  ecs_cluster_name    = module.ecs-cluster.aws_ecs_cluster_cluster_name
  ecs_cluster_arn     = module.ecs-cluster.aws_ecs_cluster_cluster_arn
  subnets             = module.networking.private_subnets_ids

  health_check_grace_period_seconds = 20
}