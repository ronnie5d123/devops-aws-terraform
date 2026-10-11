
module "iam" {
  source = "./modules/iam"

  project_name = "terraform-devops"
  environment  = "dev"
}
