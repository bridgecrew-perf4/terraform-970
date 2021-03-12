variable "env" {
  description = "name of the env"
  default = "dev"
  type = string
}

variable "instance_type" {
  description = "instance type"
  default = "t2.micro"
  type = string
} 
variable "ami" { 
  description = "ami"
  default = "ami-0be2609ba883822ec"
  type = string
} 