s3_bucket = "s3_bucket_nazy_qa"
is_versioning_enabled = true
environment = "qa"
principals_list = ["arn:aws:iam::${var.account_id}:user/tf-user"] 