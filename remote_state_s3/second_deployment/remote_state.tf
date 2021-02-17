data "terraform_remote_state" "sns" {  # this has to match with backend of sns 
  backend = "s3"
  config = {
    bucket = "terraform-nazy-state"
    key    = "sns.tfstate"
    region = "us-east-1"
  }
}