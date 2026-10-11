
resource "aws_key_pair" "ec2" {
  key_name   = "devops-aws-project-key"
  public_key = file("~/.ssh/devops-aws-project.pub")

  tags = {
    Name        = "devops-aws-project-key"
    Environment = "dev"
    Project     = "terraform-devops"
  }
}