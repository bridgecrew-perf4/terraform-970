resource "aws_instance" "web_2" {
  ami                    =  data.aws_ami.amazon_linux2.image_id 
  instance_type          =  var.instance_type      
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data = data.template_file.user_data.rendered
  tags = {
    Name        = "webserver_2-${var.env}"
    Environment = var.env
  }
}
data "aws_ami" "amazon_linux2" {
  most_recent      = true
  owners           = ["amazon"] # it can be "self" or "account_number"

 # dictionary or map
  filter { 
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {  
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name =   "root-device-type"
    values = ["ebs"]
  }
}

data "template_file" "user_data"  {
  template = file("template_file/user_data.sh")
  vars = {
    env = var.env
  }
}
resource "aws_security_group" "web_sg" {
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
  security_group_id = aws_security_group.web_sg.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}