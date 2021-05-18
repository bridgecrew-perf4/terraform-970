data "aws_ami" "amazon_linux2" {
  most_recent      = true
  owners           = ["amazon"] 

  filter {   
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }
  filter {  
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "default" { 
  default = true
}
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
