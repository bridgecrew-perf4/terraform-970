provider "aws" {
  region = var.region
}

resource "aws_instance" "test_instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  tags = {
    "Name" = "first"
    "Environment" = "dev"
  }
}

resource "aws_instance" "test_instance_2" {
  ami           = var.image_id
  instance_type = var.instance_type
  tags = {
    "Name" = "second"
    "Environment" = "dev"
  }
}