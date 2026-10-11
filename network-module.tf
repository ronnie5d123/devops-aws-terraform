module "network" {
  source = "./modules/network"

  vpc_cidr     = "10.0.0.0/16"
  project_name = "terraform-devops"
  environment  = "dev"
}