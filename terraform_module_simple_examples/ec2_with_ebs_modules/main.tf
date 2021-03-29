provider "aws" {
  region = "us-east-1"
}
module "ec2-instance" {
  source = "./ec2-module/"
  availability_zone ="us-east-1b"
}