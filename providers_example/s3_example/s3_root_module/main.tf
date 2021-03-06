module "s3_one" {
  source =  "../../s3_example/s3_module" 

  s3_bucket_name = "east-1-${var.s3_name}"
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
  env = var.environment
}

module "s3_two" {
  source =  "../../s3_example/s3_module"

  s3_bucket_name = "east-2-${var.s3_name}"
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
  env = var.environment
  providers = {  # map instead of string
    aws = aws.east-2
  }
}