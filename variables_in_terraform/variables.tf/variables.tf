variable "region" {
  type = string
  default = "us-east-1"
}
variable "image_id" {
  type = string
  default = "ami-0be2609ba883822ec"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "tags" {
  type = map
  
  default = {
      "Name" = "my-ec2"
      "Environment" = "dev"
  }
}