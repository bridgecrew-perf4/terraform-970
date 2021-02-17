variable "skip_snapshot" {
    type = bool
    default = true
}
variable "instance_class" {
    description = "instance class"
    default = "db.t2.micro"
    type = string
}
variable "env" {
    description = "name of the env"
    default = "dev"
    type = string
}