resource "aws_instance" "webserver_1" {
  depends_on  = [ aws_security_group.webserver_1-sg ]
  ami         = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.webserver_1-sg.id ] 

  tags = {
    Name = "webserver_1"
    Environment = var.env
  }
}
resource "aws_security_group" "webserver_1-sg" {
  name        = "allow_22_80"
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
    Name = "web2_sg_22-80"
  }
}  