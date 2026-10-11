
resource "aws_key_pair" "ec2" {
  key_name   = "devops-aws-project-key"
  public_key = var.public_key

  tags = {
    Name        = "devops-aws-project-key"
    Environment = "dev"
    Project     = "terraform-devops"
  }
}