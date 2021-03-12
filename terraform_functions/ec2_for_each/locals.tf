locals {
  tags = {
    Name        = "${var.env}-ec2"
    Environment = var.env
  }
}