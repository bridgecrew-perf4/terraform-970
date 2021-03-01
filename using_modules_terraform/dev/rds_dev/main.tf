module "rds_module" {
  source =  "/Users/nazgulkhalilova/Desktop/terraform_class/session_8/modules/rds"
  env = "dev"
  storage = 10
  skip_snapshot = "true"
  instance_class = "db.t2.micro"
  username = "devuser"
}

resource "random_pet" "test" {  
}

output "pet_name" {
  value = random_pet.test.id  
}