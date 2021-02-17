terraform {
  backend "s3" {
  bucket = "terraform-nazy-state"
  key = "sns.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-locks"
  } 
}