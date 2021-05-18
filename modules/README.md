# Terraform modules

This folder contain modules that we can call from a root module as a ready templates to provision our infrastructure:

- RDS
- Webserver
- S3 bucket

A `module` in Terraform is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

Modules don't contain providers file or any .terraform folders, because we don't initialize this directories as a working directory. We treat them as a ready templates that we can call instead of building each time our infra from scratch. 