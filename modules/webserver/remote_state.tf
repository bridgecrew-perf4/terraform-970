# data "terraform_remote_state" "rds" {
#   backend = "s3"
#   config = {
#     bucket = "terraform-nazy-state"
#     key    = "${var.env}/rds.tfstate"
#     region = "us-east-1"
#   }
# }
data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = var.remote_state["bucket"]
    key    = var.remote_state["key"]
    region = var.remote_state["region"]
  }
}
