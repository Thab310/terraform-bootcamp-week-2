variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

//.aws/config
variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "owner" {
  description = "AWS profile"
  type        = string
  default     = "Thabelo"
}

variable "project_name" {
  description = "Name of project"
  type        = string
  default     = "terraform-bootcamp"
}

