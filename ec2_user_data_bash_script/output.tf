output "ec2_public_ip" {
  value = aws_instance.web_instance.public_ip
}
output "sg_name" {
  value = aws_security_group.web_instance_sg_allow_80_22.name
}
output "ec2_instance_state" {
  value = aws_instance.web_instance.instance_state
}
output "sg_arn" {
  value = aws_security_group.web_instance_sg_allow_80_22.arn
}