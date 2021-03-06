resource "aws_sns_topic" "tf-topic" {
  name         = "${var.env}-tf-topic"
  display_name = "${var.env}-display_name"

  tags = {
    testKey = "key from terraform"
    key2 = "value2"
  }
}
output "aws_sns_topic" {
  description = "arn of sns topic"  
  value = aws_sns_topic.tf-topic.arn
}