# Terraform modules

This folder contain modules that we can call from a root module as a ready templates to provision our infrastructure:

- RDS
- Webserver
- S3 bucket

A `module` in Terraform is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

Modules don't contain providers file or any .terraform folders, because we don't initialize this directories as a working directory. We treat them as a ready templates that we can call instead of building each time our infra from scratch.

In webserver remote_state file we created a data source for rds.tfstate file, but since we want our template to be reusable, we have to use variables in this block so we can call that rds.tfstate file in a root module we can pass the right tfstate file. It looks like this,
```
data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = var.remote_state["bucket"]
    key    = var.remote_state["key"]
    region = var.remote_state["region"]
  }
}

defined remote_state in variables.tf in webserver child module:

```
.......
variable "remote_state" {
  description = "remote state"
   type = map(string)
 }
```

```
And when we call it we just pass values of our bucket,
```
module "webserver_module" {
  .............
  remote_state = {
    bucket               = "terraform-nazy-state"
    key                  = "${var.env}/rds.tfstate"
    region               = "us-east-1"
    workspace_key_prefix = "ws-homework"
  }
}
```
## Useful links

[Creating Modules](https://www.terraform.io/docs/language/modules/develop/index.html)
