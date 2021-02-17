output "ec2_public_ip" {
  value = aws_instance.first_ec2.public_ip
}
output "sg_name" {
  value = aws_security_group.web_instance_sg_allow_80_22.name
}  