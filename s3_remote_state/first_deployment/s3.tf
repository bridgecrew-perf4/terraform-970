resource "aws_s3_bucket" "remote-bucket" {
  bucket = "${var.env}-remote-bucket"
}

output "aws_remote-bucket" {
  description = "id of s3 bucket"  
  value = aws_s3_bucket.remote-bucket.id
}