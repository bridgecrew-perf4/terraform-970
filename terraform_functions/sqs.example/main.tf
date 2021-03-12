resource "aws_sqs_queue" "terraform-queue" {
    name = format("%s-terraform-function-queue", var.env)
    tags = local.tags
}

variable "env" {
  type = string
  default = "dev01-us"
}

locals {
  env_to_owner = {
      "dev" = "devowner@test.com"
      "prd" = "prdowner@test.com"
      "stg" = "stgowner@test.com"
  }

  env_short = substr(var.env, 0, 3)

  tags = {
      enviroment = var.env
      enviroment_type = local.env_short
      enviroment_version = regex("[0-9]+", var.env)
      owner = lookup(local.env_to_owner, local.env_short, "devowner@test.com" )

  }
}