# EC2 instance
resource "aws_instance" "first_ec2" {
  depends_on          = [ aws_security_group.web_instance_sg_allow_80_22 ]
  ami                 = "ami-0be2609ba883822ec"
  instance_type       = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.web_instance_sg_allow_80_22.id ]
  user_data     = data.local_file.user_data.content
  tags = {
    Name        = "webserver_1"
    Environment = var.env
  }
}
data "local_file" "user_data" {
  filename = file("user_data.sh")
}

# Security group
resource "aws_security_group" "web_instance_sg_allow_80_22" {
  name        = "web_instance_sg"
  description = "security group for webserver"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_instance_sg"
  }
}