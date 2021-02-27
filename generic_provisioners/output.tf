output "webserver_ids" {
    value = aws_instance.prov_host.id
    description = "web host id"
}
output "web_host_sg" {
  value = aws_security_group.provisioners_sg.name
  description = "the name of web host sg"
}
output "public_ip" {
  value = aws_instance.prov_host.public_ip
  description = "webservers public ip address"
}