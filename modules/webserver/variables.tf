variable "env" {
    description = "name of the environment"
    type = string
}

variable "instance_type" {
    description = "instance type"
    type = string
}

variable "remote_state" {
  description = "remote state"
  type = map(string)
}
