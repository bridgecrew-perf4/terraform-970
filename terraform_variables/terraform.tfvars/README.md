# Terraform variables using terraform.tfvars file

In this example we are passing the values for defined variables for `instance type` and `ami` in the terraform.tfvars file and we are removing default values from the variables.tf file. That way when we run terraform apply we don't have to give a path to the values, terraform will automatically finds them itself.