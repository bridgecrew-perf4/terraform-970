This example shows how to create an ec2 instance using a powerful terraform modules. In child module we have a description of an ec2 with ami data. Instead of each time going and getting an ami of the machine that we want to use we just simply give information about ami and terraform will go and get it for us. The process of it pretty simple on aws cli you can output describtion of the ami you want to use by running command:
```
    aws ec2 describe-images \
    --region us-east-1 \
    --image-ids ami-07817f5d0e3866d32
```
It will give you an output like this:
```
{
    "Images": [
        {
            "VirtualizationType": "hvm", 
            "Description": "Amazon Linux 2 AMI 2.0.20201218.1 x86_64 HVM gp2", 
            "PlatformDetails": "Linux/UNIX", 
            "EnaSupport": true, 
            "Hypervisor": "xen", 
            "ImageOwnerAlias": "amazon", 
            "State": "available", 
            "SriovNetSupport": "simple", 
            "ImageId": "ami-0be2609ba883822ec", 
            "UsageOperation": "RunInstances", 
            "BlockDeviceMappings": [
                {
                    "DeviceName": "/dev/xvda", 
                    "Ebs": {
                        "SnapshotId": "snap-019159f1e06f32720", 
                        "DeleteOnTermination": true, 
                        "VolumeType": "gp2", 
                        "VolumeSize": 8, 
                        "Encrypted": false
                    }
                }
            ], 
            "Architecture": "x86_64", 
            "ImageLocation": "amazon/amzn2-ami-hvm-2.0.20201218.1-x86_64-gp2", 
            "RootDeviceType": "ebs", 
            "OwnerId": "137112412989", 
            "RootDeviceName": "/dev/xvda", 
            "CreationDate": "2020-12-21T22:40:12.000Z", 
            "Public": true, 
            "ImageType": "machine", 
            "Name": "amzn2-ami-hvm-2.0.20201218.1-x86_64-gp2"
        }
    ]
}
```
From here you can take an info and create aws_ami data:
```
data "aws_ami" "amazon_linux2" {
  most_recent      = true
  owners           = ["137112412989"] 

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
```
In the parent module we gave provider that we want to use and instead of giving a resource details we are using module and giving a path for the source to the child module, where we have all the detailes for ec2 instance. 