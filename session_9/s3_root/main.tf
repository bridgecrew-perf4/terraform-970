module "s3" {
  source =  "github.com/nazy67/terraform//modules/s3"

  s3_bucket_name = var.s3_name
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
  env = var.environment
}