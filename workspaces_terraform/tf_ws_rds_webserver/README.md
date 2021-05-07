# Terraform workspaces

In this example I have terraform-nazy-state s3 bucket, which is already created on AWS, and I will use that bucket to store rds.tfstate and webserver.tfstate files. For enviroment isolation for state files I'm using terraform workspace, where I created different workspaces let's say ```dev``` or ```qa``` and deployed my resources from there. 
From the root module I'm calling child rds and webserver modules, where the source for rds and webserver are coming from github repository: 
```
source = "github.com/nazy67/terraform/aws_terraform_modules//modules/web_server"
```
or call it locally just give a relative path
```
source = "../../../aws_terraform_modules/modules/web_server"
```
both works. Webserver child module has a remote_state.tf file where I give the description of rds.tfstate file, which I want to use to retrive a data from rds state file such as address (endpoint) and username of database user. I used the data source for rds state file in webserver child module   the issue I faced it was that terraform wasn't able to find rds.tfstate file so to solve that I have to give a full path to that state file. When I worked with folder structure I just had to path a key and just the name of state file, but in workspace terraform behaves differnently so a I had refer to rds.tfstate by giving a full path.You can either do it from the state file, but just key values because this resources willbe created and the names will be known after the creation in the next line of code can show it better: 
```
data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket =   var.remote_state["bucket"]
    key = "${var.remote_state["workspace_key_prefix"]}/${var.env}/${var.remote_state["key"]}". # here we are just passing key values
    region = var.remote_state["region"]
 }                                                                      
}
```
 in this case root webserver module will look like this:
 ```
  remote_state = {
     bucket = "terraform-nazy-state"
     key = "rds.tfstate"
     region = "us-east-1"
     workspace_key_prefix = "ws-homework"
  } 
}

 ```
 Or we can change it on root webserver module:
 ```
  remote_state = {
     bucket = "terraform-nazy-state"
     key = "ws-homework/${terraform.workspace}/rds.tfstate"
     region = "us-east-1"
     workspace_key_prefix = "ws-homework"
  } 
}
 ```
 and child webserver module data remote_state file will look in the next code:
 ```
 data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket =   var.remote_state["bucket"]
    key = var.remote_state["key"]
    region = var.remote_state["region"]
 }                                                                      
}
 ```
