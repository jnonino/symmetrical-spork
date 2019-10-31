# ---------------------------------------------------------------------------------------------------------------------
# AWS ECS SERVICE
# ---------------------------------------------------------------------------------------------------------------------
output "aws_ecs_service_service_id" {
  description = "The Amazon Resource Name (ARN) that identifies the service." 
  value       = module.ecs-fargate-service.aws_ecs_service_service_id
}

output "aws_ecs_service_service_name" {
  description = "The name of the service." 
  value       = module.ecs-fargate-service.aws_ecs_service_service_name
}

output "aws_ecs_service_service_cluster" {
  description = "The Amazon Resource Name (ARN) of cluster which the service runs on." 
  value       = module.ecs-fargate-service.aws_ecs_service_service_cluster
}

output "aws_ecs_service_service_desired_count" {
  description = "The number of instances of the task definition" 
  value       = module.ecs-fargate-service.aws_ecs_service_service_desired_count
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS LOAD BALANCER
# ---------------------------------------------------------------------------------------------------------------------
output "lb_id" {
  description = "Load Balancer ID"
  value       = module.ecs-fargate-service.lb_id
}

output "lb_arn" {
  description = "Load Balancer ARN"
  value       = module.ecs-fargate-service.lb_arn
}

output "lb_arn_suffix" {
  description = "Load Balancer ARN Suffix"
  value       = module.ecs-fargate-service.lb_arn_suffix
}

output "lb_dns_name" {
  description = "Load Balancer DNS Name"
  value       = module.ecs-fargate-service.lb_dns_name
}

output "lb_zone_id" {
  description = "Load Balancer Zone ID"
  value       = module.ecs-fargate-service.lb_zone_id
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS SECURITY GROUPS
# ---------------------------------------------------------------------------------------------------------------------
output "lb_sg_id" {
  description = "Load Balancer Security Group - The ID of the security group"
  value       = module.ecs-fargate-service.lb_sg_id
}

output "lb_sg_arn" {
  description = "Load Balancer Security Group - The ARN of the security group"
  value       = module.ecs-fargate-service.lb_sg_arn
}

output "lb_sg_name" {
  description = "Load Balancer Security Group - The name of the security group"
  value       = module.ecs-fargate-service.lb_sg_name
}

output "lb_sg_description" {
  description = "Load Balancer Security Group - The description of the security group"
  value       = module.ecs-fargate-service.lb_sg_description
}

output "ecs_tasks_sg_id" {
  description = "ECS Tasks Security Group - The ID of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_id
}

output "ecs_tasks_sg_arn" {
  description = "ECS Tasks Security Group - The ARN of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_arn
}

output "ecs_tasks_sg_name" {
  description = "ECS Tasks Security Group - The name of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_name
}

output "ecs_tasks_sg_description" {
  description = "ECS Tasks Security Group - The description of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_description
}

