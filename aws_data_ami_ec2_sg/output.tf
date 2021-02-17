output "ec2_public_ip" {
  value = aws_instance.web_2.public_ip
}
output "sg_name" {
  value = aws_security_group.web_sg.name
}
output "ec2_instance_state" {
  value = aws_instance.web_2.instance_state
}
output "sg_arn" {
  value = aws_security_group.web_sg.arn
}
output "amazon_linux2_id" {
    value = data.aws_ami.amazon_linux2.id  
}