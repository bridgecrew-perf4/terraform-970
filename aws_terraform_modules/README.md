## This template provisions modules in terraform. 

## Prerequisetes
- AWS account
- Terraform installed
- VS Code installed

<p>
In this template we have modules folder (child)  and dev/rds && qa/rds folders, in child folder we leave the part which is all resources are described. We can add additional resources inside of the root module in this case it is pet_name resource, it can be changed depending on which environment you are creating your resources. 
</p>

The reason why we are leaving providers file in modules folder with this keys=values ``` required_version = "~> 0.14.0"``` & ```version = "~> 3.0" ```  because when we call it we are going to  need to have terraform block as well as we will know which version of terraform our code is compatible with. And if someone comes and user our code they will know which version of terraform needs to be used. 
On RDS  example ```isolating environment``` happened using ```folders structure``` where only input variables changed, this is a one way of doing it. In both root modules ```dev``` && ```qa``` we are calling the same child ```rds``` module , but depending on environment its getting created in different environments. For ```qa``` env we added in child module ```pet_name``` resource and called it from there. So it brings us to the conclution that we can use the same template for different environments.

<p>
When we create rds db and  try to refer to it’s remote file from our web-server in root module we won’t be able  to find it because  in child web-server module we have remote state file, and our code will break,  in order to make it to work we use map variables in child web-server module and after that we define those variables in child module’s variables file and after that we should be able to pass our variables the  root web-server module.
When we call user_data from our root web-server module in child module we have to use “template = file("${path.module}/user_data.sh")” , otherwise it will look for the user_data inside of the root module and it won’t file it there, and it will give an error. 
</p>

On AWS console it will look like this:
<img src="aws_terraform_modules/aws.img/terraform-nazy_state.png" alt="aws" width="800" height="500">
Content of state folder:
<img src="content_of_state.png" alt="aws" width="800" height="500">
Content of dev environment folder:
<img src="content_of_dev.png" alt="aws" width="800" height="500">
Content of qa environmetn folder:
<img src="content_of_qa.png" alt="aws" width="800" height="500">

Bash script for changing environment:

```
#!/bin/bash
rm -rf .terraform/terraform.tfstate
ENV="$1"
sed -i ' ' -e "s|__env__|$ENV|" backend.tf
terraform init
echo "Environment is set to $ENV"

```