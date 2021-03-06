data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = var.remote_state["bucket"]        #bucket = "terraform-nazy-state"
    key    = var.remote_state["key"]           #key    = "${local.prefix}/rds.tfstate"
    region = var.remote_state["region"]        #region = "us-east-1"                                                                     
  }
}