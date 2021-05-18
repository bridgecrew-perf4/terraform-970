# Terraform with environmenatal variables

In this example of using variables in terraform we are exporting variables in the command line by running next commands:

```
export TF_VAR_instance_type=t2.micro
export TF_VAR_image_id=ami-0be2609ba883822ec 
```

after that we are deleting default values from the variables.tf file, but Terraform will be able to get those values from environmental variables.