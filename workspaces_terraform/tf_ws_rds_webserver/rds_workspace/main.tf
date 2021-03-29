module "rds_module" {
  source =  "github.com/nazy67/terraform/aws_terraform_modules//modules/rds"
  env = terraform.workspace
  storage = 10
  skip_snapshot = "true"
  instance_class = "db.t2.micro"
  username = "${terraform.workspace}_ws_user"
}

output "username" {
  value = module.rds_module.module_username
}

output "address" {
  value = module.rds_module.module_address
}