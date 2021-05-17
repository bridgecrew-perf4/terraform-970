resource "aws_launch_template" "web_template" {
  name_prefix   = "${var.env}-template-"  # when you close it with '-' the rest of the name will be created by aws and will be unique
  image_id      = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}