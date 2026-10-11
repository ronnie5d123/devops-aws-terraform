
resource "aws_security_group" "ec2" {
  name        = "devops-ec2-sg"
  description = "Security group for DevOps project EC2"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "devops-ec2-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2_ssh" {
  security_group_id = aws_security_group.ec2.id

  cidr_ipv4   = "${chomp(data.http.my_ip.response_body)}/32"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "Allow SSH from my public IP"
}

resource "aws_vpc_security_group_ingress_rule" "ec2_http" {
  security_group_id = aws_security_group.ec2.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP traffic from the internet"
}

resource "aws_vpc_security_group_ingress_rule" "ec2_https" {
  security_group_id = aws_security_group.ec2.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "Allow HTTPS traffic from the internet"
}

resource "aws_vpc_security_group_egress_rule" "ec2_all" {
  security_group_id = aws_security_group.ec2.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow outbound traffic to the internet"
}

data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "app" {
  ami           = data.aws_ssm_parameter.al2023_ami.value
  instance_type = "t3.micro"

  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  iam_instance_profile   = var.instance_profile_name
  key_name               = "devops-aws-project-key"

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    encrypted   = true
  }

  user_data = <<-EOF
    #!/bin/bash

    dnf install -y nginx

    systemctl enable nginx
    systemctl start nginx

    echo "<h1>DevOps AWS Project</h1><p>EC2 successfully deployed with Terraform 🚀</p>" > /usr/share/nginx/html/index.html
  EOF

  associate_public_ip_address = true
}
