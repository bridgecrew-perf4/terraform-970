resource "aws_security_group" "sg-one" { # this sg will use the default provider us-east-1
  name        = "ec2-sg"
  description = "ec2 example sg"

  ingress {
    description = "TLS from VPC"
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
    Name = "east-1"
  }
}

resource "aws_security_group" "sg-two" {  # this sg will use provider us-east-2
  
  provider = aws.east-2
  
  name        = "ec2-sg"
  description = "ec2 example sg"

  ingress {
    description = "TLS from VPC"
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
    Name = "east-2"
  }
}