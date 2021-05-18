variable "s3_name" {
  type = string
}
variable "is_versioning_enabled" {
  type = bool
  default = true
}
variable "principals_list" {
  type = list(string)
}
variable "environment" {
}