data "aws_sns_topic" "tf-topic" {
  name = "${var.env}-tf-topic"
}