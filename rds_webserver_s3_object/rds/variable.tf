variable "skip_snapshot" {
    description = "it will skip the final snapshot incase if someone deletes database by accident"
    type = bool
    default = true
}
variable "instance_class" {
    description = " database instance class"
    type = string
    default = "db.t2.micro"
}
variable "env" {
    description = "name of the environment"
    type = string
    default = "dev"
}