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

variable "ami" {
  default = "ami-03ca36368dbc9cfa1"
}

variable "instance_type" {
  description = "ec2 instance type"
}






