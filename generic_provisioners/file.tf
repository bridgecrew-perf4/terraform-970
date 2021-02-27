resource "aws_instance" "prov_host" {
  ami                    =  data.aws_ami.amazon_linux2.image_id 
  instance_type          =  var.instance_type      
  vpc_security_group_ids = [aws_security_group.provisioners_sg.id]
  key_name = "Nazy'sMacKey"
  tags = {
    Name        = "prov_host-${var.env}"
    Environment = var.env
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("/Users/nazgulkhalilova/.ssh/id_rsa") 
  }

  provisioner "file" {
    content = "terraform file"
    destination = "/tmp/file.txt"
  }
}
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

resource "aws_security_group" "provisioners_sg" {
  name        = "my-web-sg"
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
  security_group_id = aws_security_group.provisioners_sg.id
}
resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.provisioners_sg.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.provisioners_sg.id
}