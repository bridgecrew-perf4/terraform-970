output "ec2_public_ip" {
  value = aws_instance.first_ec2.public_ip
}
output "sg_name" {
  value = aws_security_group.first_sg.name
}
output "ec2_instance_state" {
  value = aws_instance.first_ec2.instance_state
}
output "sg_arn" {
  value = aws_security_group.first_sg.arn
}