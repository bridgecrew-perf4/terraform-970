locals {
  common_tags = {
    Environment = var.env
    Project     = "${var.env}-application"
    Team        = "Development"
    Owner       = "admin"
  }
}