
output "vpc_id" {
  description = "ID of the project VPC"
  value       = module.network.vpc_id
}

output "ec2_instance_id" {
  description = "ID of the application EC2 instance"
  value       = module.compute.instance_id
}

output "app_public_ip" {
  description = "Public IPv4 address of the application EC2 instance"
  value       = module.compute.public_ip
}

output "s3_bucket_name" {
  description = "Name of the application S3 bucket"
  value       = module.storage.bucket_name
}
