
module "storage" {
  source = "./modules/storage"

  bucket_name  = "devops-aws-project-pranav"
  project_name = "terraform-devops"
  environment  = "dev"
}
