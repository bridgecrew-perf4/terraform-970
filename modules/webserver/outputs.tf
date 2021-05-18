output "web_lt_id" {
  value = aws_launch_template.web_template.id
  description = "the name of webserver launch template id"
}

output "web_asg_arn" {
  value = aws_autoscaling_group.web_asg.arn
  description = "webserver's asg id"
}

output "web_alb_arn" {
  value = aws_lb.web_alb.arn
  description = "webserver's load balancer arn"
}

output "web_alb_dns" {
  value = aws_lb.webserver_alb.dns_name
  description = "webserver's load balancer dns"
}
