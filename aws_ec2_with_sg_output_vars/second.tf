
resource "aws_instance" "webserver_2" {
  depends_on             = [ aws_security_group.webserver_2-sg ]
  ami                    = "ami-0be2609ba883822ec"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.webserver_2-sg.id ]
  tags = {
    Name        = "webserver_2"
    Environment = var.env
  }
}
resource "aws_security_group" "webserver_2-sg" {
  name        = "allow_ssh_http"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
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
    Name = "web1_sg_22-80"
  }
}