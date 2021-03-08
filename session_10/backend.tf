terraform {
  backend "s3" {
  bucket = "terraform-nazy-state"
  key = "session_10/ws.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-locks"
  #workspace_prefix = 
  } 
}