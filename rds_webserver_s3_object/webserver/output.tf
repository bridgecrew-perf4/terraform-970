output "web_lt_id" {
  value = aws_launch_template.web_template.id
  description = "the name of webserver launch template id"
} 

output "web_asg_arn" {
  value = aws_autoscaling_group.webserver_asg.arn
  description = "webserver's asg id"
}

output "web_alb_arn" {
  value = aws_lb.webserver_alb.arn
  description = "webserver's load balancer arn"
}

output "rds_endpoint" {
    value = data.terraform_remote_state.rds.outputs.address
    description = "this is the  address of rds instance"
}
output "rds_username" {
    value = data.terraform_remote_state.rds.outputs.username
    description = "this is the  address of rds instance"
}