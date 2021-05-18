output "sqs_arn" {
  value = aws_sqs_queue.tf-queue.arn
}

data "aws_sns_topic" "sns-topic" {
  name = "${var.env}-tf-topic"
}