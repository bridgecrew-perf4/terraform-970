output "webserver_ids" {
    value = aws_instance.web_2.id
    description = "webserver id"
}
output "webserver_public_ip" {
  value = aws_instance.web_2.public_ip
  description = "webservers public ip address"
}
output "webserver_sg_name" {
  value = aws_security_group.web_sg.name
  description = "the name of web_sg"
}