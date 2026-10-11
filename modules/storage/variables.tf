
variable "bucket_name" {
  description = "Globally unique name for the application S3 bucket"
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
