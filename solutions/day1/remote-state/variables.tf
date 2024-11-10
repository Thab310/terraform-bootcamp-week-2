variable "profile" {
  type        = string
  description = "AWS IAM profile name"
  default     = "default"
}
variable "owner" {
  type        = string
  description = "Email address of the Engineer that is provisioning the services"
  default     = "Thabelo"
}
variable "region" {
  type        = string
  description = "AWS deployment regions"
  default     = "eu-west-1"
}
# variable "bucket_name" {
#   type        = string
#   description = "aws globally unique name of s3 bucket"
#   default     = data.aws_secretsmanager_secret_version.secret-version.secret_string
# }