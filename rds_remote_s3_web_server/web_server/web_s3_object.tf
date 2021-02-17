resource "aws_s3_bucket_object" "object" {
  bucket = data.terraform_remote_state.rds.outputs.aws_remote_rds_bucket
  key    = "info.txt"
  content = "template_file/user_data.sh"
}