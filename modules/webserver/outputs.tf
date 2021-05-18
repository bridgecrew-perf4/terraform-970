output "webserver_launch_template_id" {
  value = aws_launch_template.web_template.id
  description = "the name of webserver launch template id"
}

output "webserver_asg_arn" {
  value = aws_autoscaling_group.web_asg.arn
  description = "webserver's asg id"
}

output "webserver_alb_arn" {
  value = aws_lb.web_alb.arn
  description = "webserver's load balancer arn"
}