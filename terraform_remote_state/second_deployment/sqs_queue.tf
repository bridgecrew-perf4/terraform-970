resource "aws_sqs_queue" "tf-queue" {
  name     = "${var.env}-tf-queue"
}

resource "aws_sqs_queue_policy" "sqs-policy" {
  queue_url = aws_sqs_queue.tf-queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.tf-queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${data.aws_sns_topic.tf-topic.arn}"
        }
      }
    }
  ]
}
POLICY
}
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = data.terraform_remote_state.sns.outputs.aws_sns_topic
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.tf-queue.arn
}