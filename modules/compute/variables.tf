
variable "vpc_id" {
  description = "ID of the VPC where compute resources will run"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet for the EC2 instance"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile attached to the EC2 instance"
  type        = string
}

variable "project_name" {
  description = "Name used to identify project resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}
