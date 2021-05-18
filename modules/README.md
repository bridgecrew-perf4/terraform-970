# Terraform modules

A `module` in Terraform is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

This folder contains `rds` and `webserver` modules that we can call from a root module, 



both of them storing their state file remotely in the S3 bucket. You treat the state file as a sensitive file, always use the encryption, because it contains sensitive data such as admins password for example. We can even retrieve some data from rds.tfstate file inside of webserver folder and for that we create data_source as it shown in `remote_state.tf` file.

 will go and read from the terraform_remote_state rds file, not write. Access to that file should be restricted not publicly open. Without  exposing  resources in  rds's output file we can't read the rds_remote_state file

That way we can  from rds.tfstate file inside of the webserver.
about existing resources

In outputs file I  used sensitive = true because i dont want it to be shown to anyone its a sensitive information. For the sake of this demo i choose to use t2.micro instance type for ec2 instance and for rds instance its db.t2.micro. In the skip_final_snapshot  section if the value is true don't make a final snapshot in dev env, if it's different env make  a snapshot.  In line 12 it  if check condition in one line, if the value is true dont make a snapshot, then if the value is false value make a snapshot.

.

RDS backend rds_tfstate is writing to terraform_nazy_state s3 bucket, and webserver is reading from that backend, but webserver itself writing to defferent backend webserver.tfstate in terraform_nazy_state s3 bucket.

Remote_state file was created to read from rds remote_state file  in 
this case its stored in s3 bucket. You treat this remote_state file 
as a sensitive file , because it contains sensitive data, not everyone 
can have access to it.