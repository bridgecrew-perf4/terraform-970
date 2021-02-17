resource "aws_s3_bucket" "remote_rds_state" {
  bucket = "${var.env}-remote_rds_bucket"
}

output "aws_remote_rds_bucket" {
  description = "id of rds_s3 bucket"  
  value = aws_s3_bucket.remote_rds_state.id
}