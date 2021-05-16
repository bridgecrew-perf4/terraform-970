variable "env" {
  type    = string
  default = "dev"
}

variable "skip_snapshot" {
  type    = bool
  default = true
}

variable "storage" {
  type    = string
}

variable "instance_class" {
  type    = string
}

variable "username" {
  type    = string
}
