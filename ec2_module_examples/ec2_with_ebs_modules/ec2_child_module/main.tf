# EC2 instance
resource "aws_instance" "ec2-instance" {
    ami = data.aws_ami.amazon_linux2.id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
}

data "aws_ami" "amazon_linux2" {
  most_recent      = true
  owners           = ["137112412989"] # owner of the ami

  filter { 
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {  
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name =   "root-device-type"
    values = ["ebs"]
  }
}

#EBS Volume and Attachment
resource "aws_ebs_volume" "my-volume" {
   availability_zone = var.availability_zone
   size              = 10
   
   tags = {
     "Name" = "extra-drive"
   }
}

resource "aws_volume_attachment" "my-extra-drive" {
   device_name = "/dev/sdh"
   volume_id   = aws_ebs_volume.my-volume.id
   instance_id = aws_instance.ec2-instance.id
}

#Cloudwatch Metric
resource "aws_cloudwatch_metric_alarm" "cpu-of-ec2" {
 alarm_name = "tf-alarm"
 comparison_operator = "GreaterThanOrEqualToThreshold"
 evaluation_periods = 2
 metric_name = "CPUUtilization"
 namespace = "AWS/EC2"
 period = "120"
 statistic = "Average"
 threshold = "80"
 alarm_description = "this is a metric for ec2 cpu utilization"
 insufficient_data_actions = []

 dimensions = {
   "InstanceId" = aws_instance.ec2-instance.id
 }
}