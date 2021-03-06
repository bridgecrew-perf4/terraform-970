## S3 bucket module example

In this example for s3 bucket we will be attaching and detaching certain actions to bucket policyThe which will be applicable to bucket itself, not the objects inside of it. The next part of the bucket policy will show it:
```
  statement {
    actions = [
      "s3:ListBucket",
      "s3:DeleteBucket",
      "s3:GetBucketAcl",
      "s3:GetBucketPolicy"
    ]
    resources = [
      aws_s3_bucket.remote_state.arn,
    ]
```
The actions for the bucket policy inside of the bucket, which has two actions we won't touch and it looks like this:
```
  actions = [
    "s3:GetObject",
    "s3:PutObject",
  ]
    resources = [
    "${aws_s3_bucket.remote_state.arn}/*",
  ]
```
To do that we input the action we want to s3 module (child) file, and when we apply from the place where we are refering to that module it can automatically detect the change. 
We can also change the source of our root module , instead of getting it from our local module to module in github. 
```
module "s3_module" {
  source =  "../modules/s3"       ### in this line we change the source 

  s3_bucket_name = var.s3_name
  versioning_enabled = var.is_versioning_enabled
  principals = var.principals_list
  env = var.environment
}
```
After the changing of source to github we run terraform plan it will give us that our infrastructure is up to date, then lets do some changes by adding another action to bucket policy and run terraform plan again, it won't do anything , because since our source is coming from github it doesn't know about our changes, that we made locally, we have to push our code to github.

## Notes
The lifecycle setting all affect how Terraform constucts and rraverses the dependency graph. As a result, only literal values can be used befause the processing happens too early for arbitrary expression evaluation. It means that we can't use prevent destroy as a variable.
When you give a name for your s3 bucket don't use underscore just hyphens are excepted. 