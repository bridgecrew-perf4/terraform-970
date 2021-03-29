resource "aws_instance" "ec2-instance" {
    ami = data.aws_ami.amazon_linux2.id
    instance_type = "t2.micro"
}

data "aws_ami" "amazon_linux2" {
  most_recent      = true
  owners           = ["137112412989"]

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



