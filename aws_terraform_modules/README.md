## This template provisions modules in terraform. 

## Prerequisetes
- AWS account
- Terraform 

<p>
In this template we have modules folder (child)  and dev/rds && qa/rds folders, in child folder we leave the part which is all resources are described. We can add additional resources inside of the root module in this case it is pet_name resource, it can be changed depending on which environment you are creating your resources. 
</p>

The reason why we are leaving providers file in modules folder with this keys=values ``` required_version = "~> 0.14.0"``` & ```version = "~> 3.0" ```  because when we call it we are going to  need to have terraform block as well as we will know which version of terraform our code is compatible with. And if someone comes and user our code they will know which version of terraform needs to be used. 
On RDS  example ```isolating environment``` happened using ```folders structure``` where only input variables changed, this is a one way of doing it. In both root modules ```dev``` && ```qa``` we are calling the same child ```rds``` module , but depending on environment its getting created in different environments. For ```qa``` env we added in child module ```pet_name``` resource and called it from there.So it brings us to the conclution that we can use the same template for different environments.

