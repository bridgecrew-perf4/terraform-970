variable "s3_bucket_name" {
    description = "the name of s3 bucket"
    type = string
}
variable "versioning_enabled" {
    description = "enable versioning of s3 bucket"
    type = bool
    default = true
}
variable "principals" {
  type = list(string)
}
variable "env" {
  type = string
}