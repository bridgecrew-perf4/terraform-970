## Workspace on terraform

Workspaces that we used before was a default workspace, but we can create our own custom workspace using terraform workspace commands:
```new``` ```list``` ```show``` ```select``` ```delete```

List will list workspaces, 
```
terraform workspace list
```
show will show the current workspace, 
```
terraform workspace show
```
Terraform workspace new will create a new workspace,
```
terraform workspace new
```
delete command will delete the workspace

```
terraform workspace new
```
Select command will select the workspace
```
terraform workspace select
```
As an example we will create dev workspace and will work from there, that is how we isolate our environment. Previously, when we worked with  environment isolation our resources names were changing depending on which  environment its getting created by passing variables , but when we use workspace for environment isolation the names our resources won’t change,  because resources are getting created in different environment and the identical names are not issue to get created. But since we don’t won’t our resources with the same names , it will get confusing really fast. The name issue we solve with environmental variables as well by passing variables file. In our previous world isolation examples if we do that terraform would go and change the name of our resource let’s say from dev to qa depending what variables file we are passing. But in workspaces example we are not facing that issue, because we are applying from different workspaces. 