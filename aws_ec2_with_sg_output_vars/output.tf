output "webserver_1_public_ip" {
  value = aws_instance.webserver_1.public_ip
  description = "the public ip of webserver_1"
}
output "webserver_1-sg_name" {
  value = aws_security_group.webserver_1-sg.name
  description = "the name of webserver_1 sg"
}
output "webserver_2_public_ip" {
  value = aws_instance.webserver_2.public_ip
  description = "the public ip of webserver_2"
}
output "webserver_2-sg_name" {
  value = aws_security_group.webserver_2-sg.name
  description = "the name of webserver_2 sg"
}
output "ec2_instance_state" {
  value = aws_instance.webserver_1.instance_state
}