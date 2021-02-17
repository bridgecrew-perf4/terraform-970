resource "aws_launch_template" "web_template" {
  name_prefix   = "${var.env}-web_template-"  # when you close it with '-' the rest of the name will be created by aws and will be unique
  image_id      = data.aws_ami.amazon_linux2.image_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}

# webserver security group
resource "aws_security_group" "webserver_sg" {
  name        = "${var.env}-webserver-sg"
  description = "Allow http inbound traffic to alb"
  tags = {
    Name  = "${var.env}-webserver-sg"
  }
}
resource "aws_security_group_rule" "webserver_http_ingress_from_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = aws_security_group.web_alb_sg.id
  security_group_id = aws_security_group.webserver_sg.id
}
resource "aws_security_group_rule" "webserver_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserver_sg.id
}
# alb sec group
resource "aws_security_group" "web_alb_sg" {
  name        = "${var.env}-app_lb_sg"
  description = "Allow http and https inbound traffic"
  
  tags = {
    Name  = "${var.env}-lb-sg"
  }
}
resource "aws_security_group_rule" "webserver_lb_sg_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_alb_sg.id
}
resource "aws_security_group_rule" "webserver_lb_sg_https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_alb_sg.id
}  
resource "aws_security_group_rule" "webserver_lb_sg_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_alb_sg.id
}