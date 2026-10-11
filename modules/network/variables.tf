variable "vpc_cidr" {
  description = "CIDR range for the project VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "project_name" {
  description = "Name used to identify project resources"
  type        = string
  default     = "terraform-devops"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}