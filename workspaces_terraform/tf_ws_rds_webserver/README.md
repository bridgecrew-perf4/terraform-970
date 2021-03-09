In this example I have terraform-nazy-state s3 bucket, which is already created on AWS, and I will use that bucket to store rds.tfstate and webserver.tfstate files. For enviroment isolation for state files I'm using terraform workspace, where I created different workspaces let's say ```dev``` or ```qa``` and deployed my resources from there. 
From the root module I'm calling child rds and webserver modules, where the source for rds and webserver are coming from github repository: 
```
source = "github.com/nazy67/terraform/aws_terraform_modules//modules/web_server"
```
or call it locally
```
source = "../../../aws_terraform_modules/modules/web_server"
```
both works. Webserver child module has a remote_state.tf file where I give the description of rds.tfstate file, which I want to use to retrive a data from rds state file such as address (endpoint) and username of database user. I used the data source for rds state file in webserver child module   the issue I faced it was that terraform wasn't able to find to find rds.tfstate file so to solve that I have to give a full path to that state file. When I worked with folder structure I just had to path a key value we had a this case rds-state file and refer to it from a root module you need to give a full path for that rds-state file , otherwise terraform isn't able to find it. 