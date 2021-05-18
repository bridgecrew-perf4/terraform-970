output "module_web_lt_id" {
  value = aws_launch_template.web_template.id
  description = "the name of webserver launch template id"
}

output "module_web_asg_arn" {
  value = aws_autoscaling_group.web_asg.arn
  description = "webserver's asg id"
}

output "module_web_alb_arn" {
  value = aws_lb.web_alb.arn
  description = "webserver's load balancer arn"
}

output "module_web_alb_dns" {
  value = aws_lb.web_alb.dns_name
  description = "webserver's load balancer dns"
}

# output "rds_address" { # rds endpoint
#     value = data.terraform_remote_state.rds.outputs.module_address
#     description = "this is the  address of rds instance"
# }

# output "rds_username" {
#     value = data.terraform_remote_state.rds.outputs.module_username
#     description = "this is the  address of rds instance"
# }
