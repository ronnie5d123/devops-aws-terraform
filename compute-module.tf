
module "compute" {
  source = "./modules/compute"

  vpc_id                = module.network.vpc_id
  public_subnet_id      = module.network.public_subnet_ids[0]
  instance_profile_name = module.iam.instance_profile_name
  project_name          = "terraform-devops"
  environment           = "dev"
}
