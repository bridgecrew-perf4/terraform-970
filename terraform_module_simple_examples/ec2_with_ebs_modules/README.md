This example template describes resource details of an ec2 instance, ebs volume "/dev/sdh" and attachement of it to ec2 instance, and also creates cloudwatch metric alarm for the CPU utilization of ec2, and as a dimensions you can specify instance id. In the link you can get more information about to which resources you can create a cloudwatch alarm.
In the root module as usual you give provider that you want to use and module name and source it's coming from, in this case it is ec2-module. 


# Useful link

[Resource: aws_cloudwatch_metric_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)

[AWS Services That Publish CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)