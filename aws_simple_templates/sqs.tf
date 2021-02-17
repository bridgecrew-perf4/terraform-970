resource "aws_sqs_queue" "terraform_queue" {
  name                      = "terraform-example-queue"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = data.aws_sns_topic.example.arn 
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.terraform_queue.arn
}

data "aws_sns_topic" "example" {
  name = "terraform-example"
}

output "sqs_arn" {
  value = aws_sqs_queue.terraform_queue.arn 
}