module "rds_module" {
  source =  "/Users/nazgulkhalilova/Desktop/terraform_class/session_8/modules/rds"
  env = "qa"
  storage = 15
  skip_snapshot = "true"
  instance_class = "db.t2.micro"
  username = "qa_user"
}
output "pet_name" {
  value = module.rds_module.module_pet_name_value
}