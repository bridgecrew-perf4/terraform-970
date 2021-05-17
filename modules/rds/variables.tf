variable "skip_snapshot" {
    description = "it will skip the final snapshot incase if someone deletes database by accident"
    type = bool
    #default = true # if we do false it will created the final snapshot
}
variable "instance_class" {
    description = " database instance class"
    #default = "db.t2.micro"
    type = string
}
variable "env" {
    description = "name of the environment"
    #default = "dev"
    type = string
}