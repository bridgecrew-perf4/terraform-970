resource "aws_s3_bucket" "remote_state" {
  bucket = var.s3_bucket_name

  versioning {
    enabled = var.versioning_enabled
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  lifecycle {
      prevent_destroy = false
  }
    tags = {
    Name        = var.s3_bucket_name
    Environment = var.env
  }
}

resource "aws_s3_bucket_policy" "state_policy" {
  bucket = aws_s3_bucket.remote_state.id
  policy = data.aws_iam_policy_document.state_policy_document.json
}

data "aws_iam_policy_document" "state_policy_document" {
  statement {
    sid = "RemoteStatePolicy"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.remote_state.arn}/*",
    ]

    principals {
        type = "AWS"
        identifiers = var.principals
    }
  }

  statement {
    actions = [
      "s3:ListBucket",
      "s3:DeleteBucket",
      "s3:GetBucketAcl",
      "s3:GetBucketPolicy"
    ]

    resources = [
      aws_s3_bucket.remote_state.arn,
    ]

    principals {
        type = "AWS"
        identifiers = var.principals
    }
  }
}