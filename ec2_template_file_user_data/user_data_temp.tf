
resource "aws_instance" "first_ec2" {
  depends_on             = [aws_security_group.first_sg]
  ami                    = "ami-0be2609ba883822ec"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.first_sg.id]
  user_data = data.template_file.user_data.rendered
  tags = {
    Name        = "webserver_2-${var.env}"
    Environment = var.env
  }
}

data "template_file" "user_data"  {
  template = file("template_file/user_data.sh")
  vars = {
    env = var.env
  }
}

resource "aws_security_group" "first_sg" {
  name        = "allow_http"
  description = "Allow TLS inbound traffic"
  tags = {
    Name  = "allow_http"
  }
}
resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.first_sg.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.first_sg.id
}