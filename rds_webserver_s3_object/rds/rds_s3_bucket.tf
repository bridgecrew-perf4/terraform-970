resource "aws_s3_bucket" "rds_bucket" {
  bucket = "${var.env}-remote-rds-bucket"
}

output "aws_remote_rds_bucket" {
  description = "id of rds_s3 bucket"  
  value = aws_s3_bucket.rds_bucket.id
}