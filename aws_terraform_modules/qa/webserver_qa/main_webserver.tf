module "webserver_module" {
  source = "../../../../../../modules/web_server"
  
  env = "qa"
  instance_type = "t2.micro"
  
  remote_state = {
      bucket = "terraform-nazy-state"
      key = "qa/rds.tfstate"
      region = "us-east-1"
  }
} 

output "alb_dns" {
  value = module.webserver_module.module_alb_dns
}
