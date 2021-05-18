resource "aws_launch_template" "web_template" {
  name_prefix   = "${var.env}_web_template-"  # when you close it with '-' the rest of the name will be created by aws and will be unique
  image_id      = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  
  lifecycle {
    create_before_destroy = true
  }
  user_data       = filebase64("${path.module}/user_data.sh")

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_web_lt"
    }
  )
}
