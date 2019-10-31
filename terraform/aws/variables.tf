# ---------------------------------------------------------------------------------------------------------------------
# Misc
# ---------------------------------------------------------------------------------------------------------------------
variable "name_preffix" {
  description = "Name preffix for resources on AWS"
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS CREDENTIALS AND REGION
# ---------------------------------------------------------------------------------------------------------------------
variable "profile" {
  description = "AWS API key credentials to use"
}
variable "region" {
  description = "AWS Region where the infrastructure is hosted in"
}

# ---------------------------------------------------------------------------------------------------------------------
# LOGS
# ---------------------------------------------------------------------------------------------------------------------
variable log_group_path {
  description = "Log Group Path"
}

# ---------------------------------------------------------------------------------------------------------------------
# ECS CONTAINER AND TASK DEFINITIONS
# ---------------------------------------------------------------------------------------------------------------------
variable "container_image" {
  description = "The image used to start the container."
}
variable "container_port" {
  description = "Port on which the container is listening"
}