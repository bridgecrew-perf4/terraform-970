resource "aws_instance" "ec2" {
  for_each = {
    first = "web"
    second = "db"
  }  
  ami                    = var.ami
  instance_type          = var.instance_type
  tags = {
    "Name" = each.value #by giving this value you create ec2 with different names
  }
}
output "ec2_name" {
  value = aws_instance.ec2["first"].arn
}