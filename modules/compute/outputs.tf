
output "security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.ec2.id
}

output "instance_id" {
  description = "ID of the application EC2 instance"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "Public IPv4 address of the application EC2 instance"
  value       = aws_instance.app.public_ip
}
