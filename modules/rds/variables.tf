variable "skip_snapshot" {
    description = "it will skip the final snapshot incase if someone deletes database by accident"
    type = bool
    #default = true # if we do false it will created the final snapshot
}

variable "instance_class" {
    description = " database instance class"
    type = string
}

variable "env" {
    description = "name of the environment"
    type = string
}

variable "storage" {
  description = "size of the storage"
  type    = string
}

variable "username" {
  description = "username of the database user"  
  type    = string
}
