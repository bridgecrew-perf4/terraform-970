provider "aws" {
  region = "us-east-1"
}
module "amazon_linux" {
  source = "../ec2_child_module/"
}